import 'package:dartz/dartz.dart';
import 'package:obour/core/errors/failures.dart';
import 'package:obour/features/admin/carrier_management/domain/entities/get_all_carriers_entity.dart';

abstract class GetCarriersRepo {
  Future<Either<Failures, GetAllCarriersEntity>> getCarriers();
}
