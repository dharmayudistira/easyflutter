import 'package:get/get.dart';

class RegisterController extends GetxController {

  final listLecturer = ["Putra Prima Arhandi, ST., M.Kom", "Imam Fahrur Rozi, ST., MT"].obs;
  final listClass = ["TI-3A", "TI-3B", "TI-3C", "TI-3D"].obs;

  var isObscured = true.obs;
  var selectedLecturer = "Putra Prima Arhandi, ST., M.Kom".obs;
  var selectedClass = "TI-3A".obs;

  void setObscuredPassword() {
    isObscured.toggle();
  }

}
