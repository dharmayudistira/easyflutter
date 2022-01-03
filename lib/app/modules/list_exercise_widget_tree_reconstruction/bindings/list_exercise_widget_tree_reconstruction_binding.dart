import 'package:get/get.dart';

import '../controllers/list_exercise_widget_tree_reconstruction_controller.dart';

class ListExerciseWidgetTreeReconstructionBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ListExerciseWidgetTreeReconstructionController());
  }
}
