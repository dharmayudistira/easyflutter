import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easyflutter/app/routes/app_pages.dart';
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

  void login() {
    final id = edtControllerId.text;
    final password = edtControllerPassword.text;

    if (selectedLoginType.value == "Dosen") {
      doLoginAsLecturer(id, password);
    } else {
      doLoginAsStudent(id, password);
    }
  }

  void doLoginAsLecturer(String id, String password) async {
    QuerySnapshot<Map<String, dynamic>> lecturerReference = await _firestore
        .collection("dosen")
        .where("id_dosen", isEqualTo: id)
        .get();

    if (lecturerReference.docs.isNotEmpty) {
      final selectedLecturer = lecturerReference.docs[0];

      if(selectedLecturer["kata_sandi"] == password) {
        saveLecturerDataToSharedPref(selectedLecturer);
        Get.snackbar("Berhasil Masuk", "Selamat Datang! ${_storageHelper.getNameUser()}");
        Get.offNamed(Routes.DASHBOARD_LECTURER);
      }else {
        Get.snackbar("Terjadi Kesalahan", "Mohon periksa kembali ID dan kata sandi Anda");
      }

    } else {
      Get.snackbar("Terjadi Kesalahan", "Tidak ada dosen dengan ID : $id");
    }
  }

  void doLoginAsStudent(String id, String password) {}

  void saveLecturerDataToSharedPref(QueryDocumentSnapshot<Map<String, dynamic>> selectedLecturer) async {
    await _storageHelper.setIdUser(selectedLecturer["id_dosen"]);
    await _storageHelper.setPasswordUser(selectedLecturer["kata_sandi"]);
    await _storageHelper.setNameUser(selectedLecturer["nama_dosen"]);
    await _storageHelper.setIsLoginUser(true);
  }
}
