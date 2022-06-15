import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:we_help_app/features/class_create/pages/class_create_page.dart';
import 'package:we_help_app/features/detail_class/cubits/detail_class_cubit.dart';
import 'package:we_help_app/features/material_create/pages/material_create_page.dart';
import 'package:we_help_app/features/material_detail/pages/material_detail_page.dart';
import 'package:we_help_app/models/param_create_material.dart';

import '../../../models/class_mdl.dart';
import '../../../shared/shared.dart';

const String detailStudentClassPageRoute = '/detail-class-student';
const String detailTeacherClassPageRoute = '/detail-class-teacher';

class DetailClassPage extends StatefulWidget {
  const DetailClassPage.teacher({Key? key})
      : role = 'teacher',
        super(key: key);
  const DetailClassPage.student({Key? key})
      : role = 'student',
        super(key: key);

  final String role;

  @override
  State<DetailClassPage> createState() => _DetailClassPageState();
}

class _DetailClassPageState extends State<DetailClassPage> {
  final args = Get.arguments as ClassMdl;
  final DetailClassCubit cubit = DetailClassCubit();

  @override
  void initState() {
    super.initState();
    cubit.onBuild(args);
  }

  @override
  Widget build(BuildContext context) {
    final bool isTeacher = widget.role == 'teacher';
    return BlocProvider.value(
      value: cubit,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            args.nama,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          actions: [
            if (isTeacher) ...[
              IconButton(
                onPressed: () => Get.toNamed(
                  classCreatePageRoute,
                  arguments: args,
                ),
                icon: const Icon(
                  Icons.edit_note_rounded,
                ),
              ),
            ],
          ],
        ),
        body: SafeArea(
          child: BlocBuilder<DetailClassCubit, DetailClassState>(
            builder: (context, state) {
              if (state.materials.isNotEmpty) {
                final materials = state.materials;
                return RefreshIndicator(
                  onRefresh: () async => cubit.getAllMaterials(),
                  child: ListView.separated(
                    itemCount: materials.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: Icon(
                          (materials[index].isTask)
                              ? Icons.task
                              : Icons.article,
                        ),
                        title: Text(
                          materials[index].nama,
                          maxLines: 1,
                          style: textHeading1(color: blackColor),
                        ),
                        subtitle: Text(
                          materials[index].deskripsi,
                          maxLines: 2,
                          style: textButtonNormal(color: blackColor),
                        ),
                        minVerticalPadding: 10,
                        onTap: () async {
                          await Get.toNamed(
                            (isTeacher)
                                ? materialDetailTeacherPageRoute
                                : materialDetailStudentPageRoute,
                            arguments: materials[index],
                          );
                          cubit.getAllMaterials();
                        },
                        trailing: (isTeacher)
                            ? IconButton(
                                icon: const Icon(
                                  Icons.close,
                                ),
                                onPressed: () => cubit.deleteMaterial(
                                  materials[index].id,
                                ),
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
        floatingActionButton: (isTeacher)
            ? FloatingActionButton(
                onPressed: () async {
                  await Get.toNamed(
                    materialCreatePageRoute,
                    arguments: ParamCreateMaterial(
                      classId: args.id,
                    ),
                  );
                  cubit.getAllMaterials();
                },
                child: const Icon(Icons.add),
                backgroundColor: primaryColor,
              )
            : null,
      ),
    );
  }
}
