import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

import 'buttons_widget.dart';
import 'stopwatch_widget.dart';

class RightContentWidget extends StatelessWidget {
  const RightContentWidget({
    required this.stopWatchTimer,
    required this.image,
    required this.exerciseName,
    required this.isStart,
    required this.isAnswerTrue,
    required this.startExercise,
    required this.checkAnswer,
    required this.sendAnswer,
    required this.reset,
    Key? key,
  }) : super(key: key);

  final StopWatchTimer stopWatchTimer;
  final String image;
  final String exerciseName;
  final RxBool isStart;
  final RxBool isAnswerTrue;
  final Function startExercise;
  final Function checkAnswer;
  final Function sendAnswer;
  final Function reset;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Padding(
        padding: EdgeInsets.only(
          left: 16.w,
          top: 16.h,
          right: 32.w,
          bottom: 16.h,
        ),
        child: Card(
          elevation: 8.r,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Output yang diharapkan",
                      style: Theme.of(context)
                          .textTheme
                          .subtitle1
                          ?.copyWith(color: Colors.black),
                    ),
                    StopWatchWidget(
                      stopWatchTimer: stopWatchTimer,
                    ),
                  ],
                ),
                Center(
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: SizedBox(
                      height: 420.h,
                      child: Image.asset(image),
                    ),
                  ),
                ),
                ButtonsWidget(
                  exerciseName: exerciseName,
                  isStart: isStart,
                  isAnswerTrue: isAnswerTrue,
                  startExercise: startExercise,
                  checkAnswer: checkAnswer,
                  sendAnswer: sendAnswer,
                  reset: reset,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
