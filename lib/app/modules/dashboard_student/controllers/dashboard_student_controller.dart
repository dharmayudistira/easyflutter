import 'package:easyflutter/app/routes/app_pages.dart';
import 'package:easyflutter/app/utils/storage_helper.dart';
import 'package:get/get.dart';

class DashboardStudentController extends GetxController {

  final _storageHelper = Get.find<StorageHelper>();

  var selectedIndex = 0.obs;

  void setSelectedIndex(int index) {
    selectedIndex.value = index;
  }

  Future<void> logout() async {
    Get.snackbar("Berhasil Keluar", "Sampai jumpa lagi! ${_storageHelper.getNameUser()}");
    await _storageHelper.clearStorage();
    Get.offNamed(Routes.LOGIN);
  }
}
