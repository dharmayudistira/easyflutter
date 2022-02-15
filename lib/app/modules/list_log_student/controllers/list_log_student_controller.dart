import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easyflutter/app/data/log_model.dart';
import 'package:easyflutter/app/modules/dashboard_lecturer/controllers/dashboard_lecturer_controller.dart';
import 'package:easyflutter/app/utils/converter_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListLogStudentController extends GetxController {

  final dashboardLecturerController = Get.find<DashboardLecturerController>();
  final logReference = FirebaseFirestore.instance.collection("log");

  var listLog = <LogModel>[];

  Stream<QuerySnapshot> getLogsByExercise() {
    final selectedExercise = dashboardLecturerController.getSelectedExercise();
    return logReference.where("id_latihan", isEqualTo: selectedExercise).snapshots();
  }

  void mapLogFirestoreToLogModel(AsyncSnapshot<QuerySnapshot> snapshots) {
    final result = ConverterHelper.mapLogFirestoreToLogModel(snapshots);
    result.sort((a, b) => a.logId!.compareTo(b.logId!));
    listLog = result;
  }

}
