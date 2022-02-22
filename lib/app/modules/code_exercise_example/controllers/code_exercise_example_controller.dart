import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easyflutter/app/utils/bank_code_exercises_helper.dart';
import 'package:easyflutter/app/utils/check_answer_helper.dart';
import 'package:easyflutter/app/utils/snackbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

class CodeExerciseExampleController extends GetxController {
  final exerciseId = Get.arguments[0] as String;
  final exerciseName = Get.arguments[1] as String;
  final logReference = FirebaseFirestore.instance.collection("log");

  final exerciseCaption =
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam et posuere nulla. Mauris fringilla felis arcu, at aliquet mi porttitor venenatis.";

  final stopwatchTimer = StopWatchTimer();

  var isStarted = false.obs;
  var isCorrect = false.obs;
  var isFinished = false.obs;
  var steps = 0.obs;

  final correctAnswer = BankCodeExercisesHelper.firstExerciseAnswer.obs;
  final studentAnswer = BankCodeExercisesHelper.firstExerciseAnswer.obs;

  @override
  void onInit() {
    super.onInit();
    _mixAnswer();
  }

  @override
  void onClose() {
    stopwatchTimer.dispose();
    super.onClose();
  }

  void _mixAnswer() {
    while (CheckAnswerHelper.isDeepEqual(correctAnswer, studentAnswer)) {
      studentAnswer.shuffle();
    }
  }

  void onReorder(int oldIndex, int newIndex) {
    //reordering list
    final index = newIndex > oldIndex ? newIndex - 1 : newIndex;
    final oldItem = studentAnswer.removeAt(oldIndex);
    studentAnswer.insert(index, oldItem);
  }

  void checkAnswer(BuildContext context) {
    isCorrect.value =
        CheckAnswerHelper.isDeepEqual(correctAnswer, studentAnswer);

    if (isCorrect.value) {
      stopTimer();
      isFinished.toggle();
      SnackBarHelper.showFlushbarSuccess(
        "Selamat",
        "Blok kode yang Anda susun telah sesuai dengan output yang diharapkan",
      )..show(context);
      return;
    } else {
      SnackBarHelper.showFlushbarWarning(
        "Peringatan",
        "Blok kode yang Anda susun belum sesuai dengan output yang diharapkan",
      )..show(context);
    }
  }

  void startTimer() {
    stopwatchTimer.onExecute.add(StopWatchExecute.start);
  }

  void stopTimer() {
    stopwatchTimer.onExecute.add(StopWatchExecute.stop);
  }
}
