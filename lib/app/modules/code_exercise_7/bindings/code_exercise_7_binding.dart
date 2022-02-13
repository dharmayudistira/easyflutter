import 'package:get/get.dart';

import '../controllers/code_exercise_7_controller.dart';

class CodeExercise7Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CodeExercise7Controller>(
      () => CodeExercise7Controller(),
    );
  }
}
