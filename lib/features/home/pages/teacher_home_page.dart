import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:we_help_app/features/class_create/pages/class_create_page.dart';
import 'package:we_help_app/features/detail_class/pages/detail_class_page.dart';
import 'package:we_help_app/features/login/pages/login_page.dart';
import 'package:we_help_app/shared/shared.dart';

import '../cubits/class_cubit.dart';

const String teacherHomePageRoute = '/home';
const String studentHomePageRoute = '/home-student';

class TeacherHomePage extends StatefulWidget {
  const TeacherHomePage({Key? key})
      : role = 'teacher',
        super(key: key);

  const TeacherHomePage.student({Key? key})
      : role = 'student',
        super(key: key);

  final String role;

  @override
  State<TeacherHomePage> createState() => _TeacherHomePageState();
}

class _TeacherHomePageState extends State<TeacherHomePage> {
  final ClassCubit cubit = ClassCubit();

  @override
  void initState() {
    super.initState();
    cubit.getClasses();
  }

  @override
  Widget build(BuildContext context) {
    final bool isTeacher = widget.role == 'teacher';
    return BlocProvider.value(
      value: cubit,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Daftar Kelas'),
          actions: [
            IconButton(
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
                Get.offAndToNamed(loginPageRoute);
              },
              icon: const Icon(
                Icons.logout,
              ),
            ),
          ],
        ),
        body: SafeArea(
          child: Column(
            children: [
              TextFormField(
                onChanged: (value) {
                  cubit.getClassesBySearch(value);
                },
                decoration: InputDecoration(
                  hintText: 'Cari di sini...',
                ),
              ),
              Expanded(
                child: BlocBuilder<ClassCubit, ClassState>(
                  builder: (context, state) {
                    if (state.classes.isNotEmpty) {
                      final classes = state.classes;
                      return RefreshIndicator(
                        onRefresh: () async => cubit.getClasses(),
                        child: ListView.separated(
                          shrinkWrap: true,
                          itemCount: classes.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              leading: const Icon(Icons.class_),
                              title: Text(
                                classes[index].nama,
                                maxLines: 1,
                                style: textHeading1(color: blackColor),
                              ),
                              subtitle: Text(
                                classes[index].deskripsi,
                                maxLines: 2,
                                style: textButtonNormal(color: blackColor),
                              ),
                              minVerticalPadding: 10,
                              onTap: () => Get.toNamed(
                                isTeacher
                                    ? detailTeacherClassPageRoute
                                    : detailStudentClassPageRoute,
                                arguments: classes[index],
                              ),
                              trailing: isTeacher
                                  ? IconButton(
                                      icon: const Icon(
                                        Icons.close,
                                      ),
                                      onPressed: () =>
                                          cubit.deleteClass(classes[index].id),
                                    )
                                  : null,
                            );
                          },
                          separatorBuilder: (_, __) {
                            return const Divider(
                              height: 2,
                            );
                          },
                        ),
                      );
                    }
                    return const SizedBox();
                  },
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: isTeacher
            ? FloatingActionButton(
                onPressed: () async {
                  await Get.toNamed(classCreatePageRoute);
                  cubit.getClasses();
                },
                child: const Icon(Icons.add),
                backgroundColor: primaryColor,
              )
            : null,
      ),
    );
  }
}
