import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easyflutter/app/data/class_model.dart';
import 'package:easyflutter/app/data/exercise_model.dart';
import 'package:easyflutter/app/utils/converter_helper.dart';
import 'package:easyflutter/app/utils/storage_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListExerciseCodeReconstructionController extends GetxController {

  final _storageHelper = Get.find<StorageHelper>();
  final exerciseReference = FirebaseFirestore.instance.collection("latihan");

  var listExercise = <ExerciseModel>[];

  Stream<QuerySnapshot> getAllExercise() {
    final classId = _storageHelper.getIdClassUser();
    return exerciseReference.where("id_kelas", isEqualTo: classId).snapshots();
  }

  void mapExerciseFirestoreToExerciseModel(AsyncSnapshot<QuerySnapshot> snapshots) {
    final result = ConverterHelper.mapExerciseFirestoreToExerciseModelByType(snapshots, "code");
    result.sort((a, b) => a.exerciseId!.compareTo(b.exerciseId!));
    listExercise = result;
  }

}