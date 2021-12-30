import 'package:data_table_2/data_table_2.dart';
import 'package:easyflutter/app/constants/dimen_constants.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/data_student_controller.dart';

class DataStudentView extends StatelessWidget {

  final controller = Get.put(DataStudentController());

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
              style: Theme
                  .of(context)
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
        _buildDataTableStudent(),
        ],
      ),
    ),);
  }

  Widget _buildDataTableStudent() {
    return Expanded(
      child: Card(
        elevation: dimenSmall,
        child: DataTable2(
          columns: [
            DataColumn2(
              label: Text("No"),
            ),
            DataColumn2(
              label: Text("NIM"),
            ),
            DataColumn2(
              label: Text("Nama"),
            ),
            DataColumn2(
              label: Text("Kelas"),
            ),
            DataColumn2(
              label: Text("Status"),
            ),
            DataColumn2(
              label: Text("Aksi"),
            ),
          ],
          rows: controller.dummyRow.map((e) {
            var index = controller.dummyRow.indexOf(e) + 1;
            var converted = index.toString();

            var nim = e["nim"].toString();
            var nama = e["nama"].toString();
            var kelas = e["kelas"].toString();
            var status = e["status"] as bool;

            return DataRow2(
              cells: [
                DataCell(Text(converted)),
                DataCell(Text(nim)),
                DataCell(Text(nama)),
                DataCell(Text(kelas)),
                DataCell(
                    (status)
                        ? Text("Valid")
                        : Text("Belum valid")
                ),
                DataCell(
                  ElevatedButton(
                    onPressed: (status)
                        ? null
                        : () {},
                    child: Text("Detail"),
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
