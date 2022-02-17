import 'package:get/get.dart';

import '../controllers/code_exercise_11_controller.dart';

class CodeExercise11Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CodeExercise11Controller>(
      () => CodeExercise11Controller(),
    );
  }
}
