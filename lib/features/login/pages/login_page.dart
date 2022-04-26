import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';
import 'package:we_help_app/features/register/pages/register_page.dart';
import 'package:we_help_app/shared/shared.dart';
import 'package:we_help_app/widgets/widgets.dart';

const String loginPageRoute = '/login';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 81.w),
                Text(
                  "Hi, let's sign in! 👋🏻",
                  style: textHeading1(
                    color: primaryColor,
                  ),
                ),
                SizedBox(height: 86.w),
                CustomTextField(
                  hintText: "Email",
                  prefixIcon: Icons.email,
                  validator: (email) => CommonHelper.emailValidator(email),
                  onValueChanged: (String? value) {},
                ),
                SizedBox(height: 8.w),
                CustomTextField(
                  hintText: "Password",
                  prefixIcon: Icons.password_outlined,
                  isPassword: true,
                  isObscured: obscureText,
                  onToggleObscuredCallback: () {
                    setState(() {
                      obscureText = !obscureText;
                    });
                  },
                  validator: (password) => CommonHelper.passwordValidator(
                    password,
                  ),
                  onValueChanged: (String? value) {},
                ),
                SizedBox(height: 112.w),
                FullWidthCustomButton(
                  text: "Sign in",
                  onTap: () {
                    _formKey.currentState?.validate();
                  },
                ),
                SizedBox(height: 14.w),
                Center(
                  child: Text(
                    "or",
                    style: normalText(),
                  ),
                ),
                Center(
                  child: TextButton(
                    child: Text(
                      "Create your account",
                      style: textButtonNormal(color: primaryColor),
                    ),
                    onPressed: () {
                      Get.offNamedUntil(registerPageRoute, (route) => false);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
