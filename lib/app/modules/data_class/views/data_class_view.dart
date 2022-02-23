import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:easyflutter/app/constants/dimen_constants.dart';
import 'package:easyflutter/app/utils/custom_text_helper.dart';
import 'package:easyflutter/app/utils/validation_helper.dart';
import 'package:easyflutter/app/views/empty_data_view.dart';
import 'package:easyflutter/app/views/loading_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/data_class_controller.dart';

class DataClassView extends StatelessWidget {
  final controller = Get.put(DataClassController());
  final GlobalKey<FormState> dataClassFormKey = GlobalKey();

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
                  text: "Data Kelas",
                ),
                ElevatedButton(
                  onPressed: () {
                    controller.clearForm();
                    _buildShowAddTableDialog(context);
                  },
                  child: CustomTextHelper.textBody(
                    context: context,
                    text: "Tambah",
                    customColor: Colors.white,
                  ),
                ),
              ],
            ),
            SizedBox(height: dimenSmall),
            StreamBuilder(
              stream: controller.getAllClass(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshots) {
                if (snapshots.connectionState == ConnectionState.active) {
                  if (snapshots.hasData) {
                    if (snapshots.data!.docs.isNotEmpty) {
                      return _buildDataTableClass(snapshots, context);
                    } else {
                      return EmptyDataView(label: "Data kelas");
                    }
                  } else {
                    return EmptyDataView(label: "Data kelas");
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

  Future<dynamic> _buildShowAddTableDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: CustomTextHelper.textTitleDialog(
          context: context,
          text: "Tambahkkan Kelas",
        ),
        content: Form(
          key: dataClassFormKey,
          child: TextFormField(
            controller: controller.edtControllerClassName,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Contoh : TI-3A / MI-2A",
              label: CustomTextHelper.textLabelForm(
                context: context,
                text: "Masukkan Nama Kelas",
              ),
            ),
            validator: (newValue) {
              return emptyValidationForm(newValue, "nama kelas");
            },
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Get.back();
            },
            child: CustomTextHelper.textBody(
              context: context,
              text: "Batal",
              customColor: Colors.red,
            ),
          ),
          TextButton(
            onPressed: () async {
              final isValid = dataClassFormKey.currentState?.validate();
              await controller.addClass(context, isValid ?? false);
            },
            child: CustomTextHelper.textBody(
              context: context,
              text: "Simpan",
              customColor: Colors.blue,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDataTableClass(
    AsyncSnapshot<QuerySnapshot> snapshots,
    BuildContext context,
  ) {
    controller.mapConvertClassFirestoreToClassModel(snapshots);

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
                text: "ID Kelas",
              ),
              size: ColumnSize.M,
            ),
            DataColumn2(
              label: CustomTextHelper.textTitleTable(
                context: context,
                text: "Kelas",
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
          rows: controller.rowOfClasses.map((itemClass) {
            var index = controller.rowOfClasses.indexOf(itemClass) + 1;
            var converted = index.toString();

            var classId = itemClass.classId;
            var className = itemClass.className;

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
                    text: classId!,
                  ),
                ),
                DataCell(
                  CustomTextHelper.textBodyTable(
                    context: context,
                    text: className!,
                  ),
                ),
                DataCell(
                  ElevatedButton(
                    onPressed: () {
                      controller.dashboardLecturerController
                          .setSelectedClass(classId);
                      controller.dashboardLecturerController
                          .setSelectedIndex(3);
                    },
                    child: CustomTextHelper.textBody(
                      context: context,
                      text: "Lihat Latihan Soal",
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
