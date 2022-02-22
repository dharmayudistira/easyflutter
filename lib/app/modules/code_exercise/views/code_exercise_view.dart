import 'package:easyflutter/app/constants/dimen_constants.dart';
import 'package:easyflutter/app/views/app_bar_exercise.dart';
import 'package:easyflutter/app/views/code/left_content_code.dart';
import 'package:easyflutter/app/views/code/right_content_code.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/code_exercise_controller.dart';

class CodeExerciseView extends GetView<CodeExerciseController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBarExercise(
        context,
        controller.exerciseId,
        controller.exerciseName,
        controller.isStarted,
      ),
      body: Padding(
        padding: EdgeInsets.all(dimenMedium),
        child: Row(
          children: [
            LeftContentCode(
              exerciseName: controller.exerciseName,
              exerciseCaption: controller.exerciseCaption,
              studentAnswer: controller.studentAnswer,
              isStarted: controller.isStarted,
              isFinished: controller.isFinished,
              onReorder: controller.onReorder,
            ),
            SizedBox(width: dimenMedium),
            RightContentCode(
              stopwatchTimer: controller.stopwatchTimer,
              exerciseName: controller.exerciseName,
              exerciseOutputImage: controller.exerciseOutput,
              dialogMessage: controller.dialogMessage,
              isStarted: controller.isStarted,
              isCorrect: controller.isCorrect,
              checkAnswer: controller.checkAnswer,
              sendAnswer: controller.sendAnswer,
              onDialogStartOnSuccess: controller.dialogStartOnSuccess,
            ),
          ],
        ),
      ),
    );
  }
}
