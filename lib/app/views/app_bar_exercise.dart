import 'package:easyflutter/app/constants/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

AppBar buildAppBarExercise(BuildContext context, String exerciseId) {
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
      onPressed: () => Get.back(),
    ),
    centerTitle: false,
    backgroundColor: ColorConstants.kPrimaryColor,
    elevation: 0,
  );
}
