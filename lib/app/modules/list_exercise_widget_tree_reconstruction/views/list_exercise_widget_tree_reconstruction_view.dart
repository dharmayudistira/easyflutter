import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easyflutter/app/constants/dimen_constants.dart';
import 'package:easyflutter/app/routes/app_pages.dart';
import 'package:easyflutter/app/utils/custom_text_helper.dart';
import 'package:easyflutter/app/views/empty_data_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/list_exercise_widget_tree_reconstruction_controller.dart';

class ListExerciseWidgetTreeReconstructionView extends StatelessWidget {
  final controller = Get.put(ListExerciseWidgetTreeReconstructionController());

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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomTextHelper.textTitle(
                    context: context,
                    text: "Daftar Latihan Soal - Widget Tree Reconstruction",
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Get.toNamed(
                        Routes.WIDGET_EXERCISE_EXAMPLE,
                        arguments: [
                          "ti-3a-w-0",
                          "Contoh Soal",
                        ],
                      );
                    },
                    child: CustomTextHelper.textBody(
                      context: context,
                      text: "Contoh Soal",
                      customColor: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: dimenMedium),
            StreamBuilder(
              stream: controller.getAllExercise(),
              builder: (_, AsyncSnapshot<QuerySnapshot> snapshots) {
                if (snapshots.hasData) {
                  if (snapshots.data!.docs.isNotEmpty) {
                    return _buildListExerciseWidget(snapshots);
                  } else {
                    return EmptyDataView(label: "latihan soal");
                  }
                } else {
                  return EmptyDataView(label: "latihan soal");
                }
              },
            )
          ],
        ),
      ),
    );
  }

  Widget _buildListExerciseWidget(AsyncSnapshot<QuerySnapshot> snapshots) {
    controller.mapExerciseFirestoreToExerciseModel(snapshots);

    return Expanded(
      child: ListView.builder(
        controller: ScrollController(),
        itemCount: controller.listExercise.length,
        itemBuilder: (context, index) {
          final item = controller.listExercise[index];

          int exerciseNum = int.parse(item.exerciseId!.substring(8));
          if (exerciseNum >= 1 && exerciseNum <= 10) {
            var isComplete = false;
            item.listStudentId?.forEach((element) {
              if (element == controller.storageHelper.getIdUser()) {
                isComplete = true;
                return;
              }
            });

            return Padding(
              padding: const EdgeInsets.only(
                left: dimenSmall / 2,
                top: dimenSmall / 2,
                right: dimenSmall / 2,
              ),
              child: Card(
                elevation: dimenSmall,
                child: ListTile(
                  title: CustomTextHelper.textBody(
                    context: context,
                    text: item.exerciseName!,
                    customWeight: FontWeight.bold,
                  ),
                  subtitle: CustomTextHelper.textCaption(
                    context: context,
                    text: item.exerciseId!,
                  ),
                  trailing: (isComplete)
                      ? OutlinedButton(
                          onPressed: () {
                            controller.navigateTo(
                              index + 1,
                              item.exerciseId,
                              item.exerciseName,
                            );
                          },
                          // onPressed: null,
                          child: CustomTextHelper.textBody(
                            context: context,
                            text: "Kerjakan Lagi",
                            customColor: Colors.black,
                          ),
                        )
                      : ElevatedButton(
                          onPressed: () {
                            controller.navigateTo(
                              index + 1,
                              item.exerciseId,
                              item.exerciseName,
                            );
                          },
                          // onPressed: null,
                          child: CustomTextHelper.textBody(
                            context: context,
                            text: "Kerjakan",
                            customColor: Colors.white,
                          ),
                        ),
                ),
              ),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
