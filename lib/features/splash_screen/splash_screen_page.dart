import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:we_help_app/features/login/pages/login_page.dart';
import 'package:we_help_app/features/register/pages/register_page.dart';

const String splashScreenRoute = '/';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({Key? key}) : super(key: key);

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  void initState() {
    super.initState();
    _goToRegisterPage();
  }

  void _goToRegisterPage() async {
    await Future.delayed(const Duration(seconds: 3));
    Get.offNamedUntil(loginPageRoute, (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
