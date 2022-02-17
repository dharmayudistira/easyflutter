import 'package:get/get.dart';

import '../controllers/code_exercise_6_controller.dart';

class CodeExercise6Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CodeExercise6Controller>(
      () => CodeExercise6Controller(),
    );
  }
}
