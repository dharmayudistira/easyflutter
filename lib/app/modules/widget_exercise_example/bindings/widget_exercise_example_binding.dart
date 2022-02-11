import 'package:get/get.dart';

import '../controllers/widget_exercise_example_controller.dart';

class WidgetExerciseExampleBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WidgetExerciseExampleController>(
      () => WidgetExerciseExampleController(),
    );
  }
}
