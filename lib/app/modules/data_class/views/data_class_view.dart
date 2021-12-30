import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/data_class_controller.dart';

class DataClassView extends GetView<DataClassController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'DataClassView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
