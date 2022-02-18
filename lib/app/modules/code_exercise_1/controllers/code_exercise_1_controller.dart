import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easyflutter/app/data/log_model.dart';
import 'package:easyflutter/app/utils/bank_code_exercises_helper.dart';
import 'package:easyflutter/app/utils/check_answer_helper.dart';
import 'package:easyflutter/app/utils/snackbar_helper.dart';
import 'package:easyflutter/app/utils/storage_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

class CodeExercise1Controller extends GetxController {
  final _storageHelper = Get.find<StorageHelper>();
  final exerciseId = Get.arguments[0] as String;
  final exerciseName = Get.arguments[1] as String;
  final logReference = FirebaseFirestore.instance.collection("log");
  final exerciseReference = FirebaseFirestore.instance.collection("latihan");
  final studentReference = FirebaseFirestore.instance.collection("mahasiswa");

  final exerciseCaption =
      "Column digunakan untuk menyusun widget - widget di dalamnya secara vertikal. Dengan MainAxis.Start maka widget di dalamnya akan tersusun sedekat mungkin dengan sumbu utama. Sedangkan CrossAxis.End akan menyusun widget sedekat mungkin dengan ujung sumbu silang.";

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

  void sendAnswer() async {
    updateExercise();
    updateStudent();
  }

  void updateExercise() async {
    final exercises = await exerciseReference
        .where("id_latihan", isEqualTo: exerciseId)
        .get();

    final exercise = exercises.docs[0];
    var listStudentId = exercise['daftar_id_mahasiswa'];

    if (!listStudentId.isEmpty) {
      var isFound = false;
      listStudentId.forEach((element) {
        if (element == _storageHelper.getIdUser()) {
          isFound = true;
          return;
        }
      });

      if (!isFound) {
        listStudentId.add(_storageHelper.getIdUser());
        exerciseReference.doc(exercise.id).set({
          "daftar_id_mahasiswa": listStudentId,
        }, SetOptions(merge: true));
      }
    } else {
      listStudentId.add(_storageHelper.getIdUser());
      exerciseReference.doc(exercise.id).set({
        "daftar_id_mahasiswa": listStudentId,
      }, SetOptions(merge: true));
    }
  }

  void updateStudent() async {
    final students = await studentReference
        .where("id_mahasiswa", isEqualTo: _storageHelper.getIdUser())
        .get();

    final student = students.docs[0];
    var listExerciseId = student['daftar_id_latihan'];

    if (!listExerciseId.isEmpty) {
      var isFound = false;
      listExerciseId.forEach((element) {
        if (element == exerciseId) {
          isFound = true;
          return;
        }
      });

      if (!isFound) {
        listExerciseId.add(exerciseId);
        studentReference.doc(student.id).set({
          "daftar_id_latihan": listExerciseId,
        }, SetOptions(merge: true));
      }
    } else {
      listExerciseId.add(exerciseId);
      studentReference.doc(student.id).set({
        "daftar_id_latihan": listExerciseId,
      }, SetOptions(merge: true));
    }
  }
}
