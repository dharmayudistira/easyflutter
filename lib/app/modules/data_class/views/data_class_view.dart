import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:easyflutter/app/constants/dimen_constants.dart';
import 'package:easyflutter/app/utils/validation_helper.dart';
import 'package:easyflutter/app/views/empty_data_view.dart';
import 'package:easyflutter/app/views/loading_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/data_class_controller.dart';

class DataClassView extends StatelessWidget {
  final controller = Get.put(DataClassController());

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
                  "Data Kelas",
                  style: Theme.of(context)
                      .textTheme
                      .headline5
                      ?.copyWith(color: Colors.black),
                ),
                ElevatedButton(
                  onPressed: () {
                    controller.clearForm();
                    _buildShowAddTableDialog(context);
                  },
                  child: Text(
                    "Tambah",
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
                      return _buildDataTableClass(snapshots);
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
        title: Text("Tambahkan Kelas"),
        content: Form(
          key: controller.dataClassFormKey,
          child: TextFormField(
            controller: controller.edtControllerClassName,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Contoh : TI-3A / MI-2A",
              label: Text("Masukkan Nama Kelas"),
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
            child: Text(
              "Batal",
              style: TextStyle(
                color: Colors.redAccent,
              ),
            ),
          ),
          TextButton(
            onPressed: () async {
              await controller.addClass(context);
            },
            child: Text("Simpan"),
          ),
        ],
      ),
    );
  }

  Widget _buildDataTableClass(AsyncSnapshot<QuerySnapshot> snapshots) {
    controller.mapConvertClassFirestoreToClassModel(snapshots);

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
              label: Text("ID Kelas"),
              size: ColumnSize.M,
            ),
            DataColumn2(
              label: Text("Kelas"),
              size: ColumnSize.M,
            ),
            DataColumn2(
              label: Text("Aksi"),
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
                DataCell(Text(converted)),
                DataCell(Text(classId!)),
                DataCell(Text(className!)),
                DataCell(
                  ElevatedButton(
                    onPressed: () {
                      controller.dashboardLecturerController
                          .setSelectedClass(classId);
                      controller.dashboardLecturerController
                          .setSelectedIndex(3);
                    },
                    child: Text("Lihat Latihan Soal"),
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
