import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easyflutter/app/constants/dimen_constants.dart';
import 'package:easyflutter/app/utils/custom_text_helper.dart';
import 'package:easyflutter/app/utils/validation_helper.dart';
import 'package:easyflutter/app/views/empty_data_view.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';

import '../controllers/add_student_controller.dart';

class AddStudentView extends StatelessWidget {
  final controller = Get.put(AddStudentController());
  final GlobalKey<FormState> addStudentFormKey = GlobalKey();

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
                CustomTextHelper.textTitle(
                  context: context,
                  text: "Tambah Mahasiswa",
                ),
              ],
            ),
            SizedBox(height: dimenSmall),
            Form(
              key: addStudentFormKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: controller.edtStudentIdController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "1941720000",
                      label: CustomTextHelper.textLabelForm(
                        context: context,
                        text: "Masukkan NIM",
                      ),
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
                      label: CustomTextHelper.textLabelForm(
                        context: context,
                        text: "Masukkan Nama Mahasiswa",
                      ),
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
                      label: CustomTextHelper.textBody(
                        context: context,
                        text: "Nama Dosen",
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: dimenSmall),
            StreamBuilder(
              stream: controller.getAllClass(),
              builder: (_, AsyncSnapshot<QuerySnapshot> snapshots) {
                if (snapshots.hasData) {
                  if (snapshots.data!.docs.isNotEmpty) {
                    return _buildDropDownClass(snapshots, context);
                  } else {
                    return _buildDropDownClass(snapshots, context);
                  }
                } else {
                  return EmptyDataView(label: "Data Kelas");
                }
              },
            ),
            SizedBox(height: dimenMedium),
            ElevatedButton(
              onPressed: () {
                final isFormValid = addStudentFormKey.currentState?.validate();
                controller.addStudent(context, isFormValid ?? false);
              },
              child: CustomTextHelper.textBody(
                context: context,
                text: "Simpan",
                customColor: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDropDownClass(
      AsyncSnapshot<QuerySnapshot> snapshots, BuildContext context) {
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
                      child: CustomTextHelper.textBody(
                        context: context,
                        text: itemClass.className!,
                      ),
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
