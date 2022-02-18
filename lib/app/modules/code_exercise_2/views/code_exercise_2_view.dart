import 'package:easyflutter/app/constants/color_constants.dart';
import 'package:easyflutter/app/constants/dimen_constants.dart';
import 'package:easyflutter/app/utils/dialog_helper.dart';
import 'package:easyflutter/app/views/app_bar_exercise.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

import '../controllers/code_exercise_2_controller.dart';

class CodeExercise2View extends GetView<CodeExercise2Controller> {
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
            Expanded(
              child: _buildLeftContent(context),
            ),
            SizedBox(width: dimenMedium),
            Expanded(
              child: _buildRightContent(context),
            ),
          ],
        ),
      ),
    );
  }

  _buildLeftContent(BuildContext context) {
    return Card(
      elevation: dimenSmall,
      child: Padding(
        padding: EdgeInsets.all(dimenSmall),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              controller.exerciseName,
              style: Theme.of(context)
                  .textTheme
                  .subtitle2
                  ?.copyWith(color: Colors.black),
            ),
            SizedBox(height: dimenSmall / 2),
            Text(
              controller.exerciseCaption,
              style: Theme.of(context).textTheme.caption,
            ),
            SizedBox(height: dimenSmall),
            Expanded(
              child: Obx(() {
                return ReorderableListView(
                  children: controller.studentAnswer.map((element) {
                    final valueKey = element["keyValue"] as int;
                    final valueText = element["codeValue"] as String;
                    final valuePadding = element["paddingValue"] as double;

                    return Card(
                      key: ValueKey(valueKey),
                      child: ListTile(
                        leading: SizedBox(width: valuePadding),
                        title: Text(
                          valueText,
                          style: Theme.of(context)
                              .textTheme
                              .caption
                              ?.copyWith(color: Colors.black),
                        ),
                        tileColor: ColorConstants.kPrimaryColor,
                      ),
                    );
                  }).toList(),
                  onReorder: (oldIndex, newIndex) {
                    if (controller.isStarted.value) {
                      if (!controller.isFinished.value) {
                        controller.onReorder(oldIndex, newIndex);
                      }
                    }
                  },
                );
              }),
            )
          ],
        ),
      ),
    );
  }

  _buildRightContent(BuildContext context) {
    return Card(
      elevation: dimenSmall,
      child: Padding(
        padding: EdgeInsets.all(dimenSmall),
        child: Column(
          children: [
            Expanded(
              flex: 5,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Output yang diharapkan : ",
                        style: Theme.of(context)
                            .textTheme
                            .subtitle2
                            ?.copyWith(color: Colors.black),
                      ),
                      StreamBuilder<int>(
                        stream: controller.stopwatchTimer.rawTime,
                        initialData: controller.stopwatchTimer.rawTime.value,
                        builder: (context, snapshot) {
                          final snapshotData = snapshot.data as int;
                          final displayTime = StopWatchTimer.getDisplayTime(
                              snapshotData,
                              hours: true);
                          final hideMilSecTime = displayTime.substring(0, 8);
                          return Text(
                            hideMilSecTime,
                            style: Theme.of(context)
                                .textTheme
                                .subtitle2
                                ?.copyWith(color: Colors.black),
                          );
                        },
                      ),
                    ],
                  ),
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(dimenSmall / 2),
                      child:
                          Image.asset("assets/images/code/output_soal_2.png"),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: dimenSmall),
            Obx(
              () {
                if (controller.isStarted.value) {
                  return Expanded(
                    flex: 1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Obx(() {
                          return ElevatedButton(
                            onPressed: (controller.isCorrect.value)
                                ? null
                                : () {
                                    controller.checkAnswer(context);
                                  },
                            child: Text("Cek Jawaban"),
                          );
                        }),
                        SizedBox(width: dimenSmall),
                        Obx(() {
                          return ElevatedButton(
                            onPressed: (controller.isCorrect.value)
                                ? () {
                                    controller.sendAnswer();
                                    showDialog(
                                      barrierDismissible: false,
                                      context: context,
                                      builder: (context) {
                                        return DialogHelper
                                            .dialogSendAnswerExercise(
                                          context,
                                          controller.exerciseName,
                                        );
                                      },
                                    );
                                  }
                                : null,
                            child: Text("Kirim Jawaban"),
                          );
                        }),
                      ],
                    ),
                  );
                } else {
                  return Container(
                    width: double.maxFinite,
                    child: ElevatedButton(
                      child: Text("Kerjakan Latihan"),
                      onPressed: () {
                        showDialog(
                          barrierDismissible: false,
                          context: context,
                          builder: (context) {
                            return DialogHelper.dialogStartExercise(
                              context,
                              controller.exerciseName,
                              controller.dialogStartOnSuccess,
                            );
                          },
                        );
                      },
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
