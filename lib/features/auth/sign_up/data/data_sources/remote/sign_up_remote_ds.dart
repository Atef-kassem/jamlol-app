import 'package:dartz/dartz.dart';
import 'package:obour/core/errors/failures.dart';
import 'package:obour/features/auth/sign_up/data/models/sign_up_model.dart';


abstract class SignUpRemoteDs {
  Future<Either<Failures, SignUpModel>> signUp({
    required int roleId,
    required String name,
    required String userName,
    required String phone,
    required String email,
    required String password,
    required String address,
    required String personType,
    required String status,
  });
}
