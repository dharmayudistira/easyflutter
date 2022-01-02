import 'package:data_table_2/data_table_2.dart';
import 'package:easyflutter/app/constants/dimen_constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';

import '../controllers/list_log_student_controller.dart';

class ListLogStudentView extends StatelessWidget {
  final controller = Get.put(ListLogStudentController());

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
                    controller.dashboardLecturerController.setSelectedIndex(3);
                  },
                  icon: FaIcon(FontAwesomeIcons.angleLeft),
                ),
                SizedBox(width: dimenSmall),
                Text(
                  "Data Log Mahasiswa",
                  style: Theme.of(context)
                      .textTheme
                      .headline5
                      ?.copyWith(color: Colors.black),
                ),
              ],
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
              label: Text("ID Log"),
            ),
            DataColumn2(
              label: Text("Nama Mahasiswa"),
            ),
            DataColumn2(
              label: Text("Langkah ke-"),
            ),
            DataColumn2(
              label: Text("Waktu"),
            ),
            DataColumn2(
              label: Text("Jawaban"),
            ),
          ],
          rows: controller.dummyRow.map((e) {
            var index = controller.dummyRow.indexOf(e) + 1;
            var converted = index.toString();

            var logId = e["id_log"].toString();
            var studentName = e["nama_mahasiswa"].toString();
            var steps = e["langkah"].toString();
            var time = e["waktu"].toString();
            var studentAnswer = e["jawaban"].toString();

            return DataRow2(
              cells: [
                DataCell(Text(converted)),
                DataCell(Text(logId)),
                DataCell(Text(
                  studentName,
                  maxLines: 2,
                  style: TextStyle(overflow: TextOverflow.ellipsis),
                )),
                DataCell(Text(steps)),
                DataCell(Text(time)),
                DataCell(Text(studentAnswer)),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
