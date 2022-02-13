import 'package:get/get.dart';

import '../controllers/code_exercise_4_controller.dart';

class CodeExercise4Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CodeExercise4Controller>(
      () => CodeExercise4Controller(),
    );
  }
}
