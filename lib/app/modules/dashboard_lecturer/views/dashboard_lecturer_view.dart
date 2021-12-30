import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/dashboard_lecturer_controller.dart';

class DashboardLecturerView extends GetView<DashboardLecturerController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DashboardLecturerView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'DashboardLecturerView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
