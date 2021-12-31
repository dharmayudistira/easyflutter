import 'package:data_table_2/data_table_2.dart';
import 'package:easyflutter/app/constants/dimen_constants.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/list_exercise_controller.dart';

class ListExerciseView extends StatelessWidget {

  final controller = Get.put(ListExerciseController());

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
              "Data Latihan",
              style: Theme.of(context)
                  .textTheme
                  .headline5
                  ?.copyWith(color: Colors.black),
            ),
            SizedBox(height: dimenSmall),
            _buildDataTableExercises(),
          ],
        ),
      ),
    );
  }

  Widget _buildDataTableExercises() {
    return Expanded(
      child: Card(
        elevation: dimenSmall,
        child: DataTable2(
          columns: [
            DataColumn2(
              label: Text("No"),
            ),
            DataColumn2(
              label: Text("ID Latihan"),
            ),
            DataColumn2(
              label: Text("Latihan"),
            ),
            DataColumn2(
              label: Text("Aksi"),
            ),
          ],
          rows: controller.dummyRow.map((e) {
            var index = controller.dummyRow.indexOf(e) + 1;
            var converted = index.toString();
            return DataRow2(
              cells: [
                DataCell(Text(converted)),
                DataCell(Text(e["id_latihan"]!)),
                DataCell(Text(e["latihan"]!)),
                DataCell(
                  ElevatedButton(
                    onPressed: () {
                      // controller.dashboardLecturerController.setSelectedIndex(3);
                    },
                    child: Text("Lihat Log Mahasiswa"),
                  ),
                ),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
