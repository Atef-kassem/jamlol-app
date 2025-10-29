import 'package:dartz/dartz.dart';
import 'package:obour/core/errors/failures.dart';
import 'package:obour/features/admin/carrier_management/data/models/get_all_carriers_model.dart';
import 'package:obour/features/admin/carrier_management/data/remote/get_carriers_remote_ds.dart';
import 'package:obour/features/admin/carrier_management/domain/repositories/get_carriers_repo.dart';

class GetCarriersRepoImpl implements GetCarriersRepo {
  GetCarriersRemoteDs remoteDs;

  GetCarriersRepoImpl(this.remoteDs);

  @override
  Future<Either<Failures, GetAllCarriersModel>> getCarriers() async {
    var res = await remoteDs.getCarriers();
    return res;
  }
}
