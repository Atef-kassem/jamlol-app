import 'package:dartz/dartz.dart';
import 'package:obour/core/errors/failures.dart';
import 'package:obour/features/auth/add_buyer/data/models/add_buyer_model.dart';

abstract class AddBuyerRemoteDs{
  Future<Either<Failures,AddBuyerModel>> addBuyer({
    required String name,
    required String phone,
    required String address,
    required String status,
    required int regionId,
  });
}