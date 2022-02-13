import 'package:easyflutter/app/constants/color_constants.dart';
import 'package:easyflutter/app/utils/dialog_helper.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

AppBar buildAppBarExercise(
  BuildContext context,
  String exerciseId,
  String exerciseName,
  RxBool isStarted,
) {
  return AppBar(
    title: Text(
      "Latihan ID : $exerciseId",
      style:
          Theme.of(context).textTheme.subtitle2?.copyWith(color: Colors.black),
    ),
    leading: IconButton(
      icon: FaIcon(
        FontAwesomeIcons.angleLeft,
        color: Colors.black,
      ),
      onPressed: () {
        if (isStarted.value) {
          showDialog(
            barrierDismissible: false,
            context: context,
            builder: (context) {
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
    ),
    centerTitle: false,
    backgroundColor: ColorConstants.kPrimaryColor,
    elevation: 0,
  );
}
