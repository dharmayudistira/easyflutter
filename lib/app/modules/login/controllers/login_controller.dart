import 'package:get/get.dart';

class LoginController extends GetxController {

  final listLoginType = ["Mahasiswa", "Dosen"].obs;

  var isObscured = true.obs;
  var selectedLoginType = "Mahasiswa".obs;

  void setObscuredPassword() {
    isObscured.toggle();
  }

}
