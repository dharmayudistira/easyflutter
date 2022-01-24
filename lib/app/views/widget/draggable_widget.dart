import 'package:easyflutter/app/data/answer_widget_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class DraggableWidget extends StatelessWidget {
  const DraggableWidget({
    required this.answerList,
    required this.size,
    Key? key,
  }) : super(key: key);

  final List<AnswerWidgetModel> answerList;
  final int size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.r,
      child: Obx(
        () {
          return ListView.separated(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: answerList.length,
            itemBuilder: (context, index) {
              final answer = answerList[index];
              final answerContent = answerList[index].content ?? "";
              final isAnswerUsed = answerList[index].isUsed ?? false;
              return isAnswerUsed
                  ? SizedBox(
                      width: size.r,
                      height: size.r,
                      child: Material(
                        child: Center(
                          child: Text(
                            answerContent,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 14.sp,
                            ),
                          ),
                        ),
                        color: Colors.grey.withOpacity(0.1),
                        shape: const StadiumBorder(),
                      ),
                    )
                  : Draggable<AnswerWidgetModel>(
                      data: answer,
                      child: SizedBox(
                        width: size.r,
                        height: size.r,
                        child: Material(
                          child: Center(
                            child: Text(
                              answerContent,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 14.sp,
                              ),
                            ),
                          ),
                          color: Colors.grey,
                          shape: const StadiumBorder(),
                        ),
                      ),
                      childWhenDragging: SizedBox(
                        width: size.r,
                        height: size.r,
                        child: Material(
                          color: Colors.grey,
                          child: Center(
                            child: Text(
                              answerContent,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 14.sp,
                              ),
                            ),
                          ),
                          shape: const StadiumBorder(),
                        ),
                      ),
                      feedback: SizedBox(
                        width: size.r,
                        height: size.r,
                        child: Material(
                          child: Center(
                            child: Text(
                              answerContent,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 14.sp,
                              ),
                            ),
                          ),
                          color: Colors.grey.withOpacity(0.75),
                          shape: const StadiumBorder(),
                        ),
                      ),
                    );
            },
            separatorBuilder: (context, index) {
              return SizedBox(
                width: 32.r,
              );
            },
          );
        },
      ),
    );
  }
}
