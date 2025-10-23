import 'package:dartz/dartz.dart';
import 'package:obour/core/errors/failures.dart';
import 'package:obour/features/auth/add_carrier/data/models/add_carrier_model.dart';


abstract class AddCarrierRemoteDs{
  Future<Either<Failures,AddCarrierModel>> addCarrier({
    required String name,
    required String phone,
    required String idNum,
    required String address,
    required String carrierType,
    required String status,
    required int regionId,
  });
}