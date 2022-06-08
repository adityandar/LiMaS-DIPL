part of 'auth_cubit.dart';

class AuthState extends Equatable {
  const AuthState({this.isSignedIn = false});

  final bool isSignedIn;

  AuthState copyWith({bool? isSignedIn}) {
    return AuthState(isSignedIn: isSignedIn ?? this.isSignedIn);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [isSignedIn];
}
