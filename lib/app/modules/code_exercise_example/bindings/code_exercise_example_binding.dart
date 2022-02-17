import 'package:get/get.dart';

import '../controllers/code_exercise_example_controller.dart';

class CodeExerciseExampleBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CodeExerciseExampleController>(
      () => CodeExerciseExampleController(),
    );
  }
}
