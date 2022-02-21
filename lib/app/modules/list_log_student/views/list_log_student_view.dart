import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:easyflutter/app/constants/dimen_constants.dart';
import 'package:easyflutter/app/utils/custom_text_helper.dart';
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
                CustomTextHelper.textTitle(
                  context: context,
                  text: "Data Log Mahasiswa",
                ),
              ],
            ),
            SizedBox(height: dimenSmall),
            StreamBuilder(
              stream: controller.getLogsByExercise(),
              builder: (_, AsyncSnapshot<QuerySnapshot> snapshots) {
                if (snapshots.connectionState == ConnectionState.active) {
                  if (snapshots.hasData) {
                    if (snapshots.data!.docs.isNotEmpty) {
                      return _buildDataTableLog(snapshots, context);
                    } else {
                      return EmptyDataView(label: "Data log");
                    }
                  } else {
                    return EmptyDataView(label: "Data log");
                  }
                } else {
                  return LoadingView();
                }
              },
            )
          ],
        ),
      ),
    );
  }

  Widget _buildDataTableLog(
    AsyncSnapshot<QuerySnapshot> snapshots,
    BuildContext context,
  ) {
    controller.mapLogFirestoreToLogModel(snapshots);

    return Expanded(
      child: Card(
        elevation: dimenSmall,
        child: DataTable2(
          scrollController: ScrollController(),
          columns: [
            DataColumn2(
              label: CustomTextHelper.textTitleTable(
                context: context,
                text: "No",
              ),
              size: ColumnSize.S,
            ),
            DataColumn2(
              label: CustomTextHelper.textTitleTable(
                context: context,
                text: "ID Log",
              ),
              size: ColumnSize.L,
            ),
            DataColumn2(
              label: CustomTextHelper.textTitleTable(
                context: context,
                text: "Nama Mahasiswa",
              ),
              size: ColumnSize.L,
            ),
            DataColumn2(
              label: CustomTextHelper.textTitleTable(
                context: context,
                text: "Langkah ke-",
              ),
              size: ColumnSize.M,
            ),
            DataColumn2(
              label: CustomTextHelper.textTitleTable(
                context: context,
                text: "Waktu",
              ),
              size: ColumnSize.M,
            ),
            DataColumn2(
              label: CustomTextHelper.textTitleTable(
                context: context,
                text: "Jawaban",
              ),
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
                DataCell(
                  CustomTextHelper.textBodyTable(
                    context: context,
                    text: converted,
                  ),
                ),
                DataCell(
                  CustomTextHelper.textBodyTable(
                    context: context,
                    text: logId!,
                  ),
                ),
                DataCell(
                  CustomTextHelper.textBodyTable(
                    context: context,
                    text: studentName!,
                  ),
                ),
                DataCell(
                  CustomTextHelper.textBodyTable(
                    context: context,
                    text: steps!,
                  ),
                ),
                DataCell(
                  CustomTextHelper.textBodyTable(
                    context: context,
                    text: time!,
                  ),
                ),
                DataCell(
                  CustomTextHelper.textBodyTable(
                    context: context,
                    text: studentAnswer!,
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
