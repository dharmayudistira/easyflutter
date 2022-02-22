import 'package:get/get.dart';

import '../controllers/widget_exercise_controller.dart';

class WidgetExerciseBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WidgetExerciseController>(
      () => WidgetExerciseController(),
    );
  }
}
