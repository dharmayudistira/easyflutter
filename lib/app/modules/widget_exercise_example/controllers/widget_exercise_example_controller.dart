import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easyflutter/app/data/answer_widget_model.dart';
import 'package:get/get.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

class WidgetExerciseExampleController extends GetxController {
  final StopWatchTimer stopWatchTimer = StopWatchTimer();

  final exerciseId = Get.arguments[0];
  final exerciseName = Get.arguments[1];
  final exerciseDescription =
      "Flutter memiliki beberapa widget yang dapat digunakan untuk menyusun widget, yaitu Row dan Column. Row merupakan widget yang menampilkan beberapa child dalam larik horizontal, sedangkan Column merupakan widget yang menampilkan beberapa child dalam larik vertikal.";

  Function eq = const ListEquality().equals;

  int step = 0;

  var isAnswerTrue = false.obs;

  var isStart = false.obs;
  var isOver = false;

  List<String> answer = ["Row", "Icon", "Icon"];

  List<AnswerWidgetModel> answerList = [
    AnswerWidgetModel(index: 0, content: "Icon", isUsed: false),
    AnswerWidgetModel(index: 1, content: "Text", isUsed: false),
    AnswerWidgetModel(index: 2, content: "Icon", isUsed: false),
    AnswerWidgetModel(index: 3, content: "Image", isUsed: false),
    AnswerWidgetModel(index: 4, content: "Row", isUsed: false),
  ].obs;

  List<AnswerWidgetModel> targetAnswers = [
    AnswerWidgetModel(index: -1, content: "", isUsed: false),
    AnswerWidgetModel(index: -1, content: "", isUsed: false),
    AnswerWidgetModel(index: -1, content: "", isUsed: false),
  ].obs;

  void acceptAnswer(AnswerWidgetModel answer, int indexTargetAnswer) {
    // check isStart
    if (isStart.value) {
      if(!isOver){
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
