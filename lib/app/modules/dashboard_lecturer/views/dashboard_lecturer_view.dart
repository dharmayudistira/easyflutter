import 'package:easyflutter/app/constants/color_constants.dart';
import 'package:easyflutter/app/constants/dimen_constants.dart';
import 'package:easyflutter/app/modules/add_student/views/add_student_view.dart';
import 'package:easyflutter/app/modules/data_class/views/data_class_view.dart';
import 'package:easyflutter/app/modules/data_student/views/data_student_view.dart';
import 'package:easyflutter/app/modules/list_exercise/views/list_exercise_view.dart';
import 'package:easyflutter/app/modules/list_log_student/views/list_log_student_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/dashboard_lecturer_controller.dart';

class DashboardLecturerView extends GetView<DashboardLecturerController> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          _buildSideBar(context),
          Expanded(
            flex: 5,
            child: Obx(() {
              var selected = controller.selectedIndexScreen.value;
              return IndexedStack(
                index: selected,
                children: [
                  DataClassView(),
                  DataStudentView(),
                  AddStudentView(),
                  ListExerciseView(),
                  ListLogStudentView(),
                ],
              );
            }),
          ),
        ],
      ),
    );
  }

  Widget _buildSideBar(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        color: ColorConstants.kPrimaryColor,
        child: Padding(
          padding: EdgeInsets.all(dimenSmall),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  DrawerHeader(
                    child: Text(
                      "EasyFlutter",
                      style: Theme.of(context)
                          .textTheme
                          .headline5
                          ?.copyWith(color: Colors.black),
                    ),
                  ),
                  _buildSideBarItem(
                    context,
                    "Data Kelas",
                    () {
                      controller.setSelectedIndex(0);
                    },
                  ),
                  SizedBox(height: dimenSmall),
                  _buildSideBarItem(
                    context,
                    "Data Mahasiswa",
                    () {
                      controller.setSelectedIndex(1);
                    },
                  ),
                ],
              ),
              _buildSideBarItem(
                context,
                "Logout",
                () {
                  controller.logout(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSideBarItem(
    BuildContext context,
    String title,
    Function onPressed,
  ) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(dimenSmall / 2),
      ),
      child: ListTile(
        title: Text(
          title,
          style: Theme.of(context)
              .textTheme
              .subtitle2
              ?.copyWith(color: Colors.black),
        ),
        onTap: () {
          onPressed();
        },
      ),
    );
  }
}
