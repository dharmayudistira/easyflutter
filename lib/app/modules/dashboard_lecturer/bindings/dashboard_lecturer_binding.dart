import 'package:get/get.dart';

import '../controllers/dashboard_lecturer_controller.dart';

class DashboardLecturerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashboardLecturerController>(
      () => DashboardLecturerController(),
    );
  }
}
