import 'package:get/get.dart';

import '../controllers/code_exercise_controller.dart';

class CodeExerciseBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CodeExerciseController>(
      () => CodeExerciseController(),
    );
  }
}
