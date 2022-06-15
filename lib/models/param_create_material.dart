import 'package:we_help_app/models/material_mdl.dart';

class ParamCreateMaterial {
  final String classId;
  final MaterialMdl? materialMdl;

  const ParamCreateMaterial({required this.classId, this.materialMdl});
}
