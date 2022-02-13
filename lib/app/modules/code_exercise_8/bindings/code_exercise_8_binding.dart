import 'package:get/get.dart';

import '../controllers/code_exercise_8_controller.dart';

class CodeExercise8Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CodeExercise8Controller>(
      () => CodeExercise8Controller(),
    );
  }
}
