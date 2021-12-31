import 'package:easyflutter/app/constants/style_constants.dart';
import 'package:easyflutter/app/utils/storage_helper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await GetStorage.init();
  await Firebase.initializeApp();

  Get.put(StorageHelper());

  runApp(_buildApp());
}

Widget _buildApp() {
  return GetMaterialApp(
    title: "Application",
    debugShowCheckedModeBanner: false,
    initialRoute: AppPages.INITIAL,
    getPages: AppPages.routes,
    theme: ThemeData(
      textTheme: myTextTheme,
    ),
  );
}
