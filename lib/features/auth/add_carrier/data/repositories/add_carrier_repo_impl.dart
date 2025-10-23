import 'package:dartz/dartz.dart';
import 'package:obour/core/errors/failures.dart';
import 'package:obour/features/auth/add_carrier/data/data_sources/remote/add_carrier_remote_ds.dart';
import 'package:obour/features/auth/add_carrier/data/models/add_carrier_model.dart';
import 'package:obour/features/auth/add_carrier/domain/repositories/add_carrier_repo.dart';

class AddCarrierRepoImpl implements AddCarrierRepo {
  AddCarrierRemoteDs remoteDs;

  AddCarrierRepoImpl(this.remoteDs);

  @override
  Future<Either<Failures, AddCarrierModel>> addCarrier({
    required String name,
    required String phone,
    required String idNum,
    required String address,
    required String carrierType,
    required String status,
    required int regionId,
  }) async {
    var res = await remoteDs.addCarrier(
      name: name,
      phone: phone,
      idNum: idNum,
      address: address,
      carrierType: carrierType,
      status: status,
      regionId: regionId,
    );
    return res;
  }
}
