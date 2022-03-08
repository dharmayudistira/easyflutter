import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easyflutter/app/data/class_model.dart';
import 'package:easyflutter/app/modules/dashboard_lecturer/controllers/dashboard_lecturer_controller.dart';
import 'package:easyflutter/app/utils/converter_helper.dart';
import 'package:easyflutter/app/utils/generate_exercises_helper.dart';
import 'package:easyflutter/app/utils/snackbar_helper.dart';
import 'package:easyflutter/app/utils/storage_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class DataClassController extends GetxController {
  final _storageHelper = Get.find<StorageHelper>();
  final dashboardLecturerController = Get.find<DashboardLecturerController>();
  final classReference = FirebaseFirestore.instance.collection("kelas");
  final exerciseReference = FirebaseFirestore.instance.collection("latihan");

  final listTitleExerciseCodeReconstruction =
      GenerateExercisesHelper.listExerciseCodeReconstruction;
  final listTitleExerciseWidgetTreeReconstruction =
      GenerateExercisesHelper.listExerciseWidgetTreeReconstruction;

  late TextEditingController edtControllerClassName;

  var rowOfClasses = <ClassModel>[];

  @override
  void onInit() {
    super.onInit();

    edtControllerClassName = TextEditingController();
  }

  @override
  void onClose() {
    edtControllerClassName.dispose();
    super.onClose();
  }

  Stream<QuerySnapshot> getAllClass() {
    final lecturerId = _storageHelper.getIdUser();
    return classReference.where("id_dosen", isEqualTo: lecturerId).snapshots();
  }

  void mapConvertClassFirestoreToClassModel(
      AsyncSnapshot<QuerySnapshot> snapshots) {
    final result = ConverterHelper.mapClassFirestoreToClassModel(snapshots);

    result.sort((a, b) => a.classId!.compareTo(b.classId!));
    rowOfClasses = result;
  }

  Future<void> addClass(BuildContext context, bool isValid) async {
    if (isValid != true) return;

    final className = edtControllerClassName.text.toUpperCase();

    final classSnapshots = await classReference.get();

    var isClassValid = true;

    classSnapshots.docs.forEach((element) {
      if (element["nama_kelas"] == className) {
        isClassValid = false;
      }
    });

    if (isClassValid) {
      var lecturerId = _storageHelper.getIdUser();
      var lecturerName = _storageHelper.getNameUser();

      await classReference.add({
        "id_kelas": className.toLowerCase(),
        "nama_kelas": className.toUpperCase(),
        "id_dosen": lecturerId,
        "nama_dosen": lecturerName,
      }).whenComplete(() {
        edtControllerClassName.clear();
        Get.back();
        SnackBarHelper.showFlushbarSuccess(
          "Sukses",
          "Data kelas $className berhasil ditambahkan",
        )..show(context);
      });

      await addExerciseEachClass(className);
    } else {
      edtControllerClassName.clear();
      Get.back();
      SnackBarHelper.showFlushbarWarning(
        "Peringatan",
        "Data kelas $className sudah diampu dosen lain",
      )..show(context);
    }
  }

  Future<void> addExerciseEachClass(String className) async {
    //loop to add Code Reconstruction exercises
    for (int i = 0; i < listTitleExerciseCodeReconstruction.length; i++) {
      await exerciseReference.add({
        "id_latihan":
            "${className.toLowerCase()}-c-${(i + 1 < 10) ? "0${i + 1}" : i + 1}",
        "nama_latihan": "${listTitleExerciseCodeReconstruction[i]}",
        "id_kelas": "${className.toLowerCase()}",
        "tipe": "code",
        "daftar_id_mahasiswa": <String>[],
      });
    }

    //loop to add Widget Tree Reconstruction exercises
    for (int i = 0; i < listTitleExerciseWidgetTreeReconstruction.length; i++) {
      await exerciseReference.add({
        "id_latihan":
            "${className.toLowerCase()}-w-${(i + 1 < 10) ? "0${i + 1}" : i + 1}",
        "nama_latihan": "${listTitleExerciseWidgetTreeReconstruction[i]}",
        "id_kelas": "${className.toLowerCase()}",
        "tipe": "widget",
        "daftar_id_mahasiswa": <String>[],
      });
    }
  }

  void clearForm() {
    edtControllerClassName.clear();
  }
}
