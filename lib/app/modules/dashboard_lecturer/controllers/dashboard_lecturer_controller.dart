import 'package:easyflutter/app/modules/add_student/controllers/add_student_controller.dart';
import 'package:easyflutter/app/modules/data_class/controllers/data_class_controller.dart';
import 'package:easyflutter/app/modules/data_student/controllers/data_student_controller.dart';
import 'package:easyflutter/app/modules/list_exercise/controllers/list_exercise_controller.dart';
import 'package:easyflutter/app/modules/list_log_student/controllers/list_log_student_controller.dart';
import 'package:easyflutter/app/routes/app_pages.dart';
import 'package:easyflutter/app/utils/snackbar_helper.dart';
import 'package:easyflutter/app/utils/storage_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class DashboardLecturerController extends GetxController {
  final storageHelper = Get.find<StorageHelper>();

  var selectedIndexScreen = 0.obs;
  var _selectedClass = "";
  var _selectedExercise = "";

  void setSelectedIndex(int selected) {
    selectedIndexScreen.value = selected;
  }

  void setSelectedClass(String classId) {
    _selectedClass = classId;
  }

  String getSelectedClass() {
    return _selectedClass;
  }

  void setSelectedExercise(String exerciseId) {
    _selectedExercise = exerciseId;
  }

  String getSelectedExercise() {
    return _selectedExercise;
  }

  Future<void> logout(BuildContext context) async {
    Get.offNamed(Routes.LOGIN);
    SnackBarHelper.showFlushbarSuccess(
      "Sukses",
      "Sampai jumpa lagi, ${storageHelper.getNameUser()}",
    )..show(context);
    await storageHelper.clearStorage();
  }
}
