import 'package:get/get.dart';

import '../controllers/list_log_student_controller.dart';

class ListLogStudentBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ListLogStudentController);
  }
}
