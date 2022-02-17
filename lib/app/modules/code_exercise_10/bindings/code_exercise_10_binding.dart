import 'package:get/get.dart';

import '../controllers/code_exercise_10_controller.dart';

class CodeExercise10Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CodeExercise10Controller>(
      () => CodeExercise10Controller(),
    );
  }
}
