import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easyflutter/app/data/exercise_model.dart';
import 'package:easyflutter/app/modules/dashboard_lecturer/controllers/dashboard_lecturer_controller.dart';
import 'package:easyflutter/app/utils/converter_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListExerciseController extends GetxController {
  final dashboardLecturerController = Get.find<DashboardLecturerController>();
  final exerciseReference = FirebaseFirestore.instance.collection("latihan");

  late String selectedClass;

  var listOfExercise = <ExerciseModel>[];

  Stream<QuerySnapshot> getAllExerciseByClass() {
    selectedClass = dashboardLecturerController.getSelectedClass();
    return exerciseReference
        .where("id_kelas", isEqualTo: selectedClass)
        .snapshots();
  }

  void mapExerciseFirestoreToExerciseModel(
      AsyncSnapshot<QuerySnapshot> snapshots) {
    var result = ConverterHelper.mapExerciseFirestoreToExerciseModel(snapshots);
    result.sort((a, b) {
      final idA = int.parse(a.exerciseId?.substring(8) ?? "0");
      final idB = int.parse(b.exerciseId?.substring(8) ?? "0");

      return idA.compareTo(idB);
    });
    result.sort((a, b) {
      final typeA = a.type!;
      final typeB = b.type!;

      return typeA.compareTo(typeB);
    });
    listOfExercise = result;
  }
}
