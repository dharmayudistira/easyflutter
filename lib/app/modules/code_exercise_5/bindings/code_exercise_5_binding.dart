import 'package:get/get.dart';

import '../controllers/code_exercise_5_controller.dart';

class CodeExercise5Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CodeExercise5Controller>(
      () => CodeExercise5Controller(),
    );
  }
}
