import 'package:get/get.dart';

import '../controllers/widget_exercise_8_controller.dart';

class WidgetExercise8Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WidgetExercise8Controller>(
      () => WidgetExercise8Controller(),
    );
  }
}
