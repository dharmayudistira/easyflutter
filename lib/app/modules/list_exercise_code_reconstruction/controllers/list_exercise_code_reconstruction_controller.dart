import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easyflutter/app/data/exercise_model.dart';
import 'package:easyflutter/app/routes/app_pages.dart';
import 'package:easyflutter/app/utils/bank_code_exercises_helper.dart';
import 'package:easyflutter/app/utils/converter_helper.dart';
import 'package:easyflutter/app/utils/storage_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListExerciseCodeReconstructionController extends GetxController {
  final storageHelper = Get.find<StorageHelper>();
  final exerciseReference = FirebaseFirestore.instance.collection("latihan");

  var listExercise = <ExerciseModel>[];

  Stream<QuerySnapshot> getAllExercise() {
    final classId = storageHelper.getIdClassUser();
    return exerciseReference.where("id_kelas", isEqualTo: classId).snapshots();
  }

  void mapExerciseFirestoreToExerciseModel(
      AsyncSnapshot<QuerySnapshot> snapshots) {
    final result = ConverterHelper.mapExerciseFirestoreToExerciseModelByType(
        snapshots, "code");
    result.sort((a, b) {
      final idA = int.parse(a.exerciseId?.substring(8) ?? "0");
      final idB = int.parse(b.exerciseId?.substring(8) ?? "0");

      return idA.compareTo(idB);
    });
    listExercise = result;
  }

  void navigateTo(int index, String exerciseId, String exerciseName) {
    switch (index) {
      case 0:
        Get.toNamed(Routes.CODE_EXERCISE, arguments: [
          exerciseId,
          exerciseName,
          BankCodeExercisesHelper.firstExerciseCaption,
          BankCodeExercisesHelper.firstExerciseAnswer,
          "assets/images/code/output_soal_1.png",
        ]);
        break;
      case 1:
        Get.toNamed(Routes.CODE_EXERCISE, arguments: [
          exerciseId,
          exerciseName,
          BankCodeExercisesHelper.secondExerciseCaption,
          BankCodeExercisesHelper.secondExerciseAnswer,
          "assets/images/code/output_soal_2.png",
        ]);
        break;
      case 2:
        Get.toNamed(Routes.CODE_EXERCISE, arguments: [
          exerciseId,
          exerciseName,
          BankCodeExercisesHelper.thirdExerciseCaption,
          BankCodeExercisesHelper.thirdExerciseAnswer,
          "assets/images/code/output_soal_3.png",
        ]);
        break;
      case 3:
        Get.toNamed(Routes.CODE_EXERCISE, arguments: [
          exerciseId,
          exerciseName,
          BankCodeExercisesHelper.fourthExerciseCaption,
          BankCodeExercisesHelper.fourthExerciseAnswer,
          "assets/images/code/output_soal_4.png",
        ]);
        break;
      case 4:
        Get.toNamed(Routes.CODE_EXERCISE, arguments: [
          exerciseId,
          exerciseName,
          BankCodeExercisesHelper.fifthExerciseCaption,
          BankCodeExercisesHelper.fifthExerciseAnswer,
          "assets/images/code/output_soal_5.png",
        ]);
        break;
      case 5:
        Get.toNamed(Routes.CODE_EXERCISE, arguments: [
          exerciseId,
          exerciseName,
          BankCodeExercisesHelper.sixthExerciseCaption,
          BankCodeExercisesHelper.sixthExerciseAnswer,
          "assets/images/code/output_soal_6.png",
        ]);
        break;
      case 6:
        Get.toNamed(Routes.CODE_EXERCISE, arguments: [
          exerciseId,
          exerciseName,
          BankCodeExercisesHelper.seventhExerciseCaption,
          BankCodeExercisesHelper.seventhExerciseAnswer,
          "assets/images/code/output_soal_7.png",
        ]);
        break;
      case 7:
        Get.toNamed(Routes.CODE_EXERCISE, arguments: [
          exerciseId,
          exerciseName,
          BankCodeExercisesHelper.eighthExerciseCaption,
          BankCodeExercisesHelper.eighthExerciseAnswer,
          "assets/images/code/output_soal_8.png",
        ]);
        break;
      case 8:
        Get.toNamed(Routes.CODE_EXERCISE, arguments: [
          exerciseId,
          exerciseName,
          BankCodeExercisesHelper.ninthExerciseCaption,
          BankCodeExercisesHelper.ninthExerciseAnswer,
          "assets/images/code/output_soal_9.png",
        ]);
        break;
      case 9:
        Get.toNamed(Routes.CODE_EXERCISE, arguments: [
          exerciseId,
          exerciseName,
          BankCodeExercisesHelper.tenthExerciseCaption,
          BankCodeExercisesHelper.tenthExerciseAnswer,
          "assets/images/code/output_soal_10.png",
        ]);
        break;
      case 10:
        Get.toNamed(Routes.CODE_EXERCISE, arguments: [
          exerciseId,
          exerciseName,
          BankCodeExercisesHelper.eleventhExerciseCaption,
          BankCodeExercisesHelper.eleventhExerciseAnswer,
          "assets/images/code/output_soal_11.png",
        ]);
        break;
      case 11:
        Get.toNamed(Routes.CODE_EXERCISE, arguments: [
          exerciseId,
          exerciseName,
          BankCodeExercisesHelper.twelfthExerciseCaption,
          BankCodeExercisesHelper.twelfthExerciseAnswer,
          "assets/images/code/output_soal_12.png",
        ]);
        break;
      case 12:
        Get.toNamed(Routes.CODE_EXERCISE, arguments: [
          exerciseId,
          exerciseName,
          BankCodeExercisesHelper.thirteenthExerciseCaption,
          BankCodeExercisesHelper.thirteenthExerciseAnswer,
          "assets/images/code/output_soal_13.png",
        ]);
        break;
      case 13:
        Get.toNamed(Routes.CODE_EXERCISE, arguments: [
          exerciseId,
          exerciseName,
          BankCodeExercisesHelper.fourteenthExerciseCaption,
          BankCodeExercisesHelper.fourteenthExerciseAnswer,
          "assets/images/code/output_soal_14.png",
        ]);
        break;
      case 14:
        Get.toNamed(Routes.CODE_EXERCISE, arguments: [
          exerciseId,
          exerciseName,
          BankCodeExercisesHelper.fifteenthExerciseCaption,
          BankCodeExercisesHelper.fifteenthExerciseAnswer,
          "assets/images/code/output_soal_15.png",
        ]);
        break;
    }
  }
}
