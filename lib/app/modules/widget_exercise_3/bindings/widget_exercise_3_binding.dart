import 'package:get/get.dart';

import '../controllers/widget_exercise_3_controller.dart';

class WidgetExercise3Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WidgetExercise3Controller>(
      () => WidgetExercise3Controller(),
    );
  }
}
