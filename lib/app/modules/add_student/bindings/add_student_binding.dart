import 'package:get/get.dart';

import '../controllers/add_student_controller.dart';

class AddStudentBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AddStudentController());
  }
}
