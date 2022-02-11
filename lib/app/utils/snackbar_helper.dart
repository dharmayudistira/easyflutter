import 'package:easyflutter/app/constants/color_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SnackBarHelper {
  static void showSnackbarSuccess(String title, String message) {
    Get.snackbar(
      title,
      message,
      backgroundColor: Colors.blue.withOpacity(0.2),
    );
  }

  static void showSnackbarWarning(String title, String message) {
    Get.snackbar(
      title,
      message,
      backgroundColor: Colors.yellow.withOpacity(0.2),
    );
  }

  static void showSnackbarFailed(String title, String message) {
    Get.snackbar(
      title,
      message,
      backgroundColor: Colors.red.withOpacity(0.2),
    );
  }
}
