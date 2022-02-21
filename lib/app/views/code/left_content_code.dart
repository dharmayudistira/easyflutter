import 'package:easyflutter/app/constants/color_constants.dart';
import 'package:easyflutter/app/constants/dimen_constants.dart';
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
              Text(
                exerciseName,
                style: Theme.of(context)
                    .textTheme
                    .subtitle2
                    ?.copyWith(color: Colors.black),
              ),
              SizedBox(height: dimenSmall / 2),
              Text(
                exerciseCaption,
                style: Theme.of(context).textTheme.caption,
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
