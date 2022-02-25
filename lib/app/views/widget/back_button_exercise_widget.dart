import 'package:easyflutter/app/utils/dialog_helper.dart';
import "package:flutter/material.dart";
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class BackButtonExercise extends StatelessWidget {
  const BackButtonExercise({
    required this.isStart,
    required this.exerciseName,
    Key? key,
  }) : super(key: key);

  final RxBool isStart;
  final String exerciseName;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        if (isStart.value) {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return DialogHelper.dialogBackExercise(
                context,
                exerciseName,
              );
            },
          );
        } else {
          Get.back();
        }
      },
      icon: FaIcon(
        FontAwesomeIcons.angleLeft,
        color: Colors.black,
      ),
    );
  }
}
