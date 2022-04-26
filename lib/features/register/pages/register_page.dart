import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';
import 'package:we_help_app/features/login/pages/login_page.dart';
import 'package:we_help_app/shared/shared.dart';
import 'package:we_help_app/widgets/widgets.dart';

const String registerPageRoute = '/register';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
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
                  "Join us to save the\nworld! 👋🏻",
                  style: textHeading1(
                    color: primaryColor,
                  ),
                ),
                SizedBox(height: 56.w),
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
                  text: "Create your account",
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
                      "I already have an account",
                      style: textButtonNormal(color: primaryColor),
                    ),
                    onPressed: () {
                      Get.offAndToNamed(loginPageRoute);
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
