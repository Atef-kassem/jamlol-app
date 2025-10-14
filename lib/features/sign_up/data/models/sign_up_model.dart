import 'package:obour/features/sign_up/domain/entities/sign_up_entity.dart';
class SignUpModel extends SignUpEntity {
  const SignUpModel({super.status, super.data});

  factory SignUpModel.fromJson(Map<String, dynamic> json) {
    return SignUpModel(
      status: json['status'],
      data: json['data'] != null
          ? SignUpDataModel.fromJson(json['data'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      if (data != null) 'data': (data as SignUpDataModel).toJson(),
    };
  }
}

class SignUpDataModel extends SignUpEntityData {
  const SignUpDataModel({super.user});

  factory SignUpDataModel.fromJson(Map<String, dynamic> json) {
    return SignUpDataModel(
      user: json['user'] != null ? SignUpUserModel.fromJson(json['user']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      if (user != null) 'user': (user as SignUpUserModel).toJson(),
    };
  }
}

class SignUpUserModel extends SignUpUserEntity {
  const SignUpUserModel({
    super.id,
    super.roleId,
    super.name,
    super.username,
    super.phone,
    super.email,
    super.address,
    super.password,
    super.personType,
    super.status,
    super.updatedAt,
    super.createdAt,
  });

  factory SignUpUserModel.fromJson(Map<String, dynamic> json) {
    return SignUpUserModel(
      id: json['id'],
      roleId: json['role_id'],
      name: json['name'],
      username: json['username'],
      phone: json['phone'],
      email: json['email'],
      address: json['address'],
      password: json['password'],
      personType: json['person_type'],
      status: json['status'],
      updatedAt: json['updatedAt'],
      createdAt: json['createdAt'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'role_id': roleId,
      'name': name,
      'username': username,
      'phone': phone,
      'email': email,
      'address': address,
      'person_type': personType,
      'status': status,
      'updatedAt': updatedAt,
      'createdAt': createdAt,
    };
  }
}
