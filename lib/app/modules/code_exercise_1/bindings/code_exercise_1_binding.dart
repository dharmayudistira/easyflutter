import 'package:get/get.dart';

import '../controllers/code_exercise_1_controller.dart';

class CodeExercise1Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CodeExercise1Controller>(
      () => CodeExercise1Controller(),
    );
  }
}
