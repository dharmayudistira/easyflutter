import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easyflutter/app/data/answer_widget_model.dart';
import 'package:easyflutter/app/data/log_model.dart';
import 'package:easyflutter/app/utils/storage_helper.dart';

import 'package:get/get.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

class WidgetExercise1Controller extends GetxController {
  final StopWatchTimer stopWatchTimer = StopWatchTimer();

  final _storageHelper = Get.find<StorageHelper>();

  final CollectionReference logReference =
      FirebaseFirestore.instance.collection("log");

  final exerciseId = Get.arguments[0];
  final exerciseName = Get.arguments[1];
  final exerciseDescription =
      "Flutter memiliki beberapa widget yang dapat digunakan untuk menyusun widget, salah satunya yaitu Stack. Stack merupakan widget yang memposisikan beberapa widget secara relatif terhadap tepi kotaknya.";

  Function eq = const ListEquality().equals;

  int step = 0;

  var isAnswerTrue = false.obs;

  var isStart = false.obs;
  var isOver = false;

  List<String> answer = ["Stack", "Row", "Icon Button"];

  List<AnswerWidgetModel> answerList = [
    AnswerWidgetModel(index: 0, content: "Icon Button", isUsed: false),
    AnswerWidgetModel(index: 1, content: "Row", isUsed: false),
    AnswerWidgetModel(index: 2, content: "Stack", isUsed: false),
    AnswerWidgetModel(index: 3, content: "Column", isUsed: false),
    AnswerWidgetModel(index: 4, content: "Icon", isUsed: false),
  ].obs;

  List<AnswerWidgetModel> targetAnswers = [
    AnswerWidgetModel(index: -1, content: "", isUsed: false),
    AnswerWidgetModel(index: -1, content: "", isUsed: false),
    AnswerWidgetModel(index: -1, content: "", isUsed: false),
  ].obs;

  void acceptAnswer(AnswerWidgetModel answer, int indexTargetAnswer) {
    // check isStart
    if (isStart.value) {
      if (!isOver) {
        // disable answer
        final temp = answerList.removeAt(answer.index ?? -1);
        answerList.insert(
          answer.index ?? -1,
          AnswerWidgetModel(
            index: temp.index,
            content: temp.content,
            isUsed: true,
          ),
        );

        // replace answer
        if (targetAnswers[indexTargetAnswer].isUsed ?? true) {
          final tempAnswer = targetAnswers[indexTargetAnswer];
          answerList[tempAnswer.index ?? -1].isUsed = false;
        }

        // set targetAnswers
        targetAnswers[indexTargetAnswer].index = answer.index;
        targetAnswers[indexTargetAnswer].content = answer.content;
        targetAnswers[indexTargetAnswer].isUsed = true;

        createLog();
      }
    } else {
      Get.snackbar(
        "Informasi",
        'Pastikan Anda sudah menekan tombol "Kerjakan Latihan" untuk melengkapi peta konsep.',
      );
    }
  }

  void startExercise() {
    isStart.value = true;
    startStopwatch();
  }

  void reset() {
    isAnswerTrue.value = false;

    for (int i = 0; i < answerList.length; i++) {
      final temp = answerList.removeAt(i);
      answerList.insert(
        i,
        AnswerWidgetModel(
          index: temp.index,
          content: temp.content,
          isUsed: false,
        ),
      );
    }

    for (int i = 0; i < targetAnswers.length; i++) {
      targetAnswers.removeAt(i);
      targetAnswers.insert(
        i,
        AnswerWidgetModel(
          index: -1,
          content: "",
          isUsed: false,
        ),
      );
    }
  }

  void startStopwatch() {
    stopWatchTimer.onExecute.add(StopWatchExecute.start);
  }

  void stopStopWatch() {
    stopWatchTimer.onExecute.add(StopWatchExecute.stop);
  }

  void createLog() {
    step++;

    final log = LogModel(
      logId: "$exerciseId-${DateTime.now()}",
      studentId: _storageHelper.getIdUser(),
      studentName: _storageHelper.getNameUser(),
      exerciseId: exerciseId,
      step: step.toString(),
      time: StopWatchTimer.getDisplayTime(
        stopWatchTimer.rawTime.value,
        hours: true,
      ),
      answer: getTextAnswer().toString(),
      timeStamp: DateTime.now().toString(),
    );

    uploadLog(log);
  }

  void uploadLog(LogModel log) {
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

  bool checkAnswer() {
    if (eq(getTextAnswer(), answer)) {
      isAnswerTrue.value = true;
      isOver = true;
      stopStopWatch();
      return true;
    } else {
      return false;
    }
  }

  List<String?> getTextAnswer() {
    return targetAnswers.map((e) => e.content).toList();
  }

  @override
  void dispose() {
    stopWatchTimer.dispose();
    super.dispose();
  }
}
