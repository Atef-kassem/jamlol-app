import 'package:equatable/equatable.dart';

class LoginEntity extends Equatable {
   const LoginEntity({this.status, this.token});

  final String? status;
  final String? token;

  @override
  List<Object?> get props {
    return [status, token];
  }
}
