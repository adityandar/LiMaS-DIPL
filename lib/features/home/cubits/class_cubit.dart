import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:we_help_app/enums/data_status_enum.dart';

import '../../../models/class_mdl.dart';

part 'class_state.dart';

class ClassCubit extends Cubit<ClassState> {
  ClassCubit() : super(const ClassState());

  CollectionReference classesCollection = FirebaseFirestore.instance.collection(
    'classes',
  );

  Future<void> getClasses() async {
    emit(state.copyWith(loadStatus: DataStatus.loading));

    try {
      final res = await classesCollection.get();
      final list = res.docs;
      final List<ClassMdl> classes = list.map((item) {
        return ClassMdl.fromMap(
          id: item.id,
          map: item.data() as Map<String, dynamic>,
        );
      }).toList();

      emit(state.copyWith(
        classes: classes,
        loadStatus: DataStatus.success,
      ));
    } catch (e) {
      debugPrint('$e');
    }
  }

  Future<void> getClassesBySearch(String? value) async {
    if (value == null || value.isEmpty) {
      getClasses();
    }
    emit(state.copyWith(loadStatus: DataStatus.loading));

    try {
      final res = await classesCollection.where('nama', isEqualTo: value).get();
      final list = res.docs;
      final List<ClassMdl> classes = list.map((item) {
        return ClassMdl.fromMap(
          id: item.id,
          map: item.data() as Map<String, dynamic>,
        );
      }).toList();

      emit(state.copyWith(
        classes: classes,
        loadStatus: DataStatus.success,
      ));
    } catch (e) {
      debugPrint('$e');
    }
  }

  void deleteClass(String classId) async {
    await classesCollection.doc(classId).delete();
    getClasses();
  }
}
