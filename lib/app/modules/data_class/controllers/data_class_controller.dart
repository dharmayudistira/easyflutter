import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easyflutter/app/modules/dashboard_lecturer/controllers/dashboard_lecturer_controller.dart';
import 'package:easyflutter/app/utils/storage_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class DataClassController extends GetxController {

  final _storageHelper = Get.find<StorageHelper>();
  final dashboardLecturerController = Get.find<DashboardLecturerController>();
  final _firestore = FirebaseFirestore.instance;

  late TextEditingController edtControllerClassName;

  final dummyRow = [
    {
      "id_kelas" : "3A",
      "kelas" : "3A",
    },
  ];

  @override
  void onInit() {
    super.onInit();

    edtControllerClassName = TextEditingController();
  }

  @override
  void onClose() {
    edtControllerClassName.dispose();
    super.onClose();
  }

  Future<void> addClass() async {
    final className = edtControllerClassName.text;

    final classReference = await _firestore.collection("kelas").get();

    var isClassValid = true;

    classReference.docs.forEach((element) {
      if(element["nama_kelas"] == className) {
        isClassValid = false;
      }
    });

    if(isClassValid) {
      var classId = className.toLowerCase();
      var lecturerId = _storageHelper.getIdUser();
      var lecturerName = _storageHelper.getNameUser();

      await _firestore.collection("kelas").add({
        "id_kelas" : classId,
        "nama_kelas" : className,
        "id_dosen" : lecturerId,
        "nama_dosen" : lecturerName,
      }).whenComplete(() {
        Get.back();
        Get.snackbar("Berhasil", "Data kelas $className berhasil ditambahkan");
      });

    }else {
      Get.snackbar("Terjadi Kesalahan", "Data kelas $className sudah ada");
    }
  }
}
