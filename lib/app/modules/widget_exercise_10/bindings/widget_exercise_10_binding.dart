import 'package:get/get.dart';

import '../controllers/widget_exercise_10_controller.dart';

class WidgetExercise10Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WidgetExercise10Controller>(
      () => WidgetExercise10Controller(),
    );
  }
}
