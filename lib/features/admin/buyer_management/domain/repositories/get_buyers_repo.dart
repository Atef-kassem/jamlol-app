import 'package:dartz/dartz.dart';
import 'package:obour/core/errors/failures.dart';
import 'package:obour/features/admin/buyer_management/domain/entities/get_all_buyers_entity.dart';
import 'package:obour/features/auth/add_buyer/domain/entities/add_buyer_entity.dart';


abstract class GetBuyersRepo {

  Future<Either<Failures, GetAllBuyersEntity>> getBuyers();
}
