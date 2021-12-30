import 'package:easyflutter/app/constants/dimen_constants.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/data_student_controller.dart';

class DataStudentView extends GetView<DataStudentController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: dimenMedium, vertical: dimenLarge),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Data Mahasiswa",
                  style: Theme.of(context)
                      .textTheme
                      .headline5
                      ?.copyWith(color: Colors.black),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    "Tambah",
                  ),
                ),
              ],
            ),
            SizedBox(height: dimenSmall),
            Expanded(
              child: Container(
                color: Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
