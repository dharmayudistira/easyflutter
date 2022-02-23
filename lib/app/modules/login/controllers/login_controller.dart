import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easyflutter/app/routes/app_pages.dart';
import 'package:easyflutter/app/utils/encrypt_helper.dart';
import 'package:easyflutter/app/utils/snackbar_helper.dart';
import 'package:easyflutter/app/utils/storage_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final _storageHelper = Get.find<StorageHelper>();
  final _firestore = FirebaseFirestore.instance;
  final listLoginType = ["Mahasiswa", "Dosen"].obs;
  

  late TextEditingController edtControllerId;
  late TextEditingController edtControllerPassword;

  var isObscured = true.obs;
  var selectedLoginType = "Mahasiswa".obs;

  var isFormIdEmpty = false.obs;

  void setObscuredPassword() {
    isObscured.toggle();
  }

  @override
  void onInit() {
    super.onInit();

    edtControllerId = TextEditingController();
    edtControllerPassword = TextEditingController();
  }

  @override
  void onClose() {
    edtControllerId.dispose();
    edtControllerPassword.dispose();

    super.onClose();
  }

  void login(BuildContext context, bool isValid) {
    if (isValid == true) {
      final id = edtControllerId.text;
      final password = edtControllerPassword.text;

      if (selectedLoginType.value == "Dosen") {
        doLoginAsLecturer(id, password, context);
      } else {
        doLoginAsStudent(id, password, context);
      }
    }
  }

  void doLoginAsLecturer(
    String id,
    String password,
    BuildContext context,
  ) async {
    QuerySnapshot<Map<String, dynamic>> lecturerReference = await _firestore
        .collection("dosen")
        .where("id_dosen", isEqualTo: id)
        .get();

    if (lecturerReference.docs.isNotEmpty) {
      final selectedLecturer = lecturerReference.docs[0];
      final encryptedPassword = generateMd5(password);

      if (selectedLecturer["kata_sandi"] == encryptedPassword) {
        await saveLecturerDataToSharedPref(selectedLecturer);
        clearForm();
        Get.offNamed(Routes.DASHBOARD_LECTURER);
        SnackBarHelper.showFlushbarSuccess(
          "Sukses",
          "Selamat Datang, ${_storageHelper.getNameUser()}",
        )..show(context);
      } else {
        SnackBarHelper.showFlushbarWarning(
          "Peringatan",
          "Mohon periksa kembali kata sandi Anda",
        )..show(context);
      }
    } else {
      SnackBarHelper.showFlushbarWarning(
        "Peringatan",
        "Dosen dengan NIDN $id tidak ditemukan",
      )..show(context);
    }
  }

  void doLoginAsStudent(
    String id,
    String password,
    BuildContext context,
  ) async {
    QuerySnapshot<Map<String, dynamic>> studentReference = await _firestore
        .collection("mahasiswa")
        .where("id_mahasiswa", isEqualTo: id)
        .get();

    if (studentReference.docs.isNotEmpty) {
      final selectedStudent = studentReference.docs[0];
      final encryptedPassword = generateMd5(password);

      if (selectedStudent["kata_sandi"] == encryptedPassword) {
        if (selectedStudent["status"] == true) {
          await saveStudentDataToSharedPref(selectedStudent);
          clearForm();
          Get.offNamed(Routes.DASHBOARD_STUDENT);
          SnackBarHelper.showFlushbarSuccess(
            "Sukses",
            "Selamat Datang, ${_storageHelper.getNameUser()}",
          )..show(context);
        } else {
          SnackBarHelper.showFlushbarInfo(
            "Informasi",
            "Mohon tunggu validasi dari dosen pengampu Anda",
          )..show(context);
        }
      } else {
        SnackBarHelper.showFlushbarWarning(
          "Peringatan",
          "Mohon periksa kembali kata sandi Anda",
        )..show(context);
      }
    } else {
      SnackBarHelper.showFlushbarWarning(
        "Peringatan",
        "Mahasiswa dengan NIM $id tidak ditemukan",
      )..show(context);
    }
  }

  Future<void> saveLecturerDataToSharedPref(
      QueryDocumentSnapshot<Map<String, dynamic>> selectedLecturer) async {
    await _storageHelper.setIdUser(selectedLecturer["id_dosen"]);
    await _storageHelper.setPasswordUser(selectedLecturer["kata_sandi"]);
    await _storageHelper.setNameUser(selectedLecturer["nama_dosen"]);
    await _storageHelper.setIsLoginLecturer(true);
  }

  Future<void> saveStudentDataToSharedPref(
      QueryDocumentSnapshot<Map<String, dynamic>> selectedStudent) async {
    await _storageHelper.setIdUser(selectedStudent["id_mahasiswa"]);
    await _storageHelper.setPasswordUser(selectedStudent["kata_sandi"]);
    await _storageHelper.setNameUser(selectedStudent["nama_mahasiswa"]);
    await _storageHelper.setIsLoginStudent(true);
    await _storageHelper.setIdClassUser(selectedStudent["id_kelas"]);
  }

  void clearForm() {
    edtControllerId.clear();
    edtControllerPassword.clear();
  }
}
