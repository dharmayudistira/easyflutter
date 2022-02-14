import 'package:get/get.dart';

import '../controllers/code_exercise_15_controller.dart';

class CodeExercise15Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CodeExercise15Controller>(
      () => CodeExercise15Controller(),
    );
  }
}
