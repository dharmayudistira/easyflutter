import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:easyflutter/app/constants/dimen_constants.dart';
import 'package:easyflutter/app/views/empty_data_view.dart';
import 'package:easyflutter/app/views/loading_view.dart';
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
            StreamBuilder(
              stream: controller.getLogsByExercise(),
              builder: (_, AsyncSnapshot<QuerySnapshot> snapshots) {
                if(snapshots.connectionState == ConnectionState.active) {
                  if (snapshots.hasData) {
                    if (snapshots.data!.docs.isNotEmpty) {
                      return _buildDataTableLog(snapshots);
                    } else {
                      return EmptyDataView(label: "Data log");
                    }
                  } else {
                    return EmptyDataView(label: "Data log");
                  }
                }else {
                  return LoadingView();
                }
              },
            )
          ],
        ),
      ),
    );
  }

  Widget _buildDataTableLog(AsyncSnapshot<QuerySnapshot> snapshots) {
    controller.mapLogFirestoreToLogModel(snapshots);

    return Expanded(
      child: Card(
        elevation: dimenSmall,
        child: DataTable2(
          scrollController: ScrollController(),
          columns: [
            DataColumn2(
              label: Text("No"),
              size: ColumnSize.S,
            ),
            DataColumn2(
              label: Text("ID Log"),
              size: ColumnSize.L,
            ),
            DataColumn2(
              label: Text("Nama Mahasiswa"),
              size: ColumnSize.L,
            ),
            DataColumn2(
              label: Text("Langkah ke-"),
              size: ColumnSize.M,
            ),
            DataColumn2(
              label: Text("Waktu"),
              size: ColumnSize.M,
            ),
            DataColumn2(
              label: Text("Jawaban"),
              size: ColumnSize.L,
            ),
          ],
          rows: controller.listLog.map((log) {
            var index = controller.listLog.indexOf(log) + 1;
            var converted = index.toString();

            var logId = log.logId;
            var studentName = log.studentName;
            var steps = log.step;
            var time = log.time;
            var studentAnswer = log.answer;

            return DataRow2(
              cells: [
                DataCell(Text(converted)),
                DataCell(
                  Text(
                    logId!,
                    maxLines: 2,
                    style: TextStyle(overflow: TextOverflow.ellipsis),
                  ),
                ),
                DataCell(Text(
                  studentName!,
                  maxLines: 2,
                  style: TextStyle(overflow: TextOverflow.ellipsis),
                )),
                DataCell(Text(steps!)),
                DataCell(Text(time!)),
                DataCell(Text(
                  studentAnswer!,
                  maxLines: 2,
                  style: TextStyle(overflow: TextOverflow.ellipsis),
                )),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
