import 'package:get/get.dart';

import '../controllers/widget_exercise_2_controller.dart';

class WidgetExercise2Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WidgetExercise2Controller>(
      () => WidgetExercise2Controller(),
    );
  }
}
