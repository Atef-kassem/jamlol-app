import 'package:dartz/dartz.dart';
import 'package:obour/core/errors/failures.dart';
import 'package:obour/features/admin/buyer_management/domain/entities/get_all_buyers_entity.dart';
import 'package:obour/features/admin/buyer_management/domain/repositories/get_buyers_repo.dart';
import 'package:obour/features/auth/add_buyer/domain/entities/add_buyer_entity.dart';
import 'package:obour/features/auth/add_buyer/domain/repositories/add_buyer_repo.dart';

class GetAllBuyersUseCase {
  GetBuyersRepo repo;

  GetAllBuyersUseCase(this.repo);

  Future<Either<Failures,GetAllBuyersEntity>> call() {
    return repo.getBuyers();
  }
}
