import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easyflutter/app/constants/dimen_constants.dart';
import 'package:easyflutter/app/utils/validation_helper.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';

import '../controllers/add_student_controller.dart';

class AddStudentView extends StatelessWidget {
  final controller = Get.put(AddStudentController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: dimenMedium, vertical: dimenLarge),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    controller.clearForm();
                    controller.dashboardLecturerController.setSelectedIndex(1);
                  },
                  icon: FaIcon(FontAwesomeIcons.angleLeft),
                ),
                SizedBox(width: dimenSmall),
                Text(
                  "Tambah Mahasiswa",
                  style: Theme.of(context)
                      .textTheme
                      .headline5
                      ?.copyWith(color: Colors.black),
                ),
              ],
            ),
            SizedBox(height: dimenSmall),
            Form(
              key: controller.addStudentFormKey,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    TextFormField(
                      controller: controller.edtStudentIdController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "1941720000",
                        label: Text("Masukkan NIM"),
                      ),
                      validator: (newValue) {
                        return emptyValidationForm(newValue, "NIM");
                      },
                    ),
                    SizedBox(height: dimenSmall),
                    TextFormField(
                      controller: controller.edtStudentNameController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        label: Text("Masukkan Nama Mahasiswa"),
                      ),
                      validator: (newValue) {
                        return emptyValidationForm(newValue, "nama mahasiswa");
                      },
                    ),
                    SizedBox(height: dimenSmall),
                    TextFormField(
                      enabled: false,
                      initialValue: controller.getLecturerName(),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        label: Text("Nama Dosen"),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: dimenSmall),
            StreamBuilder(
              stream: controller.getAllClass(),
              builder: (_, AsyncSnapshot<QuerySnapshot> snapshots) {
                if (snapshots.hasData) {
                  if (snapshots.data!.docs.isNotEmpty) {
                    return _buildDropDownClass(snapshots);
                  } else {
                    return _buildDropDownClass(snapshots);
                  }
                } else {
                  return Expanded(child: Center(child: Text("No Data")));
                }
              },
            ),
            SizedBox(height: dimenMedium),
            ElevatedButton(
                onPressed: () {
                  controller.addStudent();
                },
                child: Text("Simpan")),
          ],
        ),
      ),
    );
  }

  Widget _buildDropDownClass(AsyncSnapshot<QuerySnapshot> snapshots) {
    controller.mapConvertClassFirestoreToClassModel(snapshots);

    return Container(
      padding: EdgeInsets.symmetric(horizontal: dimenSmall / 2),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: DropdownButtonHideUnderline(
        child: Obx(() {
          return DropdownButton<String>(
            isExpanded: true,
            value: controller.selectedClass.value,
            items: controller.listOfClass
                .map((itemClass) => DropdownMenuItem<String>(
                      value: itemClass.className,
                      child: Text(itemClass.className!),
                    ))
                .toList(),
            onChanged: (selected) {
              controller.selectedClass.value = selected!;
            },
          );
        }),
      ),
    );
  }
}
