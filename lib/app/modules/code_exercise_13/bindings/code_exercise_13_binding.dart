import 'package:get/get.dart';

import '../controllers/code_exercise_13_controller.dart';

class CodeExercise13Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CodeExercise13Controller>(
      () => CodeExercise13Controller(),
    );
  }
}
