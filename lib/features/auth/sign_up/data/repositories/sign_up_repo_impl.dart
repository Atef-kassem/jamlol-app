import 'package:dartz/dartz.dart';
import 'package:obour/core/errors/failures.dart';
import 'package:obour/features/auth/sign_up/data/data_sources/remote/sign_up_remote_ds.dart';
import 'package:obour/features/auth/sign_up/domain/entities/sign_up_entity.dart';
import 'package:obour/features/auth/sign_up/domain/repositories/sign_up_repo.dart';

class SignUpRepoImpl implements SignUpRepo {
  SignUpRemoteDs remoteDs;

  SignUpRepoImpl(this.remoteDs);

  @override
  Future<Either<Failures, SignUpEntity>> signUp({
    required int roleId,
    required String name,
    required String userName,
    required String phone,
    required String email,
    required String password,
    required String address,
    required String personType,
    required String status,
  }) async {
    var res = await remoteDs.signUp(
      roleId: roleId,
      name: name,
      userName: userName,
      email: email,
      password: password,
      phone: phone,
      address: address,
      personType: personType,
      status: status,
    );
    return res;
  }
}
