import 'package:easyflutter/app/routes/app_pages.dart';
import 'package:easyflutter/app/utils/snackbar_helper.dart';
import 'package:easyflutter/app/utils/storage_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class DashboardStudentController extends GetxController {
  final _storageHelper = Get.find<StorageHelper>();

  var selectedIndex = 0.obs;

  void setSelectedIndex(int index) {
    selectedIndex.value = index;
  }

  void logout(BuildContext context) async {
    Get.offNamed(Routes.LOGIN);
    SnackBarHelper.showFlushbarSuccess(
      "Sukses",
      "Sampai jumpa lagi, ${_storageHelper.getNameUser()}",
    )..show(context);
    await _storageHelper.clearStorage();
  }
}
