import 'package:cloud_firestore/cloud_firestore.dart';
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
                  style: Theme.of(context)
                      .textTheme
                      .headline5
                      ?.copyWith(color: Colors.black),
                ),
                ElevatedButton(
                  onPressed: () {
                    controller.dashboardLecturerController.setSelectedIndex(2);
                  },
                  child: Text(
                    "Tambah",
                  ),
                ),
              ],
            ),
            SizedBox(height: dimenSmall),
            StreamBuilder(
              stream: controller.getAllStudent(),
              builder: (_, AsyncSnapshot<QuerySnapshot> snapshots) {
                if (snapshots.hasData) {
                  if (snapshots.data!.docs.isNotEmpty) {
                    return _buildDataTableStudent(snapshots);
                  } else {
                    return Expanded(child: Center(child: Text("No Data")));
                  }
                } else {
                  return Expanded(child: Center(child: Text("No Data")));
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDataTableStudent(AsyncSnapshot<QuerySnapshot> snapshots) {
    controller.mapStudentFirestoreToStudentModel(snapshots);

    return Expanded(
      child: Card(
        elevation: dimenSmall,
        child: DataTable2(
          columns: [
            DataColumn2(
              label: Text("No"),
              size: ColumnSize.S,
            ),
            DataColumn2(
              label: Text("NIM"),
              size: ColumnSize.M,
            ),
            DataColumn2(
              label: Text("Nama"),
              size: ColumnSize.L,
            ),
            DataColumn2(
              label: Text("Kelas"),
              size: ColumnSize.M,
            ),
            DataColumn2(
              label: Text("Status"),
              size: ColumnSize.M,
            ),
            DataColumn2(
              label: Text("Aksi"),
              size: ColumnSize.L,
            ),
          ],
          rows: controller.listStudent.map((student) {
            var index = controller.listStudent.indexOf(student) + 1;
            var converted = index.toString();

            var studentId = student.studentId;
            var studentName = student.studentName;
            var studentClass = student.className;
            var status = student.status;

            return DataRow2(
              cells: [
                DataCell(Text(converted)),
                DataCell(Text(studentId!)),
                DataCell(
                  Text(
                    studentName!,
                    maxLines: 2,
                    style: TextStyle(
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
                DataCell(Text(studentClass!)),
                DataCell((status!) ? Text("Valid") : Text("Belum valid")),
                DataCell(
                  ElevatedButton(
                    onPressed: (status)
                        ? null
                        : () {
                            controller.validateStudentStatus(studentId);
                          },
                    child: Text("Validasi"),
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
