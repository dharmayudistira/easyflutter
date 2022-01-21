import 'package:easyflutter/app/constants/color_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SnackBarHelper {
  static void showSnackbar(String title, String message) {
    Get.snackbar(
      title,
      message,
      backgroundColor: ColorConstants.kPrimaryColor,
    );
  }
}
