import 'package:get/get.dart';

import 'package:easyflutter/app/middlewares/auth_lecturer_middleware.dart';
import 'package:easyflutter/app/middlewares/auth_student_middleware.dart';
import 'package:easyflutter/app/modules/dashboard_lecturer/bindings/dashboard_lecturer_binding.dart';
import 'package:easyflutter/app/modules/dashboard_lecturer/views/dashboard_lecturer_view.dart';
import 'package:easyflutter/app/modules/dashboard_student/bindings/dashboard_student_binding.dart';
import 'package:easyflutter/app/modules/dashboard_student/views/dashboard_student_view.dart';
import 'package:easyflutter/app/modules/data_class/bindings/data_class_binding.dart';
import 'package:easyflutter/app/modules/data_class/views/data_class_view.dart';
import 'package:easyflutter/app/modules/data_student/bindings/data_student_binding.dart';
import 'package:easyflutter/app/modules/data_student/views/data_student_view.dart';
import 'package:easyflutter/app/modules/list_exercise/bindings/list_exercise_binding.dart';
import 'package:easyflutter/app/modules/list_exercise/views/list_exercise_view.dart';
import 'package:easyflutter/app/modules/list_exercise_code_reconstruction/bindings/list_exercise_code_reconstruction_binding.dart';
import 'package:easyflutter/app/modules/list_exercise_code_reconstruction/views/list_exercise_code_reconstruction_view.dart';
import 'package:easyflutter/app/modules/list_exercise_widget_tree_reconstruction/bindings/list_exercise_widget_tree_reconstruction_binding.dart';
import 'package:easyflutter/app/modules/list_exercise_widget_tree_reconstruction/views/list_exercise_widget_tree_reconstruction_view.dart';
import 'package:easyflutter/app/modules/list_log_student/bindings/list_log_student_binding.dart';
import 'package:easyflutter/app/modules/list_log_student/views/list_log_student_view.dart';
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
      middlewares: [AuthLecturerMiddleware()],
    ),
    GetPage(
      name: _Paths.DATA_CLASS,
      page: () => DataClassView(),
      binding: DataClassBinding(),
    ),
    GetPage(
      name: _Paths.DATA_STUDENT,
      page: () => DataStudentView(),
      binding: DataStudentBinding(),
    ),
    GetPage(
      name: _Paths.LIST_EXERCISE,
      page: () => ListExerciseView(),
      binding: ListExerciseBinding(),
    ),
    GetPage(
      name: _Paths.LIST_LOG_STUDENT,
      page: () => ListLogStudentView(),
      binding: ListLogStudentBinding(),
    ),
    GetPage(
      name: _Paths.DASHBOARD_STUDENT,
      page: () => DashboardStudentView(),
      binding: DashboardStudentBinding(),
      middlewares: [AuthStudentMiddleware()],
    ),
    GetPage(
      name: _Paths.LIST_EXERCISE_CODE_RECONSTRUCTION,
      page: () => ListExerciseCodeReconstructionView(),
      binding: ListExerciseCodeReconstructionBinding(),
    ),
    GetPage(
      name: _Paths.LIST_EXERCISE_WIDGET_TREE_RECONSTRUCTION,
      page: () => ListExerciseWidgetTreeReconstructionView(),
      binding: ListExerciseWidgetTreeReconstructionBinding(),
    ),
  ];
}
