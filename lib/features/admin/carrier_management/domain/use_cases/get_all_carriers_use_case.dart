import 'package:dartz/dartz.dart';
import 'package:obour/core/errors/failures.dart';
import 'package:obour/features/admin/carrier_management/domain/entities/get_all_carriers_entity.dart';
import 'package:obour/features/admin/carrier_management/domain/repositories/get_carriers_repo.dart';

class GetAllCarriersUseCase {
  GetCarriersRepo repo;

  GetAllCarriersUseCase(this.repo);

  Future<Either<Failures, GetAllCarriersEntity>> call() {
    return repo.getCarriers();
  }
}
