import 'package:get/get.dart';

import '../controllers/code_exercise_2_controller.dart';

class CodeExercise2Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CodeExercise2Controller>(
      () => CodeExercise2Controller(),
    );
  }
}
