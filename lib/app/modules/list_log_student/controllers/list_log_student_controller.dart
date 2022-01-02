import 'package:easyflutter/app/modules/dashboard_lecturer/controllers/dashboard_lecturer_controller.dart';
import 'package:get/get.dart';

class ListLogStudentController extends GetxController {

  final dashboardLecturerController = Get.find<DashboardLecturerController>();

  final dummyRow = [
    {
      "id_log" : "123",
      "nama_mahasiswa" : "Dharma Yudistira Eka Putra",
      "langkah" : "1",
      "waktu" : "05:30:34",
      "jawaban" : "[2,4,3]",
    },
  ];

}
