import 'package:dartz/dartz.dart';
import 'package:obour/core/errors/failures.dart';
import 'package:obour/features/admin/buyer_management/data/models/get_all_buyer_model.dart';

abstract class GetBuyersRemoteDs{
  Future<Either<Failures,GetAllBuyerModel>> getBuyers();
}