import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(const AuthState()) {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        return emit(state.copyWith(isSignedIn: false));
      } else {
        emit(state.copyWith(isSignedIn: true));
      }
    });
  }
}
