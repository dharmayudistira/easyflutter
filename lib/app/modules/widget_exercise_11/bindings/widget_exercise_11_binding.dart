import 'package:get/get.dart';

import '../controllers/widget_exercise_11_controller.dart';

class WidgetExercise11Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WidgetExercise11Controller>(
      () => WidgetExercise11Controller(),
    );
  }
}
