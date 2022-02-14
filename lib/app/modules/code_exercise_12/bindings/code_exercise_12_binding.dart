import 'package:get/get.dart';

import '../controllers/code_exercise_12_controller.dart';

class CodeExercise12Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CodeExercise12Controller>(
      () => CodeExercise12Controller(),
    );
  }
}
