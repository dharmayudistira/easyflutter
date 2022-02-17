import 'package:get/get.dart';

import '../controllers/widget_exercise_4_controller.dart';

class WidgetExercise4Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WidgetExercise4Controller>(
      () => WidgetExercise4Controller(),
    );
  }
}
