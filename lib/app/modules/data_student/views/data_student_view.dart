import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/data_student_controller.dart';

class DataStudentView extends GetView<DataStudentController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'DataStudentView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
