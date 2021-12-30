import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/add_student_controller.dart';

class AddStudentView extends GetView<AddStudentController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'AddStudentView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
