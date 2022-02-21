import 'package:easyflutter/app/constants/color_constants.dart';
import 'package:easyflutter/app/constants/dimen_constants.dart';
import 'package:easyflutter/app/utils/custom_text_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

class LeftContentCode extends StatelessWidget {
  final String exerciseName;
  final String exerciseCaption;
  final RxList<Map<String, Object>> studentAnswer;
  final RxBool isStarted;
  final RxBool isFinished;
  final Function onReorder;

  LeftContentCode({
    required this.exerciseName,
    required this.exerciseCaption,
    required this.studentAnswer,
    required this.isStarted,
    required this.isFinished,
    required this.onReorder,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        elevation: dimenSmall,
        child: Padding(
          padding: EdgeInsets.all(dimenSmall),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextHelper.textBody(
                context: context,
                text: exerciseName,
                customWeight: FontWeight.bold,
              ),
              SizedBox(height: dimenSmall / 2),
              CustomTextHelper.textCaption(
                context: context,
                text: exerciseCaption,
              ),
              SizedBox(height: dimenSmall),
              Expanded(
                child: Obx(() {
                  return ReorderableListView(
                    scrollController: ScrollController(),
                    children: studentAnswer.map((element) {
                      final valueKey = element["keyValue"] as int;
                      final valueText = element["codeValue"] as String;
                      final valuePadding = element["paddingValue"] as double;

                      return Card(
                        key: ValueKey(valueKey),
                        child: ListTile(
                          leading: SizedBox(width: valuePadding),
                          title: CustomTextHelper.textCaption(
                            context: context,
                            text: valueText,
                          ),
                          tileColor: ColorConstants.kPrimaryColor,
                        ),
                      );
                    }).toList(),
                    onReorder: (oldIndex, newIndex) {
                      if (isStarted.value) {
                        if (!isFinished.value) {
                          onReorder(oldIndex, newIndex);
                        }
                      }
                    },
                  );
                }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
