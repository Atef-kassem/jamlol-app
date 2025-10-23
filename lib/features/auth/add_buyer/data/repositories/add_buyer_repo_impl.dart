import 'package:dartz/dartz.dart';
import 'package:obour/core/errors/failures.dart';
import 'package:obour/features/auth/add_buyer/data/data_sources/remote/add_buyer_remote_ds.dart';
import 'package:obour/features/auth/add_buyer/data/models/add_buyer_model.dart';
import 'package:obour/features/auth/add_buyer/domain/repositories/add_buyer_repo.dart';

class AddBuyerRepoImpl implements AddBuyerRepo {
  AddBuyerRemoteDs remoteDs;

  AddBuyerRepoImpl(this.remoteDs);

  @override
  Future<Either<Failures, AddBuyerModel>> addBuyer({
    required String name,
    required String phone,
    required String address,
    required String status,
    required int regionId,
  }) async {
    var res = await remoteDs.addBuyer(
      name: name,
      phone: phone,
      address: address,
      status: status,
      regionId: regionId,
    );
    return res;
  }
}
