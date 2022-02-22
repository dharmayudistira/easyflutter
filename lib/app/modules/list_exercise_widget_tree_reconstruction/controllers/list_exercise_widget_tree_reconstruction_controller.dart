import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easyflutter/app/data/exercise_model.dart';
import 'package:easyflutter/app/routes/app_pages.dart';
import 'package:easyflutter/app/utils/bank_widget_exercise_helper.dart';
import 'package:easyflutter/app/utils/converter_helper.dart';
import 'package:easyflutter/app/utils/storage_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListExerciseWidgetTreeReconstructionController extends GetxController {
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
        snapshots, "widget");
    result.sort((a, b) {
      final idA = int.parse(a.exerciseId?.substring(8) ?? "0");
      final idB = int.parse(b.exerciseId?.substring(8) ?? "0");

      return idA.compareTo(idB);
    });

    listExercise = result;
  }

  void navigateTo(int index, String? exerciseId, String? exerciseName) {
    switch (index) {
      case 1:
        Get.toNamed(
          Routes.WIDGET_EXERCISE_1,
          arguments: [
            exerciseId,
            exerciseName,
            BankWidgetExerciseHelper.firstExercise,
          ],
        );
        break;
      case 2:
        Get.toNamed(
          Routes.WIDGET_EXERCISE_2,
          arguments: [
            exerciseId,
            exerciseName,
            BankWidgetExerciseHelper.secondExercise,
          ],
        );
        break;
      case 3:
        Get.toNamed(
          Routes.WIDGET_EXERCISE_3,
          arguments: [
            exerciseId,
            exerciseName,
            BankWidgetExerciseHelper.thirdExercise,
          ],
        );
        break;
      case 4:
        Get.toNamed(
          Routes.WIDGET_EXERCISE_4,
          arguments: [
            exerciseId,
            exerciseName,
            BankWidgetExerciseHelper.fourthExercise,
          ],
        );
        break;
      case 5:
        Get.toNamed(
          Routes.WIDGET_EXERCISE_5,
          arguments: [
            exerciseId,
            exerciseName,
            BankWidgetExerciseHelper.fifthExercise,
          ],
        );
        break;
      case 6:
        Get.toNamed(
          Routes.WIDGET_EXERCISE_6,
          arguments: [
            exerciseId,
            exerciseName,
            BankWidgetExerciseHelper.sixthExercise,
          ],
        );
        break;
      case 7:
        Get.toNamed(
          Routes.WIDGET_EXERCISE_7,
          arguments: [
            exerciseId,
            exerciseName,
            BankWidgetExerciseHelper.seventhExercise,
          ],
        );
        break;
      case 8:
        Get.toNamed(
          Routes.WIDGET_EXERCISE_8,
          arguments: [
            exerciseId,
            exerciseName,
            BankWidgetExerciseHelper.eighthExercise,
          ],
        );
        break;
      case 9:
        Get.toNamed(
          Routes.WIDGET_EXERCISE_9,
          arguments: [
            exerciseId,
            exerciseName,
            BankWidgetExerciseHelper.ninthExercise,
          ],
        );
        break;
      case 10:
        Get.toNamed(
          Routes.WIDGET_EXERCISE_10,
          arguments: [
            exerciseId,
            exerciseName,
            BankWidgetExerciseHelper.tenthExercise,
          ],
        );
        break;
      case 11:
        Get.toNamed(
          Routes.WIDGET_EXERCISE_11,
          arguments: [
            exerciseId,
            exerciseName,
            BankWidgetExerciseHelper.eleventhExercise,
          ],
        );
        break;
      case 12:
        Get.toNamed(
          Routes.WIDGET_EXERCISE_12,
          arguments: [
            exerciseId,
            exerciseName,
            BankWidgetExerciseHelper.twelfthExercise,
          ],
        );
        break;
      case 13:
        Get.toNamed(
          Routes.WIDGET_EXERCISE_13,
          arguments: [
            exerciseId,
            exerciseName,
            BankWidgetExerciseHelper.thirteenthExercise,
          ],
        );
        break;
      case 14:
        Get.toNamed(
          Routes.WIDGET_EXERCISE_14,
          arguments: [
            exerciseId,
            exerciseName,
            BankWidgetExerciseHelper.fourteenthExercise,
          ],
        );
        break;
      case 15:
        Get.toNamed(
          Routes.WIDGET_EXERCISE_15,
          arguments: [
            exerciseId,
            exerciseName,
            BankWidgetExerciseHelper.fifteenthExercise,
          ],
        );
        break;
    }
  }
}
