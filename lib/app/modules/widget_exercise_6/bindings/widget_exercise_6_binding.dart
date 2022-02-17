import 'package:get/get.dart';

import '../controllers/widget_exercise_6_controller.dart';

class WidgetExercise6Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WidgetExercise6Controller>(
      () => WidgetExercise6Controller(),
    );
  }
}
