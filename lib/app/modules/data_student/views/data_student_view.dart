import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:easyflutter/app/constants/dimen_constants.dart';
import 'package:easyflutter/app/utils/custom_text_helper.dart';
import 'package:easyflutter/app/views/empty_data_view.dart';
import 'package:easyflutter/app/views/loading_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/data_student_controller.dart';

class DataStudentView extends StatefulWidget {
  @override
  State<DataStudentView> createState() => _DataStudentViewState();
}

class _DataStudentViewState extends State<DataStudentView> {
  final controller = Get.put(DataStudentController());

  @override
  void initState() {
    super.initState();
    controller.selectedClass.value = "Semua";
  }

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
                CustomTextHelper.textTitle(
                  context: context,
                  text: "Data Mahasiswa",
                ),
                Row(
                  children: [
                    FutureBuilder(
                      future: controller.getClassByLecturerId(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.done &&
                            snapshot.hasData) {
                          return Obx(
                            () {
                              return DropdownButton<String>(
                                value: controller.selectedClass.value,
                                items: (snapshot.data as List<String>)
                                    .map<DropdownMenuItem<String>>(
                                      (e) => DropdownMenuItem(
                                        child: Text(
                                          e.toString(),
                                        ),
                                        value: e.toString(),
                                      ),
                                    )
                                    .toList(),
                                onChanged: (String? data) {
                                  setState(() {
                                    controller.selectedClass.value =
                                        data ?? "Semua";
                                  });
                                },
                              );
                            },
                          );
                        } else {
                          return Container();
                        }
                      },
                    ),
                    SizedBox(width: dimenSmall),
                    ElevatedButton(
                      onPressed: () {
                        controller.dashboardLecturerController
                            .setSelectedIndex(2);
                      },
                      child: CustomTextHelper.textBody(
                        context: context,
                        text: "Tambah",
                        customColor: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: dimenSmall),
            StreamBuilder(
              stream: controller.getAllStudent(),
              builder: (_, AsyncSnapshot<QuerySnapshot> snapshots) {
                if (snapshots.connectionState == ConnectionState.active) {
                  if (snapshots.hasData) {
                    if (snapshots.data!.docs.isNotEmpty) {
                      return _buildDataTableStudent(snapshots, context);
                    } else {
                      return EmptyDataView(label: "Data mahasiswa");
                    }
                  } else {
                    return EmptyDataView(label: "Data mahasiswa");
                  }
                } else {
                  return LoadingView();
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDataTableStudent(
      AsyncSnapshot<QuerySnapshot> snapshots, BuildContext context) {
    controller.mapStudentFirestoreToStudentModel(snapshots);

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
                text: "NIM",
              ),
              size: ColumnSize.L,
            ),
            DataColumn2(
              label: CustomTextHelper.textTitleTable(
                context: context,
                text: "Nama",
              ),
              size: ColumnSize.L,
            ),
            DataColumn2(
              label: CustomTextHelper.textTitleTable(
                context: context,
                text: "Kelas",
              ),
              size: ColumnSize.M,
            ),
            // DataColumn2(
            //   label: CustomTextHelper.textTitleTable(
            //     context: context,
            //     text: "Code",
            //   ),
            //   size: ColumnSize.M,
            // ),
            DataColumn2(
              label: CustomTextHelper.textTitleTable(
                context: context,
                text: "Progress",
              ),
              size: ColumnSize.M,
            ),
            DataColumn2(
              label: CustomTextHelper.textTitleTable(
                context: context,
                text: "Status",
              ),
              size: ColumnSize.M,
            ),
            DataColumn2(
              label: CustomTextHelper.textTitleTable(
                context: context,
                text: "Aksi",
              ),
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
                DataCell(
                  CustomTextHelper.textBodyTable(
                    context: context,
                    text: converted,
                  ),
                ),
                DataCell(
                  CustomTextHelper.textBodyTable(
                    context: context,
                    text: studentId!,
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
                    text: studentClass!,
                  ),
                ),
                // DataCell(
                //   CustomTextHelper.textBodyTable(
                //     context: context,
                //     text: controller.getPostTestCodeStatus(student.listExerciseId),
                //   ),
                // ),
                DataCell(
                  CustomTextHelper.textBodyTable(
                    context: context,
                    text: controller
                        .getPostTestWidgetStatus(student.listExerciseId),
                  ),
                ),
                DataCell(
                  (status!)
                      ? CustomTextHelper.textBodyTable(
                          context: context,
                          text: "Valid",
                        )
                      : CustomTextHelper.textBodyTable(
                          context: context,
                          text: "Belum Valid",
                        ),
                ),
                DataCell(
                  (status)
                      ? OutlinedButton(
                          onPressed: () {
                            controller.validateStudentStatus(studentId, false);
                          },
                          child: CustomTextHelper.textBody(
                            context: context,
                            text: "Batalkan Validasi",
                            customColor: Colors.black,
                          ),
                        )
                      : ElevatedButton(
                          onPressed: () {
                            controller.validateStudentStatus(studentId, true);
                          },
                          child: CustomTextHelper.textBody(
                            context: context,
                            text: "Validasi",
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
