import 'package:get/get.dart';

import '../controllers/widget_exercise_5_controller.dart';

class WidgetExercise5Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WidgetExercise5Controller>(
      () => WidgetExercise5Controller(),
    );
  }
}
