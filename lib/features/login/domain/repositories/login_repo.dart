import 'package:dartz/dartz.dart';
import 'package:obour/core/errors/failures.dart';
import 'package:obour/features/login/domain/entities/login_entity.dart';


abstract  class LoginRepo{
  Future<Either<Failures,LoginEntity>> login({required String email,required String password});
}