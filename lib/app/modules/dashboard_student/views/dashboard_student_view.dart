import 'package:easyflutter/app/constants/dimen_constants.dart';
import 'package:easyflutter/app/modules/list_exercise_code_reconstruction/views/list_exercise_code_reconstruction_view.dart';
import 'package:easyflutter/app/modules/list_exercise_widget_tree_reconstruction/views/list_exercise_widget_tree_reconstruction_view.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';

import '../controllers/dashboard_student_controller.dart';

class DashboardStudentView extends GetView<DashboardStudentController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: _buildAppBar(),
        body: Obx(() {
          final selectedIndex = controller.selectedIndex.value;
          return IndexedStack(
            index: selectedIndex,
            children: [
              _buildDashboardContent(),
              ListExerciseCodeReconstructionView(),
              ListExerciseWidgetTreeReconstructionView(),
            ],
          );
        }));
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton(
            child: Text(
              "EasyFlutter",
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            onPressed: () {
              controller.setSelectedIndex(0);
            },
          ),
          Row(
            children: [
              TextButton(
                child: Text(
                  "Code Reconstruction",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                onPressed: () {
                  controller.setSelectedIndex(1);
                },
              ),
              SizedBox(width: dimenMedium),
              TextButton(
                child: Text(
                  "Widget Tree Reconstruction",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                onPressed: () {
                  controller.setSelectedIndex(2);
                },
              ),
              SizedBox(width: dimenMedium),
              IconButton(
                onPressed: () {},
                icon: FaIcon(
                  FontAwesomeIcons.angleDown,
                  color: Colors.black,
                ),
              ),
            ],
          )
        ],
      ),
      backgroundColor: Colors.white,
      elevation: 0,
    );
  }

  Widget _buildDashboardContent() {
    return SingleChildScrollView(
      child: Column(
        children: [],
      ),
    );
  }
}
