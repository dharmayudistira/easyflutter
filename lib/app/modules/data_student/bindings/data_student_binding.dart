import 'package:get/get.dart';

import '../controllers/data_student_controller.dart';

class DataStudentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DataStudentController>(
      () => DataStudentController(),
    );
  }
}
