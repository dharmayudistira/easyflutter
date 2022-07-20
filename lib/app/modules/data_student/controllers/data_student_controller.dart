import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easyflutter/app/data/class_model.dart';
import 'package:easyflutter/app/data/student_model.dart';
import 'package:easyflutter/app/modules/dashboard_lecturer/controllers/dashboard_lecturer_controller.dart';
import 'package:easyflutter/app/utils/converter_helper.dart';
import 'package:easyflutter/app/utils/storage_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DataStudentController extends GetxController {
  final _storageHelper = Get.find<StorageHelper>();
  final dashboardLecturerController = Get.find<DashboardLecturerController>();
  final classReference = FirebaseFirestore.instance.collection("kelas");
  final studentReference = FirebaseFirestore.instance.collection("mahasiswa");

  var listStudent = <StudentModel>[];
  var selectedClass = "Semua".obs;

  Stream<QuerySnapshot> getAllStudent() {
    final lecturerId = _storageHelper.getIdUser();

    if (selectedClass.value.toLowerCase() == "semua") {
      return studentReference
          .where("id_dosen", isEqualTo: lecturerId)
          .snapshots();
    } else {
      return studentReference
          .where("id_dosen", isEqualTo: lecturerId)
          .where("id_kelas", isEqualTo: selectedClass.value.toLowerCase())
          .snapshots();
    }
  }

  Future<List<String>> getClassByLecturerId() async {
    final lecturerId = _storageHelper.getIdUser();
    var listClass = ["Semua"];

    QuerySnapshot<Map<String, dynamic>> dataClass =
        await classReference.where("id_dosen", isEqualTo: lecturerId).get();
    for (int i = 0; i < dataClass.size; i++) {
      ClassModel currentClass = ClassModel.fromJson(dataClass.docs[i].data());
      listClass.add(currentClass.className ?? "");
    }

    return listClass;
  }

  Stream<QuerySnapshot> getClassByLecturer() {
    final lecturerId = _storageHelper.getIdUser();
    return classReference.where("id_dosen", isEqualTo: lecturerId).snapshots();
  }

  void mapStudentFirestoreToStudentModel(
      AsyncSnapshot<QuerySnapshot> snapshots) {
    final result = ConverterHelper.mapStudentFirestoreToStudentModel(snapshots);
    result.sort((a, b) => a.studentName!.compareTo(b.studentName!));
    listStudent = result;
  }

  Future<void> validateStudentStatus(String studentId, bool status) async {
    final snapshots = await studentReference
        .where("id_mahasiswa", isEqualTo: studentId)
        .get();
    final snapshotId = snapshots.docs[0].id;

    await studentReference.doc(snapshotId).update({
      "status": status,
    });
  }

  String getPostTestCodeStatus(List<String>? listExerciseId) {
    final counterCode = listExerciseId
        ?.where((exerciseId) => exerciseId.substring(6, 7) == 'c')
        .toList()
        .length;

    return "$counterCode/10";
  }

  String getPostTestWidgetStatus(List<String>? listExerciseId) {
    final listWidget = listExerciseId
        ?.where((exerciseId) => exerciseId.substring(6, 7) == 'w')
        .toList();
    var counterWidget = listWidget?.length;

    if ((counterWidget ?? 0) > 10) {
      counterWidget = 10;
    }

    return "$counterWidget / 10";
  }

}
