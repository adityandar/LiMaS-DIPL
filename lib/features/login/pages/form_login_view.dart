import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:formz/formz.dart';
import 'package:get/get.dart';

import '../../../shared/shared.dart';
import '../../../widgets/widgets.dart';
import '../../home/pages/home_page.dart';
import '../../register/pages/register_page.dart';
import '../cubits/login_cubit.dart';

class FormLoginView extends StatefulWidget {
  const FormLoginView({Key? key}) : super(key: key);

  @override
  State<FormLoginView> createState() => _FormLoginViewState();
}

class _FormLoginViewState extends State<FormLoginView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state.status.isSubmissionFailure) {
          Get.snackbar('Error', state.exceptionError);
        }
        if (state.status.isSubmissionSuccess) {
          Get.offAllNamed(homePageRoute);
        }
      },
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
              onValueChanged: (String? value) {
                context.read<LoginCubit>().onEmailChanged(value);
              },
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
              onValueChanged: (String? value) {
                context.read<LoginCubit>().onPasswordChanged(value);
              },
            ),
            SizedBox(height: 112.w),
            FullWidthCustomButton(
              text: "Sign in",
              onTap: () {
                if (_formKey.currentState?.validate() ?? false) {
                  context.read<LoginCubit>().login();
                }
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
    );
  }
}
