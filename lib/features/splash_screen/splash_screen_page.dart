import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/route_manager.dart';
import 'package:we_help_app/features/home/pages/home_page.dart';
import 'package:we_help_app/features/login/pages/login_page.dart';

import '../../cubits/auth_cubit.dart';

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
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state.isSignedIn) {
          Get.offNamedUntil(homePageRoute, (route) => false);
        } else {
          Get.offNamedUntil(loginPageRoute, (route) => false);
        }
      },
      child: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
