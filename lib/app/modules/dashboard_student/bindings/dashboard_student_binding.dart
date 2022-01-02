import 'package:get/get.dart';

import '../controllers/dashboard_student_controller.dart';

class DashboardStudentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashboardStudentController>(
      () => DashboardStudentController(),
    );
  }
}
