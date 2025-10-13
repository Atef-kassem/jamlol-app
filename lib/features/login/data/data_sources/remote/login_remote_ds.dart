import 'package:dartz/dartz.dart';
import 'package:obour/core/errors/failures.dart';
import 'package:obour/features/login/data/models/login_model.dart';

abstract class LoginRemoteDs{
  Future<Either<Failures,LoginModel>> login({required String email,required String password});
}