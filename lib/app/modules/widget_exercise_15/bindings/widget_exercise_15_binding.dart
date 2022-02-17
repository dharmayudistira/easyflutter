import 'package:get/get.dart';

import '../controllers/widget_exercise_15_controller.dart';

class WidgetExercise15Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WidgetExercise15Controller>(
      () => WidgetExercise15Controller(),
    );
  }
}
