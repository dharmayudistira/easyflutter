import 'package:get/get.dart';

import '../controllers/code_exercise_14_controller.dart';

class CodeExercise14Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CodeExercise14Controller>(
      () => CodeExercise14Controller(),
    );
  }
}
