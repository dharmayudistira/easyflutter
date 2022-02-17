import 'package:get/get.dart';

import '../controllers/code_exercise_9_controller.dart';

class CodeExercise9Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CodeExercise9Controller>(
      () => CodeExercise9Controller(),
    );
  }
}
