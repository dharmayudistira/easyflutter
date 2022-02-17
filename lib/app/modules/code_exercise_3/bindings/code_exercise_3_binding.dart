import 'package:get/get.dart';

import '../controllers/code_exercise_3_controller.dart';

class CodeExercise3Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CodeExercise3Controller>(
      () => CodeExercise3Controller(),
    );
  }
}
