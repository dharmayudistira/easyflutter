import 'package:data_table_2/data_table_2.dart';
import 'package:easyflutter/app/constants/dimen_constants.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/data_class_controller.dart';

class DataClassView extends StatelessWidget {
  final controller = Get.put(DataClassController());

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
                  "Data Kelas",
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
              child: Card(
                elevation: dimenSmall,
                child: DataTable2(
                  columns: [
                    DataColumn2(
                      label: Text("No"),
                    ),
                    DataColumn2(
                      label: Text("ID Kelas"),
                    ),
                    DataColumn2(
                      label: Text("Kelas"),
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
                        DataCell(Text(e["id_kelas"]!)),
                        DataCell(Text(e["kelas"]!)),
                        DataCell(
                          ElevatedButton(
                            onPressed: () {},
                            child: Text("Detail"),
                          ),
                        ),
                      ],
                    );
                  }).toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
