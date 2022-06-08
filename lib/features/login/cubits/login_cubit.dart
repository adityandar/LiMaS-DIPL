import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(const LoginState());

  final FirebaseAuth _auth = FirebaseAuth.instance;

  onEmailChanged(String? email) {
    emit(state.copyWith(email: email));
  }

  onPasswordChanged(String? password) {
    emit(state.copyWith(password: password));
  }

  login() async {
    try {
      emit(state.copyWith(status: FormzStatus.submissionInProgress));
      await _auth.signInWithEmailAndPassword(
        email: state.email,
        password: state.password,
      );

      emit(state.copyWith(status: FormzStatus.submissionSuccess));
    } on FirebaseAuthException catch (error) {
      emit(state.copyWith(
          exceptionError: error.message.toString(),
          status: FormzStatus.submissionFailure));
    } on PlatformException catch (error) {
      emit(state.copyWith(
          exceptionError: error.message.toString(),
          status: FormzStatus.submissionFailure));
    } catch (error) {
      emit(state.copyWith(
          exceptionError: "Unexpected error please try again later",
          status: FormzStatus.submissionFailure));
    }
  }
}
