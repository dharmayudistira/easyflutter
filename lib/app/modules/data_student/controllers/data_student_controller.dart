import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easyflutter/app/data/student_model.dart';
import 'package:easyflutter/app/modules/dashboard_lecturer/controllers/dashboard_lecturer_controller.dart';
import 'package:easyflutter/app/utils/converter_helper.dart';
import 'package:easyflutter/app/utils/storage_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DataStudentController extends GetxController {

  final _storageHelper = Get.find<StorageHelper>();
  final dashboardLecturerController = Get.find<DashboardLecturerController>();
  final studentReference = FirebaseFirestore.instance.collection("mahasiswa");

  var listStudent = <StudentModel>[];

  Stream<QuerySnapshot> getAllStudent() {
    final lecturerId = _storageHelper.getIdUser();
    return studentReference.where("id_dosen", isEqualTo: lecturerId).snapshots();
  }

  void mapStudentFirestoreToStudentModel(AsyncSnapshot<QuerySnapshot> snapshots) {
    final result = ConverterHelper.mapStudentFirestoreToStudentModel(snapshots);
    result.sort((a, b) => a.studentName!.compareTo(b.studentName!));
    listStudent = result;
  }

  Future<void> validateStudentStatus(String studentId, bool status) async {
    final snapshots = await studentReference.where("id_mahasiswa", isEqualTo: studentId).get();
    final snapshotId = snapshots.docs[0].id;

    await studentReference.doc(snapshotId).update({
      "status" : status,
    });
  }

}
