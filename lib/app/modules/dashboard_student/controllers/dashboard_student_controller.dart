import 'package:easyflutter/app/modules/list_exercise_code_reconstruction/controllers/list_exercise_code_reconstruction_controller.dart';
import 'package:easyflutter/app/modules/list_exercise_widget_tree_reconstruction/controllers/list_exercise_widget_tree_reconstruction_controller.dart';
import 'package:easyflutter/app/routes/app_pages.dart';
import 'package:easyflutter/app/utils/snackbar_helper.dart';
import 'package:easyflutter/app/utils/storage_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class DashboardStudentController extends GetxController {
  final _storageHelper = Get.find<StorageHelper>();
  final dashboardContentController = PageController(initialPage: 0);
  final featureController = PageController(initialPage: 0);

  var selectedIndex = 0.obs;

  @override
  void onClose() {
    dashboardContentController.dispose();
    super.onClose();
  }

  void setSelectedIndex(int index) {
    selectedIndex.value = index;
  }

  void navigateFeature(int index) {
    switch (index) {
      case 0:
        featureController.animateToPage(
          0,
          duration: Duration(seconds: 1),
          curve: Curves.easeInOut,
        );
        break;
      case 1:
        featureController.animateToPage(
          1,
          duration: Duration(seconds: 1),
          curve: Curves.easeInOut,
        );
        break;
      case 2:
        featureController.animateToPage(
          2,
          duration: Duration(seconds: 1),
          curve: Curves.easeInOut,
        );
        break;
    }
  }

  void nextContent() {
    dashboardContentController.animateToPage(
      1,
      duration: Duration(seconds: 1),
      curve: Curves.easeInOut,
    );
  }

  void previousContent() {
    dashboardContentController.animateToPage(
      0,
      duration: Duration(seconds: 1),
      curve: Curves.easeInOut,
    );
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
