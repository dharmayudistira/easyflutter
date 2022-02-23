import 'package:easyflutter/app/modules/list_exercise_code_reconstruction/controllers/list_exercise_code_reconstruction_controller.dart';
import 'package:easyflutter/app/modules/list_exercise_widget_tree_reconstruction/controllers/list_exercise_widget_tree_reconstruction_controller.dart';
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

  Future<void> logout(BuildContext context) async {
    Get.delete<DashboardStudentController>();
    Get.delete<ListExerciseCodeReconstructionController>();
    Get.delete<ListExerciseWidgetTreeReconstructionController>();

    Get.offAllNamed(Routes.LOGIN);
    SnackBarHelper.showFlushbarSuccess(
      "Sukses",
      "Sampai jumpa lagi, ${_storageHelper.getNameUser()}",
    )..show(context);
    await _storageHelper.clearStorage();
  }
}
