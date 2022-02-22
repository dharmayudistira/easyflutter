import 'package:easyflutter/app/constants/dimen_constants.dart';
import 'package:easyflutter/app/utils/custom_text_helper.dart';
import 'package:easyflutter/app/utils/dialog_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

class RightContentCode extends StatelessWidget {
  final StopWatchTimer stopwatchTimer;
  final String exerciseName;
  final String exerciseOutputImage;
  final RxBool isStarted;
  final RxBool isCorrect;
  final Function checkAnswer;
  final Function sendAnswer;
  final Function onDialogStartOnSuccess;

  RightContentCode({
    required this.stopwatchTimer,
    required this.exerciseName,
    required this.exerciseOutputImage,
    required this.isStarted,
    required this.isCorrect,
    required this.checkAnswer,
    required this.sendAnswer,
    required this.onDialogStartOnSuccess,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
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
                        CustomTextHelper.textBody(
                          context: context,
                          text: "Output yang diharapkan : ",
                        ),
                        StreamBuilder<int>(
                          stream: stopwatchTimer.rawTime,
                          initialData: stopwatchTimer.rawTime.value,
                          builder: (context, snapshot) {
                            final snapshotData = snapshot.data as int;
                            final displayTime = StopWatchTimer.getDisplayTime(
                                snapshotData,
                                hours: true);
                            final hideMilSecTime = displayTime.substring(0, 8);
                            return CustomTextHelper.textBody(
                              context: context,
                              text: hideMilSecTime,
                            );
                          },
                        ),
                      ],
                    ),
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(dimenSmall / 2),
                        child: Image.asset(exerciseOutputImage),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: dimenSmall),
              Obx(
                () {
                  if (isStarted.value) {
                    return Expanded(
                      flex: 1,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Obx(() {
                            return ElevatedButton(
                              onPressed: (isCorrect.value)
                                  ? null
                                  : () {
                                      checkAnswer(context);
                                    },
                              child: CustomTextHelper.textBody(
                                context: context,
                                text: "Cek Jawaban",
                                customColor: Colors.white,
                              ),
                            );
                          }),
                          SizedBox(width: dimenSmall),
                          Obx(() {
                            return ElevatedButton(
                              onPressed: (isCorrect.value)
                                  ? () {
                                      sendAnswer();
                                      showDialog(
                                        barrierDismissible: false,
                                        context: context,
                                        builder: (context) {
                                          return DialogHelper
                                              .dialogSendAnswerExercise(
                                            context,
                                            exerciseName,
                                          );
                                        },
                                      );
                                    }
                                  : null,
                              child: CustomTextHelper.textBody(
                                context: context,
                                text: "Kirim Jawaban",
                                customColor: Colors.white,
                              ),
                            );
                          }),
                        ],
                      ),
                    );
                  } else {
                    return Container(
                      width: double.maxFinite,
                      child: ElevatedButton(
                        child: CustomTextHelper.textBody(
                          context: context,
                          text: "Kerjakan Latihan",
                          customColor: Colors.white,
                        ),
                        onPressed: () {
                          showDialog(
                            barrierDismissible: false,
                            context: context,
                            builder: (context) {
                              return DialogHelper.dialogStartExercise(
                                context,
                                exerciseName,
                                onDialogStartOnSuccess,
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
      ),
    );
  }
}
