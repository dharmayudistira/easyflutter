import 'package:get/get.dart';

import 'package:easyflutter/app/modules/dashboard_lecturer/bindings/dashboard_lecturer_binding.dart';
import 'package:easyflutter/app/modules/dashboard_lecturer/views/dashboard_lecturer_view.dart';
import 'package:easyflutter/app/modules/login/bindings/login_binding.dart';
import 'package:easyflutter/app/modules/login/views/login_view.dart';
import 'package:easyflutter/app/modules/register/bindings/register_binding.dart';
import 'package:easyflutter/app/modules/register/views/register_view.dart';

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
    GetPage(
      name: _Paths.REGISTER,
      page: () => RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.DASHBOARD_LECTURER,
      page: () => DashboardLecturerView(),
      binding: DashboardLecturerBinding(),
    ),
  ];
}
