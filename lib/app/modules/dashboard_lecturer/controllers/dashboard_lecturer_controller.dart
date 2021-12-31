import 'package:easyflutter/app/modules/data_class/views/data_class_view.dart';
import 'package:easyflutter/app/modules/data_student/views/data_student_view.dart';
import 'package:easyflutter/app/routes/app_pages.dart';
import 'package:easyflutter/app/utils/storage_helper.dart';
import 'package:get/get.dart';

class DashboardLecturerController extends GetxController {

  final storageHelper = Get.find<StorageHelper>();

  var selectedIndexScreen = 0.obs;

  void setSelectedIndex(int selected) {
    selectedIndexScreen.value = selected;
  }

  Future<void> logout() async {
    Get.snackbar("Berhasil Keluar", "Sampai jumpa lagi! ${storageHelper.getNameUser()}");
    await storageHelper.clearStorage();
    Get.offNamed(Routes.LOGIN);
  }

}
