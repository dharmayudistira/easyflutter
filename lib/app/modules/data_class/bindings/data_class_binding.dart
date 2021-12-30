import 'package:get/get.dart';

import '../controllers/data_class_controller.dart';

class DataClassBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(DataClassController());
  }
}
