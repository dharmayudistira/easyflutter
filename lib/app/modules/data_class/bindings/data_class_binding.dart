import 'package:get/get.dart';

import '../controllers/data_class_controller.dart';

class DataClassBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DataClassController>(
      () => DataClassController(),
    );
  }
}
