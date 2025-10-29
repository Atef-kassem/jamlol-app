import 'package:dartz/dartz.dart';
import 'package:obour/core/errors/failures.dart';
import 'package:obour/features/admin/carrier_management/data/models/get_all_carriers_model.dart';

abstract class GetCarriersRemoteDs {
  Future<Either<Failures, GetAllCarriersModel>> getCarriers();
}
