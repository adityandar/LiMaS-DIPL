import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:we_help_app/enums/data_status_enum.dart';
import 'package:we_help_app/features/home/pages/teacher_home_page.dart';

import '../cubits/role_check_cubit.dart';

const String rolePageRoute = '/role-check';

class RoleCheckPage extends StatelessWidget {
  const RoleCheckPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RoleCheckCubit()..getRole(),
      child: BlocConsumer<RoleCheckCubit, RoleCheckState>(
        listener: (context, state) {
          if (state.loadStatus == DataStatus.success) {
            if (state.role == 'teacher') {
              Get.offAndToNamed(teacherHomePageRoute);
            } else if (state.role == 'student') {
              Get.offAndToNamed(studentHomePageRoute);
            }
          }
        },
        builder: (context, state) {
          if (state.loadStatus == DataStatus.loading) {
            return const Scaffold(
                body: Center(
              child: CircularProgressIndicator(),
            ));
          }

          return Scaffold(
            body: SizedBox(
              width: 1.sw,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Apa role anda?',
                  ),
                  ElevatedButton(
                    onPressed: () => context.read<RoleCheckCubit>().setRole(
                          'teacher',
                        ),
                    child: const Text('Guru'),
                  ),
                  ElevatedButton(
                    onPressed: () => context.read<RoleCheckCubit>().setRole(
                          'student',
                        ),
                    child: const Text('Pelajar'),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
