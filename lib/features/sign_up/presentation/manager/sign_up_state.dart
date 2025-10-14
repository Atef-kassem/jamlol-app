part of 'sign_up_cubit.dart';

@immutable
sealed class SignUpState {}

final class SignUpInitial extends SignUpState {}
class SignUpLoading extends SignUpState {}

class SignUpSuccess extends SignUpState{
  SignUpEntity data;
  SignUpSuccess(this.data);
}

class SignUpFailure extends SignUpState{
  Failures failures;
  SignUpFailure(this.failures);
}
