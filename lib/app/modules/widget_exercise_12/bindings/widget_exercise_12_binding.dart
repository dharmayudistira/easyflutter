import 'package:get/get.dart';

import '../controllers/widget_exercise_12_controller.dart';

class WidgetExercise12Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WidgetExercise12Controller>(
      () => WidgetExercise12Controller(),
    );
  }
}
