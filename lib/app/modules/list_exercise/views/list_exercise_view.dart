import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:easyflutter/app/constants/dimen_constants.dart';
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
                Text(
                  "Data Latihan",
                  style: Theme.of(context)
                      .textTheme
                      .headline5
                      ?.copyWith(color: Colors.black),
                ),
              ],
            ),
            SizedBox(height: dimenSmall),
            StreamBuilder(
              stream: controller.getAllExerciseByClass(),
              builder: (_, AsyncSnapshot<QuerySnapshot> snapshots) {
                if(snapshots.hasData) {
                  if(snapshots.data!.docs.isNotEmpty) {
                    return _buildDataTableExercises(snapshots);
                  }else {
                    return Expanded(child: Center(child: Text("No Data")));
                  }
                }else {
                  return Expanded(child: Center(child: Text("No Data")));
                }
              },
            )
          ],
        ),
      ),
    );
  }

  Widget _buildDataTableExercises(AsyncSnapshot<QuerySnapshot> snapshots) {

    controller.mapExerciseFirestoreToExerciseModel(snapshots);

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
              label: Text("ID Latihan"),
              size: ColumnSize.M,
            ),
            DataColumn2(
              label: Text("Latihan"),
              size: ColumnSize.L,
            ),
            DataColumn2(
              label: Text("Aksi"),
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
                DataCell(Text(converted)),
                DataCell(Text(exerciseId!)),
                DataCell(Text(exerciseName!)),
                DataCell(
                  ElevatedButton(
                    onPressed: () {
                      controller.dashboardLecturerController.setSelectedExercise(exerciseId);
                      controller.dashboardLecturerController.setSelectedIndex(4);
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
