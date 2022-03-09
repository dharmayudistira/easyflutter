import 'package:easyflutter/app/constants/color_constants.dart';
import 'package:easyflutter/app/utils/custom_text_helper.dart';
import 'package:easyflutter/app/views/widget/back_button_exercise_widget.dart';
import 'package:easyflutter/app/views/widget/drag_target_widget.dart';
import 'package:easyflutter/app/views/widget/draggable_widget.dart';
import 'package:easyflutter/app/views/widget/left_content_widget.dart';
import 'package:easyflutter/app/views/widget/right_content_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../controllers/widget_exercise_controller.dart';

class WidgetExercise1View extends StatelessWidget {
  final controller = Get.put(WidgetExerciseController());

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
              exerciseName: controller.exerciseName,
            ),
            title: CustomTextHelper.textBody(
              context: context,
              text: "Latihan ID: ${controller.exerciseId}",
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
                                "assets/images/widget/widget_tree1.png",
                              ),
                            ),
                          ),
                        ),
                        Column(
                          children: [
                            SizedBox(height: 127.5.r),
                            Row(
                              children: [
                                SizedBox(width: 264.h),
                                DragTargetWidget(
                                  acceptAnswer: controller.acceptAnswer,
                                  targetAnswer: controller.targetAnswer,
                                  index: 0,
                                  size: 70,
                                ),
                              ],
                            ),
                            SizedBox(height: 34.8.r),
                            Row(
                              children: [
                                SizedBox(width: 333.5.h),
                                DragTargetWidget(
                                  acceptAnswer: controller.acceptAnswer,
                                  targetAnswer: controller.targetAnswer,
                                  index: 1,
                                  size: 70,
                                ),
                              ],
                            ),
                            SizedBox(height: 34.8.r),
                            Row(
                              children: [
                                SizedBox(width: 403.3.h),
                                DragTargetWidget(
                                  acceptAnswer: controller.acceptAnswer,
                                  targetAnswer: controller.targetAnswer,
                                  index: 2,
                                  size: 70,
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
                      size: 80,
                    ),
                  ),
                ),
                RightContentWidget(
                  stopWatchTimer: controller.stopWatchTimer,
                  image: "assets/images/widget/latihan1.png",
                  exerciseName: controller.exerciseName,
                  isStart: controller.isStart,
                  isAnswerTrue: controller.isAnswerTrue,
                  startExercise: controller.startExercise,
                  checkAnswer: controller.checkAnswer,
                  dialogMessage: controller.dialogMessage,
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
