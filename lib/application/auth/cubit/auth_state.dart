part of 'auth_cubit.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}
class AuthLogin extends AuthState {}
class AuthSuccess extends AuthState {
  final LoginResponse loginResponse;
  AuthSuccess(this.loginResponse);
}
class AuthError extends AuthState {
  final String errorMessage;
  AuthError(this.errorMessage);
}
