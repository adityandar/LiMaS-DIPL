import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:formz/formz.dart';
import 'package:get/get.dart';
import 'package:we_help_app/features/register/cubits/register_cubit.dart';

import '../../../shared/shared.dart';
import '../../../widgets/widgets.dart';
import '../../home/pages/home_page.dart';
import '../../login/pages/login_page.dart';

class FormRegisterView extends StatefulWidget {
  const FormRegisterView({Key? key}) : super(key: key);

  @override
  State<FormRegisterView> createState() => _FormRegisterViewState();
}

class _FormRegisterViewState extends State<FormRegisterView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<RegisterCubit>();
    return BlocListener<RegisterCubit, RegisterState>(
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
              onValueChanged: (String? value) {
                cubit.onEmailChanged(value);
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
                cubit.onPasswordChanged(value);
              },
            ),
            SizedBox(height: 112.w),
            FullWidthCustomButton(
              text: "Create your account",
              onTap: () {
                if (_formKey.currentState?.validate() ?? false) {
                  cubit.register();
                }
                ;
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
    );
  }
}
