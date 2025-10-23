import 'package:dartz/dartz.dart';
import 'package:obour/core/errors/failures.dart';
import 'package:obour/features/auth/add_buyer/domain/entities/add_buyer_entity.dart';


abstract class AddBuyerRepo {

  Future<Either<Failures, AddBuyerEntity>> addBuyer({
    required String name,
    required String phone,
    required String address,
    required String status,
    required int regionId,
  });
}
