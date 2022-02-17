import 'package:get/get.dart';

import '../controllers/widget_exercise_13_controller.dart';

class WidgetExercise13Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WidgetExercise13Controller>(
      () => WidgetExercise13Controller(),
    );
  }
}
