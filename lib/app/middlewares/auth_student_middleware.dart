import 'package:easyflutter/app/routes/app_pages.dart';
import 'package:easyflutter/app/utils/storage_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthStudentMiddleware extends GetMiddleware {

  @override
  int? get priority => 1;

  final _storageHelper = Get.find<StorageHelper>();

  @override
  RouteSettings? redirect(String? route) {
    final isAuthenticated = _storageHelper.getIsLoginStudent();

    if (isAuthenticated == false) {
      return RouteSettings(name: Routes.LOGIN);
    }
  }
}