import 'package:dartz/dartz.dart';
import 'package:obour/core/errors/failures.dart';
import 'package:obour/features/sign_up/domain/entities/sign_up_entity.dart';

abstract  class SignUpRepo{
  Future<Either<Failures,SignUpEntity>> signUp({required int roleId, required String name,
    required String userName, required String phone, required String email, required String password,
    required String address, required String personType, required String status});
}