import 'package:get/get.dart';

import '../controllers/list_exercise_code_reconstruction_controller.dart';

class ListExerciseCodeReconstructionBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ListExerciseCodeReconstructionController());
  }
}
