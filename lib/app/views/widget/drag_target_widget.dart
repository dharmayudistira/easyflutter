import 'package:easyflutter/app/data/answer_widget_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class DragTargetWidget extends StatelessWidget {
  const DragTargetWidget({
    required this.acceptAnswer,
    required this.targetAnswers,
    required this.index,
    required this.size,
    Key? key,
  }) : super(key: key);

  final Function acceptAnswer;
  final List<AnswerWidgetModel> targetAnswers;
  final int index;
  final int size;

  @override
  Widget build(BuildContext context) {
    return DragTarget<AnswerWidgetModel>(
      onWillAccept: (data) => true,
      onAccept: (data) {
        acceptAnswer(data, index);
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
                    targetAnswers[index].content ?? "",
                    style: TextStyle(
                      fontSize: 13.sp,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                color: targetAnswers[index].isUsed ?? false
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
