import 'package:dartz/dartz.dart';
import 'package:obour/core/errors/failures.dart';
import 'package:obour/features/login/domain/repositories/login_repo.dart';
import '../entities/login_entity.dart';

class LoginUseCase {
  LoginRepo loginRepo;

  LoginUseCase(this.loginRepo);

  Future<Either<Failures,LoginEntity>> call({required String email,required String password}) {
    return loginRepo.login(email:email, password: password);
  }
}