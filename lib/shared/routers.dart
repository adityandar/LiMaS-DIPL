// ignore_for_file: prefer_const_constructors

import 'package:get/route_manager.dart';
import 'package:we_help_app/features/class_create/pages/class_create_page.dart';
import 'package:we_help_app/features/detail_class/pages/detail_class_page.dart';
import 'package:we_help_app/features/home/pages/teacher_home_page.dart';
import 'package:we_help_app/features/login/pages/login_page.dart';
import 'package:we_help_app/features/material_create/pages/material_create_page.dart';
import 'package:we_help_app/features/material_detail/pages/material_detail_page.dart';
import 'package:we_help_app/features/register/pages/register_page.dart';
import 'package:we_help_app/features/role_check/pages/role_check_page.dart';
import 'package:we_help_app/features/splash_screen/splash_screen_page.dart';

class Routers {
  Routers._();

  static final List<GetPage> getPages = [
    GetPage(name: splashScreenRoute, page: () => SplashScreenPage()),
    GetPage(name: registerPageRoute, page: () => RegisterPage()),
    GetPage(name: loginPageRoute, page: () => LoginPage()),
    GetPage(name: teacherHomePageRoute, page: () => TeacherHomePage()),
    GetPage(name: studentHomePageRoute, page: () => TeacherHomePage.student()),
    GetPage(name: rolePageRoute, page: () => RoleCheckPage()),
    GetPage(name: classCreatePageRoute, page: () => ClassCreatePage()),
    GetPage(
      name: detailStudentClassPageRoute,
      page: () => DetailClassPage.student(),
    ),
    GetPage(
      name: detailTeacherClassPageRoute,
      page: () => DetailClassPage.teacher(),
    ),
    GetPage(name: materialCreatePageRoute, page: () => MaterialCreatePage()),
    GetPage(
      name: materialDetailStudentPageRoute,
      page: () => MaterialDetailPage.student(),
    ),
    GetPage(
      name: materialDetailTeacherPageRoute,
      page: () => MaterialDetailPage.teacher(),
    ),
  ];
}
