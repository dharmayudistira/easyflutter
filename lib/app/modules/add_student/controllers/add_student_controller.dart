import 'package:easyflutter/app/modules/dashboard_lecturer/controllers/dashboard_lecturer_controller.dart';
import 'package:get/get.dart';

class AddStudentController extends GetxController {

  final dashboardLecturerController = Get.find<DashboardLecturerController>();
  final listClass = ["TI-3A", "TI-3B", "TI-3C", "TI-3D"].obs;

  var selectedClass = "TI-3A".obs;

}
