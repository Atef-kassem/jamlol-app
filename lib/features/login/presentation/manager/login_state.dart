part of 'login_cubit.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState{
  LoginEntity data;
  LoginSuccess(this.data);
}

class LoginFailure extends LoginState{
  Failures failures;
  LoginFailure(this.failures);
}
