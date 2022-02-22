import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:easyflutter/app/constants/dimen_constants.dart';
import 'package:easyflutter/app/utils/custom_text_helper.dart';
import 'package:easyflutter/app/views/empty_data_view.dart';
import 'package:easyflutter/app/views/loading_view.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    controller.dashboardLecturerController.setSelectedIndex(0);
                  },
                  icon: FaIcon(FontAwesomeIcons.angleLeft),
                ),
                SizedBox(width: dimenSmall),
                CustomTextHelper.textTitle(
                  context: context,
                  text: "Data Latihan",
                ),
              ],
            ),
            SizedBox(height: dimenSmall),
            StreamBuilder(
              stream: controller.getAllExerciseByClass(),
              builder: (_, AsyncSnapshot<QuerySnapshot> snapshots) {
                if (snapshots.connectionState == ConnectionState.active) {
                  if (snapshots.hasData) {
                    if (snapshots.data!.docs.isNotEmpty) {
                      return _buildDataTableExercises(snapshots, context);
                    } else {
                      return EmptyDataView(label: "Data latihan");
                    }
                  } else {
                    return EmptyDataView(label: "Data latihan");
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

  Widget _buildDataTableExercises(
      AsyncSnapshot<QuerySnapshot> snapshots, BuildContext context) {
    controller.mapExerciseFirestoreToExerciseModel(snapshots);

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
                text: "ID Latihan",
              ),
              size: ColumnSize.M,
            ),
            DataColumn2(
              label: CustomTextHelper.textTitleTable(
                context: context,
                text: "Latihan",
              ),
              size: ColumnSize.L,
            ),
            DataColumn2(
              label: CustomTextHelper.textTitleTable(
                context: context,
                text: "Aksi",
              ),
              size: ColumnSize.L,
            ),
          ],
          rows: controller.listOfExercise.map((exercise) {
            var index = controller.listOfExercise.indexOf(exercise) + 1;
            var converted = index.toString();

            var exerciseId = exercise.exerciseId;
            var exerciseName = exercise.exerciseName;

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
                    text: exerciseId!,
                  ),
                ),
                DataCell(
                  CustomTextHelper.textBodyTable(
                    context: context,
                    text: exerciseName!,
                  ),
                ),
                DataCell(
                  ElevatedButton(
                    onPressed: () {
                      controller.dashboardLecturerController
                          .setSelectedExercise(exerciseId);
                      controller.dashboardLecturerController
                          .setSelectedIndex(4);
                    },
                    child: CustomTextHelper.textBody(
                      context: context,
                      text: "Lihat Log Mahasiswa",
                      customColor: Colors.white,
                    ),
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
