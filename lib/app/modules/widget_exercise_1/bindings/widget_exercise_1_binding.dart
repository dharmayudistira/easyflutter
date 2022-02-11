import 'package:get/get.dart';

import '../controllers/widget_exercise_1_controller.dart';

class WidgetExercise1Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WidgetExercise1Controller>(
      () => WidgetExercise1Controller(),
    );
  }
}
