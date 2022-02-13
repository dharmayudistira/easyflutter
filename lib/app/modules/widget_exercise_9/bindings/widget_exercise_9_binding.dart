import 'package:get/get.dart';

import '../controllers/widget_exercise_9_controller.dart';

class WidgetExercise9Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WidgetExercise9Controller>(
      () => WidgetExercise9Controller(),
    );
  }
}
