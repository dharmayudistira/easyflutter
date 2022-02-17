import 'package:get/get.dart';

import '../controllers/widget_exercise_14_controller.dart';

class WidgetExercise14Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WidgetExercise14Controller>(
      () => WidgetExercise14Controller(),
    );
  }
}
