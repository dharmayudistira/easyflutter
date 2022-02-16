import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easyflutter/app/data/class_model.dart';
import 'package:easyflutter/app/modules/dashboard_lecturer/controllers/dashboard_lecturer_controller.dart';
import 'package:easyflutter/app/utils/converter_helper.dart';
import 'package:easyflutter/app/utils/encrypt_helper.dart';
import 'package:easyflutter/app/utils/snackbar_helper.dart';
import 'package:easyflutter/app/utils/storage_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AddStudentController extends GetxController {
  final _storageHelper = Get.find<StorageHelper>();
  final dashboardLecturerController = Get.find<DashboardLecturerController>();
  final GlobalKey<FormState> addStudentFormKey = GlobalKey();
  final classReference = FirebaseFirestore.instance.collection("kelas");
  final studentReference = FirebaseFirestore.instance.collection("mahasiswa");

  var isValid = true;
  var listOfClass = [
    ClassModel(
      lecturerId: null,
      classId: null,
      lecturerName: null,
      className: "Pilih Kelas",
    ),
  ].obs;

  late TextEditingController edtStudentIdController;
  late TextEditingController edtStudentNameController;

  var selectedClass = "Pilih Kelas".obs;

  @override
  void onInit() {
    super.onInit();

    edtStudentIdController = TextEditingController();
    edtStudentNameController = TextEditingController();
  }

  @override
  void onClose() {
    edtStudentIdController.dispose();
    edtStudentNameController.dispose();

    super.onClose();
  }

  String getLecturerName() {
    return _storageHelper.getNameUser();
  }

  Stream<QuerySnapshot> getAllClass() {
    final lecturerId = _storageHelper.getIdUser();
    return classReference.where("id_dosen", isEqualTo: lecturerId).snapshots();
  }

  void mapConvertClassFirestoreToClassModel(
      AsyncSnapshot<QuerySnapshot> snapshots) {
    final result = ConverterHelper.mapClassFirestoreToClassModel(snapshots);

    result.add(ClassModel(
      lecturerId: null,
      classId: "null",
      lecturerName: null,
      className: "Pilih Kelas",
    ));
    result.sort((a, b) => a.classId!.compareTo(b.classId!));
    listOfClass.value = result;
  }

  void addStudent(BuildContext context) async {
    final isFormValid = addStudentFormKey.currentState?.validate();

    if (isFormValid != true) return;

    await validateStudentId();

    if (selectedClass.value == "Pilih Kelas") {
      SnackBarHelper.showFlushbarInfo(
        "Terjadi Kesalahan",
        "Harap pilih kelas terlebih dahulu",
      );
    } else if (!isValid) {
      SnackBarHelper.showFlushbarError(
        "Terjadi Kesalahan",
        "Mahasiswa dengan NIM ${edtStudentIdController.text} sudah ada",
      );
    } else {
      final studentId = edtStudentIdController.text;
      final passwordStudent = generateMd5(studentId);
      final studentName = edtStudentNameController.text;
      final lecturerId = _storageHelper.getIdUser();
      final lecturerName = _storageHelper.getNameUser();
      final classId = selectedClass.value.toLowerCase();
      final className = selectedClass.value.toUpperCase();

      studentReference.add({
        "id_mahasiswa": studentId,
        "nama_mahasiswa": studentName,
        "kata_sandi": passwordStudent,
        "id_dosen": lecturerId,
        "nama_dosen": lecturerName,
        "id_kelas": classId,
        "nama_kelas": className,
        "status": true
      }).whenComplete(() {
        clearForm();
        dashboardLecturerController.setSelectedIndex(1);
        SnackBarHelper.showFlushbarSuccess(
          "Berhasil Menambahkan Mahasiswa",
          "Data mahasiswa $studentName berhasil ditambahkan",
        );
      });
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
    edtStudentNameController.clear();
    selectedClass.value = "Pilih Kelas";
  }
}
