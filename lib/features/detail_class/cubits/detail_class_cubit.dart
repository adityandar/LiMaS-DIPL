import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import '../../../enums/data_status_enum.dart';
import '../../../models/class_mdl.dart';
import '../../../models/material_mdl.dart';

part 'detail_class_state.dart';

class DetailClassCubit extends Cubit<DetailClassState> {
  DetailClassCubit() : super(const DetailClassState());

  CollectionReference materialsCollection =
      FirebaseFirestore.instance.collection(
    'materials',
  );

  void onBuild(ClassMdl classInfo) {
    emit(state.copyWith(
      classInfo: classInfo,
    ));
    getAllMaterials();
  }

  Future<void> getAllMaterials() async {
    emit(state.copyWith(loadStatus: DataStatus.loading));

    try {
      final res = await materialsCollection
          .where(
            'classId',
            isEqualTo: state.classInfo?.id ?? '',
          )
          .get();
      final list = res.docs;
      final List<MaterialMdl> materials = list.map((item) {
        return MaterialMdl.fromMap(
          id: item.id,
          map: item.data() as Map<String, dynamic>,
        );
      }).toList();

      emit(state.copyWith(
        materials: materials,
        loadStatus: DataStatus.success,
      ));
    } catch (e) {
      debugPrint('$e');
    }
  }

  void deleteMaterial(String materialId) async {
    await materialsCollection.doc(materialId).delete();
    getAllMaterials();
  }
}
