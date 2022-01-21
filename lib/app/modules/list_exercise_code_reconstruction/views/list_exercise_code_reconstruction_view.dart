import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easyflutter/app/constants/dimen_constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';

import '../controllers/list_exercise_code_reconstruction_controller.dart';

class ListExerciseCodeReconstructionView extends StatelessWidget {
  final controller = Get.put(ListExerciseCodeReconstructionController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(dimenMedium),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: dimenSmall / 2,
                right: dimenSmall / 2,
              ),
              child: Text(
                "Daftar Latihan Soal - Widget Tree Reconstruction",
                style: Theme.of(context)
                    .textTheme
                    .headline5
                    ?.copyWith(color: Colors.black),
              ),
            ),
            SizedBox(height: dimenMedium),
            StreamBuilder(
              stream: controller.getAllExercise(),
              builder: (_, AsyncSnapshot<QuerySnapshot> snapshots) {
                if (snapshots.hasData) {
                  if (snapshots.data!.docs.isNotEmpty) {
                    return _buildListExerciseCode(snapshots);
                  } else {
                    return Expanded(child: Center(child: Text("Empty Data")));
                  }
                } else {
                  return Expanded(child: Center(child: Text("No Data")));
                }
              },
            )
          ],
        ),
      ),
    );
  }

  Widget _buildListExerciseCode(AsyncSnapshot<QuerySnapshot> snapshots) {
    controller.mapExerciseFirestoreToExerciseModel(snapshots);

    return Expanded(
      child: ListView.builder(
        itemCount: controller.listExercise.length,
        itemBuilder: (context, index) {
          final item = controller.listExercise[index];

          return Padding(
            padding: const EdgeInsets.only(
              left: dimenSmall / 2,
              top: dimenSmall / 2,
              right: dimenSmall / 2,
            ),
            child: Card(
              elevation: dimenSmall,
              child: ListTile(
                onTap: () {
                  controller.navigateTo(index, item.exerciseId!, item.exerciseName!);
                },
                title: Text(
                  item.exerciseName!,
                  style: Theme.of(context)
                      .textTheme
                      .subtitle2
                      ?.copyWith(color: Colors.black),
                ),
                subtitle: Text(
                  item.exerciseId!,
                  style: Theme.of(context)
                      .textTheme
                      .caption
                      ?.copyWith(color: Colors.black),
                ),
                trailing: FaIcon(
                  FontAwesomeIcons.angleRight,
                  color: Colors.black,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
