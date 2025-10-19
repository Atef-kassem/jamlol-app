import 'package:equatable/equatable.dart';

class SignUpEntity extends Equatable {
  const SignUpEntity({this.status, this.data});

  final String? status;
  final SignUpEntityData? data;

  @override
  List<Object?> get props => [status, data];
}

class SignUpEntityData extends Equatable {
  const SignUpEntityData({this.user});

  final SignUpUserEntity? user;

  @override
  List<Object?> get props => [user];
}

class SignUpUserEntity extends Equatable {
 const SignUpUserEntity({
    this.id,
    this.roleId,
    this.name,
    this.username,
    this.phone,
    this.email,
    this.address,
    this.password,
    this.personType,
    this.status,
    this.updatedAt,
    this.createdAt,
  });

 final int? id;
 final int? roleId;
 final String? name;
 final String? username;
 final String? phone;
 final  String? email;
 final String? address;
 final  String? password;
 final String? personType;
 final  String? status;
 final String? updatedAt;
 final String? createdAt;

  @override
  List<Object?> get props => [
    id,
    roleId,
    name,
    username,
    phone,
    email,
    address,
    password,
    personType,
    status,
    updatedAt,
    createdAt,
  ];
}
