import 'package:easyflutter/app/modules/dashboard_lecturer/controllers/dashboard_lecturer_controller.dart';
import 'package:easyflutter/app/utils/storage_helper.dart';
import 'package:get/get.dart';

class AddStudentController extends GetxController {

  final _storageHelper = Get.find<StorageHelper>();
  final dashboardLecturerController = Get.find<DashboardLecturerController>();
  final listClass = ["Pilih Kelas"].obs;

  var selectedClass = "Pilih Kelas".obs;

  String getLecturerName() {
    return _storageHelper.getNameUser();
  }

}
