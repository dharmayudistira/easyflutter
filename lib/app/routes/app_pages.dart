import 'package:get/get.dart';

import '../middlewares/auth_lecturer_middleware.dart';
import '../middlewares/auth_student_middleware.dart';
import '../modules/code_exercise_1/bindings/code_exercise_1_binding.dart';
import '../modules/code_exercise_1/views/code_exercise_1_view.dart';
import '../modules/dashboard_lecturer/bindings/dashboard_lecturer_binding.dart';
import '../modules/dashboard_lecturer/views/dashboard_lecturer_view.dart';
import '../modules/dashboard_student/bindings/dashboard_student_binding.dart';
import '../modules/dashboard_student/views/dashboard_student_view.dart';
import '../modules/data_class/bindings/data_class_binding.dart';
import '../modules/data_class/views/data_class_view.dart';
import '../modules/data_student/bindings/data_student_binding.dart';
import '../modules/data_student/views/data_student_view.dart';
import '../modules/list_exercise/bindings/list_exercise_binding.dart';
import '../modules/list_exercise/views/list_exercise_view.dart';
import '../modules/list_exercise_code_reconstruction/bindings/list_exercise_code_reconstruction_binding.dart';
import '../modules/list_exercise_code_reconstruction/views/list_exercise_code_reconstruction_view.dart';
import '../modules/list_exercise_widget_tree_reconstruction/bindings/list_exercise_widget_tree_reconstruction_binding.dart';
import '../modules/list_exercise_widget_tree_reconstruction/views/list_exercise_widget_tree_reconstruction_view.dart';
import '../modules/list_log_student/bindings/list_log_student_binding.dart';
import '../modules/list_log_student/views/list_log_student_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/register/bindings/register_binding.dart';
import '../modules/register/views/register_view.dart';
import '../modules/widget_exercise_1/bindings/widget_exercise_1_binding.dart';
import '../modules/widget_exercise_1/views/widget_exercise_1_view.dart';
import '../modules/widget_exercise_2/bindings/widget_exercise_2_binding.dart';
import '../modules/widget_exercise_2/views/widget_exercise_2_view.dart';
import '../modules/widget_exercise_3/bindings/widget_exercise_3_binding.dart';
import '../modules/widget_exercise_3/views/widget_exercise_3_view.dart';
import '../modules/widget_exercise_4/bindings/widget_exercise_4_binding.dart';
import '../modules/widget_exercise_4/views/widget_exercise_4_view.dart';
import '../modules/widget_exercise_5/bindings/widget_exercise_5_binding.dart';
import '../modules/widget_exercise_5/views/widget_exercise_5_view.dart';
import '../modules/widget_exercise_6/bindings/widget_exercise_6_binding.dart';
import '../modules/widget_exercise_6/views/widget_exercise_6_view.dart';
import '../modules/widget_exercise_7/bindings/widget_exercise_7_binding.dart';
import '../modules/widget_exercise_7/views/widget_exercise_7_view.dart';
import '../modules/widget_exercise_example/bindings/widget_exercise_example_binding.dart';
import '../modules/widget_exercise_example/views/widget_exercise_example_view.dart';

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
    GetPage(
      name: _Paths.CODE_EXERCISE_1,
      page: () => CodeExercise1View(),
      binding: CodeExercise1Binding(),
      middlewares: [AuthStudentMiddleware()],
    ),
    GetPage(
      name: _Paths.WIDGET_EXERCISE_1,
      page: () => WidgetExercise1View(),
      binding: WidgetExercise1Binding(),
    ),
    GetPage(
      name: _Paths.WIDGET_EXERCISE_EXAMPLE,
      page: () => WidgetExerciseExampleView(),
      binding: WidgetExerciseExampleBinding(),
    ),
    GetPage(
      name: _Paths.WIDGET_EXERCISE_2,
      page: () => WidgetExercise2View(),
      binding: WidgetExercise2Binding(),
    ),
    GetPage(
      name: _Paths.WIDGET_EXERCISE_3,
      page: () => WidgetExercise3View(),
      binding: WidgetExercise3Binding(),
    ),
    GetPage(
      name: _Paths.WIDGET_EXERCISE_4,
      page: () => WidgetExercise4View(),
      binding: WidgetExercise4Binding(),
    ),
    GetPage(
      name: _Paths.WIDGET_EXERCISE_5,
      page: () => WidgetExercise5View(),
      binding: WidgetExercise5Binding(),
    ),
    GetPage(
      name: _Paths.WIDGET_EXERCISE_6,
      page: () => WidgetExercise6View(),
      binding: WidgetExercise6Binding(),
    ),
    GetPage(
      name: _Paths.WIDGET_EXERCISE_7,
      page: () => WidgetExercise7View(),
      binding: WidgetExercise7Binding(),
    ),
  ];
}
