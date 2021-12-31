import 'package:get/get.dart';

import '../controllers/list_exercise_controller.dart';

class ListExerciseBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ListExerciseController());
  }
}
