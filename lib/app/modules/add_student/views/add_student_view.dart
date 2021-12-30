import 'package:easyflutter/app/constants/dimen_constants.dart';
import 'package:flutter/material.dart';

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
            Text(
              "Tambah Mahasiswa",
              style: Theme.of(context)
                  .textTheme
                  .headline5
                  ?.copyWith(color: Colors.black),
            ),
            SizedBox(height: dimenSmall),
            Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "1941720000",
                    label: Text("Masukkan NIM"),
                  ),
                ),
                SizedBox(height: dimenSmall),
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text("Masukkan Nama Mahasiswa"),
                  ),
                ),
                SizedBox(height: dimenSmall),
                TextFormField(
                  enabled: false,
                  initialValue: "Putra Prima Arhandi, ST., M.Kom",
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text("Nama Dosen"),
                  ),
                ),
              ],
            ),
            SizedBox(height: dimenSmall),
            Obx(() {
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
                  child: DropdownButton<String>(
                    isExpanded: true,
                    value: controller.selectedClass.value,
                    items: controller.listClass
                        .map((itemClass) => DropdownMenuItem<String>(
                      value: itemClass,
                      child: Text(itemClass),
                    ))
                        .toList(),
                    onChanged: (selected) {
                      controller.selectedClass.value = selected!;
                    },
                  ),
                ),
              );
            }),
            SizedBox(height: dimenMedium),
            ElevatedButton(onPressed: (){}, child: Text("Simpan")),
          ],
        ),
      ),
    );
  }
}
