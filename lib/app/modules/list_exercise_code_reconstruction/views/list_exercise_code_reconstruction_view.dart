import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/list_exercise_code_reconstruction_controller.dart';

class ListExerciseCodeReconstructionView extends StatelessWidget {

  final controller = Get.put(ListExerciseCodeReconstructionController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Text(
          'ListExerciseCodeReconstructionView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
