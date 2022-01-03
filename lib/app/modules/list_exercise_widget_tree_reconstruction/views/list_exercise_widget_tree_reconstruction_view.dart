import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/list_exercise_widget_tree_reconstruction_controller.dart';

class ListExerciseWidgetTreeReconstructionView extends StatelessWidget {

  final controller = Get.put(ListExerciseWidgetTreeReconstructionController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Text(
          'ListExerciseWidgetTreeReconstructionView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
