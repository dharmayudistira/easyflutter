import 'package:get/get.dart';

import 'package:easyflutter/app/modules/login/bindings/login_binding.dart';
import 'package:easyflutter/app/modules/login/views/login_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.LOGIN;

  static final routes = [
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
  ];
}
