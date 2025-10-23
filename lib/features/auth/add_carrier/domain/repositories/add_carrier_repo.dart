import 'package:dartz/dartz.dart';
import 'package:obour/core/errors/failures.dart';
import 'package:obour/features/auth/add_carrier/domain/entities/add_carrier_entity.dart';

abstract class AddCarrierRepo {

  Future<Either<Failures, AddCarrierEntity>> addCarrier({
    required String name,
    required String phone,
    required String idNum,
    required String address,
    required String carrierType,
    required String status,
    required int regionId,
  });
}
