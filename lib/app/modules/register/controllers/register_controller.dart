import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easyflutter/app/data/class_model.dart';
import 'package:easyflutter/app/data/dosen_model.dart';
import 'package:easyflutter/app/routes/app_pages.dart';
import 'package:easyflutter/app/utils/converter_helper.dart';
import 'package:easyflutter/app/utils/encrypt_helper.dart';
import 'package:easyflutter/app/utils/snackbar_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  final lecturerReference = FirebaseFirestore.instance.collection("dosen");
  final classReference = FirebaseFirestore.instance.collection("kelas");
  final studentReference = FirebaseFirestore.instance.collection("mahasiswa");
  

  late TextEditingController edtStudentIdController;
  late TextEditingController edtStudentPasswordController;
  late TextEditingController edtStudentNameController;

  final initialLecturer = LecturerModel(
    lecturerId: "null",
    lecturerName: "Pilih Dosen",
    lecturerPassword: "null",
  );

  var isValid = true;
  var isObscured = true.obs;
  var isClassHidden = true.obs;
  var listLecturer = <LecturerModel>[].obs;
  var listClass = <ClassModel>[
    ClassModel(
        classId: "null",
        className: "Pilih Kelas",
        lecturerId: null,
        lecturerName: null),
  ].obs;

  var selectedLecturer = LecturerModel().obs;
  var selectedClass = "Pilih Kelas".obs;

  @override
  void onInit() {
    super.onInit();

    edtStudentIdController = TextEditingController();
    edtStudentPasswordController = TextEditingController();
    edtStudentNameController = TextEditingController();

    listLecturer.add(initialLecturer);
    selectedLecturer.value = initialLecturer;
  }

  @override
  void onClose() {
    edtStudentIdController.dispose();
    edtStudentPasswordController.dispose();
    edtStudentNameController.dispose();

    super.onClose();
  }

  void setObscuredPassword() {
    isObscured.toggle();
  }

  Stream<QuerySnapshot> getAllLecturer() {
    return lecturerReference.snapshots();
  }

  Stream<QuerySnapshot> getClassByLecturer() {
    final lecturerId = selectedLecturer.value.lecturerId;
    return classReference.where("id_dosen", isEqualTo: lecturerId).snapshots();
  }

  void mapLecturerFirestoreToLecturerModel(
      AsyncSnapshot<QuerySnapshot> snapshots) {
    final result =
        ConverterHelper.mapLecturerFirestoreToLecturerModel(snapshots);

    result.add(initialLecturer);

    listLecturer.value = result;
    selectedLecturer.value = initialLecturer;
  }

  void mapClassFirestoreToClassModel(AsyncSnapshot<QuerySnapshot> snapshots) {
    final result = ConverterHelper.mapClassFirestoreToClassModel(snapshots);

    result.add(
      ClassModel(
        classId: "null",
        className: "Pilih Kelas",
        lecturerId: null,
        lecturerName: null,
      ),
    );
    result.sort((a, b) => a.classId!.compareTo(b.classId!));
    listClass.value = result;
  }

  void addStudent(BuildContext context, bool isFormValid) async {
    if (isFormValid != true) {
      return;
    }

    await validateStudentId();

    final studentId = edtStudentIdController.text;
    final studentName = edtStudentNameController.text;
    final studentPassword = edtStudentPasswordController.text;
    final lecturerId = selectedLecturer.value.lecturerId;
    final lecturerName = selectedLecturer.value.lecturerName;
    final classId = selectedClass.value.toLowerCase();
    final className = selectedClass.value.toUpperCase();

    if (lecturerId == "null") {
      SnackBarHelper.showFlushbarWarning(
        "Peringatan",
        "Harap pilih dosen terlebih dahulu",
      )..show(context);
      return;
    }

    if (className == "PILIH KELAS") {
      SnackBarHelper.showFlushbarWarning(
        "Peringatan",
        "Harap pilih kelas terlebih dahulu",
      )..show(context);
      return;
    }

    if (isValid) {
      await studentReference.add({
        "id_mahasiswa": studentId,
        "nama_mahasiswa": studentName,
        "kata_sandi": generateMd5(studentPassword),
        "id_dosen": lecturerId,
        "nama_dosen": lecturerName,
        "id_kelas": classId,
        "nama_kelas": className,
        "status": false,
        "daftar_id_latihan": <String>[],
      }).whenComplete(() {
        clearForm();
        Get.offNamed(Routes.LOGIN);
        SnackBarHelper.showFlushbarSuccess(
          "Sukses",
          "Data mahasiswa $studentId berhasil ditambahkan",
        )..show(context);
      });
    } else {
      SnackBarHelper.showFlushbarInfo(
        "Terjadi Kesalahan",
        "Mahasiswa dengan NIM $studentId sudah terdaftar",
      )..show(context);
    }
  }

  Future<void> validateStudentId() async {
    isValid = true;
    final studentId = edtStudentIdController.text;

    var snapshots = await studentReference.get();

    snapshots.docs.forEach((element) {
      if (element["id_mahasiswa"] == studentId) {
        isValid = false;
      }
    });
  }

  void clearForm() {
    edtStudentIdController.clear();
    edtStudentPasswordController.clear();
    edtStudentNameController.clear();

    selectedLecturer.value = initialLecturer;
    selectedClass.value = "Pilih Kelas";
  }
}
