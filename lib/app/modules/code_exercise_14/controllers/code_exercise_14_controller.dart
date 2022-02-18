import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easyflutter/app/data/log_model.dart';
import 'package:easyflutter/app/utils/bank_code_exercises_helper.dart';
import 'package:easyflutter/app/utils/check_answer_helper.dart';
import 'package:easyflutter/app/utils/send_answer_helper.dart';
import 'package:easyflutter/app/utils/snackbar_helper.dart';
import 'package:easyflutter/app/utils/storage_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

class CodeExercise14Controller extends GetxController {
  final _storageHelper = Get.find<StorageHelper>();
  final exerciseId = Get.arguments[0] as String;
  final exerciseName = Get.arguments[1] as String;
  final logReference = FirebaseFirestore.instance.collection("log");

  final exerciseCaption =
      "Column digunakan untuk menyusun widget - widget di dalamnya secara vertikal. Dengan MainAxis.Start maka widget di dalamnya akan tersusun sedekat mungkin dengan sumbu utama. Sedangkan CrossAxis.End akan menyusun widget sedekat mungkin dengan ujung sumbu silang.";

  final stopwatchTimer = StopWatchTimer();

  var isStarted = false.obs;
  var isCorrect = false.obs;
  var isFinished = false.obs;
  var steps = 0.obs;

  final correctAnswer = BankCodeExercisesHelper.thirteenthExerciseAnswer.obs;
  final studentAnswer = BankCodeExercisesHelper.thirteenthExerciseAnswer.obs;

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

    //setup log
    var studentAnswerLog = "[";
    studentAnswer.forEach((element) {
      studentAnswerLog += "${element["keyValue"]},";
    });
    studentAnswerLog += "]";

    steps.value++;

    //make log model
    final log = LogModel(
      logId: "$exerciseId-${DateTime.now()}",
      exerciseId: exerciseId,
      studentId: _storageHelper.getIdUser(),
      studentName: _storageHelper.getNameUser(),
      answer: studentAnswerLog,
      step: steps.value.toString(),
      time: _getStopwatchTime(),
      timeStamp: DateTime.now().toString(),
    );

    // uploading log to the firestore
    logReference.add({
      "id_log": log.logId,
      "id_mahasiswa": log.studentId,
      "nama_mahasiswa": log.studentName,
      "id_latihan": log.exerciseId,
      "langkah": log.step,
      "waktu": log.time,
      "jawaban": log.answer,
      "time_stamp": log.timeStamp,
    });
  }

  void checkAnswer(BuildContext context) {
    final correctCodeValue = <String>[];
    correctAnswer.forEach((element) {
      correctCodeValue.add("${element['codeValue']}");
    });

    final studentCodeValue = <String>[];
    studentAnswer.forEach((element) {
      studentCodeValue.add("${element['codeValue']}");
    });

    isCorrect.value =
        CheckAnswerHelper.isDeepEqual(correctCodeValue, studentCodeValue);

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
        "Mohon maaf",
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

  void dialogStartOnSuccess() {
    isStarted.toggle();
    Get.back();
    startTimer();
  }

  String _getStopwatchTime() {
    final rawValue = stopwatchTimer.rawTime.value;
    final displayTime = StopWatchTimer.getDisplayTime(rawValue, hours: true);
    return displayTime;
  }

  void sendAnswer() {
    SendAnswerHelper.updateExercise(exerciseId);
    SendAnswerHelper.updateStudent(exerciseId);
  }
}

