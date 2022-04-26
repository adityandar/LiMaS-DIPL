import 'package:get/route_manager.dart';
import 'package:we_help_app/features/home/pages/home_page.dart';
import 'package:we_help_app/features/login/pages/login_page.dart';
import 'package:we_help_app/features/register/pages/register_page.dart';
import 'package:we_help_app/features/splash_screen/splash_screen_page.dart';

class Routers {
  Routers._();

  static final List<GetPage> getPages = [
    GetPage(name: splashScreenRoute, page: () => SplashScreenPage()),
    GetPage(name: registerPageRoute, page: () => RegisterPage()),
    GetPage(name: loginPageRoute, page: () => LoginPage()),
    GetPage(name: homePageRoute, page: () => HomePage()),
  ];
}
