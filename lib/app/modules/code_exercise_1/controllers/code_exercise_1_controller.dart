import 'package:easyflutter/app/data/log_model.dart';
import 'package:easyflutter/app/utils/check_answer_helper.dart';
import 'package:easyflutter/app/utils/snackbar_helper.dart';
import 'package:easyflutter/app/utils/storage_helper.dart';
import 'package:get/get.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:collection/collection.dart';

class CodeExercise1Controller extends GetxController {
  final _storageHelper = Get.find<StorageHelper>();
  final exerciseId = Get.arguments[0] as String;
  final exerciseName = Get.arguments[1] as String;

  final exerciseCaption =
      "Column digunakan untuk menyusun widget - widget di dalamnya secara vertikal. Dengan MainAxis.Start maka widget di dalamnya akan tersusun sedekat mungkin dengan sumbu utama. Sedangkan CrossAxis.End akan menyusun widget sedekat mungkin dengan ujung sumbu silang.";

  final stopwatchTimer = StopWatchTimer();

  var isStarted = false.obs;
  var isCorrect = false.obs;
  var steps = 0.obs;

  final correctAnswer = [
    {
      "keyValue" : 1,
      "codeValue" : "Column ("
          "\n   mainAxisAlignment: MainAxisAligment.start,"
          "\n   crossAxisAlignment: CrossAxisAlignment.end,",
      "paddingValue" : 32.0,
    },
    {
      "keyValue" : 2,
      "codeValue" : "childern : [",
      "paddingValue" : 64.0,
    },
    {
      "keyValue" : 3,
      "codeValue" : "Container (color: Colors.red),",
      "paddingValue" : 96.0,
    },
    {
      "keyValue" : 4,
      "codeValue" : "Container (color: Colors.yellow),",
      "paddingValue" : 96.0,
    },
    {
      "keyValue" : 5,
      "codeValue" : "Container (color: Colors.green),",
      "paddingValue" : 96.0,
    },
    {
      "keyValue" : 6,
      "codeValue" : "],",
      "paddingValue" : 64.0,
    },
    {
      "keyValue" : 7,
      "codeValue" : ");",
      "paddingValue" : 32.0,
    },
  ].obs;

  final studentAnswer = [
    {
      "keyValue" : 1,
      "codeValue" : "Column ("
          "\n   mainAxisAlignment: MainAxisAligment.start,"
          "\n   crossAxisAlignment: CrossAxisAlignment.end,",
      "paddingValue" : 32.0,
    },
    {
      "keyValue" : 2,
      "codeValue" : "childern : [",
      "paddingValue" : 64.0,
    },
    {
      "keyValue" : 3,
      "codeValue" : "Container (color: Colors.red),",
      "paddingValue" : 96.0,
    },
    {
      "keyValue" : 4,
      "codeValue" : "Container (color: Colors.yellow),",
      "paddingValue" : 96.0,
    },
    {
      "keyValue" : 5,
      "codeValue" : "Container (color: Colors.green),",
      "paddingValue" : 96.0,
    },
    {
      "keyValue" : 6,
      "codeValue" : "],",
      "paddingValue" : 64.0,
    },
    {
      "keyValue" : 7,
      "codeValue" : ");",
      "paddingValue" : 32.0,
    },
  ].obs;

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
    while(CheckAnswerHelper.isDeepEqual(correctAnswer, studentAnswer)) {
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

    // print log (as if it's pushed to firestore)
    print("log : "
        "\n idlog : ${log.logId}"
        "\n idExercise : ${log.exerciseId}"
        "\n idStudent : ${log.studentId}"
        "\n studentName : ${log.studentName}"
        "\n studentAnswer : ${log.answer}"
        "\n steps : ${log.step}"
        "\n time : ${log.time}"
        "\n timestamp : ${log.timeStamp}");
  }

  void checkAnswer() {
    isCorrect.value = CheckAnswerHelper.isDeepEqual(correctAnswer, studentAnswer);

    if(isCorrect.value) {
      stopTimer();
      return;
    }else {
      SnackBarHelper.showSnackbar("Mohon maaf", "Blok kode yang Anda belum sesuai dengan output yang diharapkan");
    }
  }

  void startTimer() {
    stopwatchTimer.onExecute.add(StopWatchExecute.start);
  }

  void stopTimer() {
    stopwatchTimer.onExecute.add(StopWatchExecute.stop);
  }

  String _getStopwatchTime() {
    final rawValue = stopwatchTimer.rawTime.value;
    final displayTime = StopWatchTimer.getDisplayTime(rawValue, hours: true);
    return displayTime;
  }
}
