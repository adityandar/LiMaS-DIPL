import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:we_help_app/enums/data_status_enum.dart';

part 'role_check_state.dart';

class RoleCheckCubit extends Cubit<RoleCheckState> {
  RoleCheckCubit() : super(const RoleCheckState());
  CollectionReference rolesCollection = FirebaseFirestore.instance.collection(
    'roles_user',
  );

  Future<void> getRole() async {
    emit(state.copyWith(loadStatus: DataStatus.loading));

    User? user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      emit(state.copyWith(role: '', loadStatus: DataStatus.success));
    }
    try {
      final res = await rolesCollection.doc(user!.uid).get();
      final response = res.data() as Map<String, dynamic>?;
      final userRole = response?['roles'];

      emit(state.copyWith(
        role: userRole,
        loadStatus: DataStatus.success,
      ));
    } catch (e) {
      debugPrint('$e');
    }
  }

  void setRole(String role) {
    User? user = FirebaseAuth.instance.currentUser;
    rolesCollection.doc(user?.uid).set({'roles': role});

    emit(state.copyWith(
      role: role,
      loadStatus: DataStatus.success,
    ));
  }
}
