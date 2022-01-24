import 'package:easyflutter/app/data/answer_widget_model.dart';
import 'package:easyflutter/app/modules/widget_exercise_1/controllers/widget_exercise_1_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class DragTargetWidget extends StatelessWidget {
  const DragTargetWidget({
    required this.controller,
    required this.index,
    required this.size,
    Key? key,
  }) : super(key: key);

  final WidgetExercise1Controller controller;
  final int index;
  final int size;

  @override
  Widget build(BuildContext context) {
    return DragTarget<AnswerWidgetModel>(
      onWillAccept: (data) => true,
      onAccept: (data) {
        controller.acceptAnswer(data, index);
      },
      builder: (context, candidateData, rejectedData) {
        return Obx(
          () {
            return SizedBox(
              width: size.r,
              height: size.r,
              child: Material(
                child: Center(
                  child: Text(
                    controller.targetAnswers[index].content ?? "",
                    style: TextStyle(fontSize: 14.sp),
                  ),
                ),
                color: controller.targetAnswers[index].isUsed ?? false
                    ? Colors.white.withOpacity(0.25)
                    : Colors.white,
                shape: const StadiumBorder(),
              ),
            );
          },
        );
      },
    );
  }
}
