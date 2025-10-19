import 'package:obour/features/auth/login/domain/entities/login_entity.dart';

class LoginModel extends LoginEntity{
  const LoginModel({
    super.status,
    super.token,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      status: json['status'] as String?,
      token: json['token'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'token': token,
    };
  }
}