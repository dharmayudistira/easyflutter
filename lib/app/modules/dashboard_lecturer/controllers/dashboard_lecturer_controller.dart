import 'package:easyflutter/app/modules/data_class/views/data_class_view.dart';
import 'package:easyflutter/app/modules/data_student/views/data_student_view.dart';
import 'package:get/get.dart';

class DashboardLecturerController extends GetxController {

  // final listDashboardScreen = [
  //   DataClassView(),
  //   DataStudentView(),
  // ];

  var selectedIndexScreen = 0.obs;

  void setSelectedIndex(int selected) {
    selectedIndexScreen.value = selected;
  }

}
