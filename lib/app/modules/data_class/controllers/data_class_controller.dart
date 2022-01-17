import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easyflutter/app/data/class_model.dart';
import 'package:easyflutter/app/modules/dashboard_lecturer/controllers/dashboard_lecturer_controller.dart';
import 'package:easyflutter/app/utils/converter_helper.dart';
import 'package:easyflutter/app/utils/storage_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class DataClassController extends GetxController {
  final _storageHelper = Get.find<StorageHelper>();
  final dashboardLecturerController = Get.find<DashboardLecturerController>();
  final GlobalKey<FormState> dataClassFormKey = GlobalKey();
  final classReference = FirebaseFirestore.instance.collection("kelas");
  final exerciseReference = FirebaseFirestore.instance.collection("latihan");
  final listTitleExerciseCodeReconstruction = [
    "Latihan 1 : Belajar Column dengan MainAxis.Start + CrossAxis.End",
    "Latihan 2 : Belajar Column dengan MainAxis.Center + CrossAxis.Start",
    "Latihan 3 : Belajar Column dengan MainAxis.End + CrossAxis.Center",
    "Latihan 4 : Belajar Row dengan MainAxis.Start + CrossAxis.End",
    "Latihan 5 : Belajar Row dengan MainAxis.Center + CrossAxis.Start",
    "Latihan 6 : Belajar Row dengan MainAxis.End + CrossAxis.Center",
    "Latihan 7 : Belajar Column dengan MainAxis.SpaceBetween",
    "Latihan 8 : Belajar Row dengan MainAxis.SpaceBetween",
    "Latihan 9 : Belajar Column dengan MainAxis.SpaceAround",
    "Latihan 10 : Belajar Row dengan MainAxis.SpaceAround",
    "Latihan 11 : Belajar Column dengan MainAxis.SpaceEvenly",
    "Latihan 12 : Belajar Row dengan MainAxis.SpaceEvenly",
    "Latihan 13 : Belajar Column + Row",
    "Latihan 14 : Belajar Column + Row dengan MainAxis",
    "Latihan 15 : Belajar Column + Row dengan MainAxis + CrossAxis",
  ];
  final listTitleExerciseWidgetTreeReconstruction = [
    "Latihan 1",
    "Latihan 2",
    "Latihan 3",
    "Latihan 4",
    "Latihan 5",
    "Latihan 6",
    "Latihan 7",
    "Latihan 8",
    "Latihan 9",
    "Latihan 10",
    "Latihan 11",
    "Latihan 12",
    "Latihan 13",
    "Latihan 14",
    "Latihan 15",
  ];

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

  Future<void> addClass() async {
    final isValid = dataClassFormKey.currentState?.validate();

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
        Get.snackbar("Berhasil", "Data kelas $className berhasil ditambahkan");
      });

      await addExerciseEachClass(className);
    } else {
      edtControllerClassName.clear();
      Get.back();
      Get.snackbar(
          "Terjadi Kesalahan", "Data kelas $className sudah diampu dosen lain");
    }
  }

  Future<void> addExerciseEachClass(String className) async {
    //loop to add Code Reconstruction exercises
    for (int i = 0; i < listTitleExerciseCodeReconstruction.length; i++) {
      await exerciseReference.add({
        "id_latihan": "${className.toLowerCase()}-c-${i + 1}",
        "nama_latihan": "${listTitleExerciseCodeReconstruction[i]}",
        "id_kelas": "${className.toLowerCase()}",
        "tipe": "code",
        "daftar_id_mahasiswa": <String>[],
      });
    }

    //loop to add Widget Tree Reconstruction exercises
    for (int i = 0; i < listTitleExerciseWidgetTreeReconstruction.length; i++) {
      await exerciseReference.add({
        "id_latihan": "${className.toLowerCase()}-w-${i + 1}",
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
