import 'package:get/get.dart';

import '../controllers/widget_exercise_7_controller.dart';

class WidgetExercise7Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WidgetExercise7Controller>(
      () => WidgetExercise7Controller(),
    );
  }
}
