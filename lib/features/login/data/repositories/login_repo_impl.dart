import 'package:dartz/dartz.dart';
import 'package:obour/core/errors/failures.dart';
import 'package:obour/features/login/data/data_sources/remote/login_remote_ds.dart';
import 'package:obour/features/login/domain/entities/login_entity.dart';
import 'package:obour/features/login/domain/repositories/login_repo.dart';


class LoginRepoImpl implements LoginRepo {
  LoginRemoteDs remoteDs;

  LoginRepoImpl(this.remoteDs);

  @override
  Future<Either<Failures, LoginEntity>> login({
    required String email,
    required String password,
  }) async {
    var res = await remoteDs.login(email: email, password: password);
    return res;
  }
}
