import 'package:easyflutter/app/constants/color_constants.dart';
import 'package:easyflutter/app/views/widget/back_button_exercise_widget.dart';
import 'package:easyflutter/app/views/widget/drag_target_widget.dart';
import 'package:easyflutter/app/views/widget/draggable_widget.dart';
import 'package:easyflutter/app/views/widget/left_content_widget.dart';
import 'package:easyflutter/app/views/widget/right_content_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../controllers/widget_exercise_11_controller.dart';

class WidgetExercise11View extends GetView<WidgetExercise11Controller> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(1366, 768),
      builder: () {
        return Scaffold(
          appBar: AppBar(
            centerTitle: false,
            leading: BackButtonExercise(
              isStart: controller.isStart,
            ),
            title: Text(
              "Latihan ID: ${controller.exerciseId}",
              style: Theme.of(context)
                  .textTheme
                  .subtitle2
                  ?.copyWith(color: Colors.black),
            ),
            backgroundColor: ColorConstants.kPrimaryColor,
            elevation: 0,
          ),
          body: Container(
            color: Colors.grey.withOpacity(0.1),
            child: Row(
              children: [
                LeftContentWidget(
                  exerciseName: controller.exerciseName,
                  exerciseDescription: controller.exerciseDescription,
                  dragTargetContent: Center(
                    child: Stack(
                      children: [
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                          child: Center(
                            child: SizedBox(
                              height: 420.h,
                              child: Image.asset(
                                "assets/images/widget/widget_tree11.png",
                              ),
                            ),
                          ),
                        ),
                        Column(
                          children: [
                            SizedBox(height: 124.5.r),
                            Row(
                              children: [
                                SizedBox(width: 293.h),
                                DragTargetWidget(
                                  acceptAnswer: controller.acceptAnswer,
                                  targetAnswers: controller.targetAnswers,
                                  index: 0,
                                  size: 80,
                                ),
                              ],
                            ),
                            SizedBox(height: 20.r),
                            Row(
                              children: [
                                SizedBox(width: 113.5.h),
                                DragTargetWidget(
                                  acceptAnswer: controller.acceptAnswer,
                                  targetAnswers: controller.targetAnswers,
                                  index: 1,
                                  size: 80,
                                ),
                                SizedBox(width: 279.h),
                                DragTargetWidget(
                                  acceptAnswer: controller.acceptAnswer,
                                  targetAnswers: controller.targetAnswers,
                                  index: 2,
                                  size: 80,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  draggableContent: Center(
                    child: DraggableWidget(
                      answerList: controller.answerList,
                      size: 70,
                    ),
                  ),
                ),
                RightContentWidget(
                  stopWatchTimer: controller.stopWatchTimer,
                  image: "assets/images/widget/latihan11.png",
                  exerciseName: controller.exerciseName,
                  isStart: controller.isStart,
                  isAnswerTrue: controller.isAnswerTrue,
                  startExercise: controller.startExercise,
                  checkAnswer: controller.checkAnswer,
                  sendAnswer: controller.sendAnswer,
                  reset: controller.reset,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}