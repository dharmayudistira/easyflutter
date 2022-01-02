import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/dashboard_student_controller.dart';

class DashboardStudentView extends GetView<DashboardStudentController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DashboardStudentView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'DashboardStudentView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
