import 'package:dartz/dartz.dart';
import 'package:obour/core/errors/failures.dart';
import 'package:obour/features/auth/add_supplier/domain/entities/get_regions_entity.dart';
import 'package:obour/features/auth/add_supplier/domain/repositories/add_supplier_repo.dart';

class GetRegionsUseCase {
  AddSupplierRepo repo;

  GetRegionsUseCase(this.repo);

  Future<Either<Failures,GetRegionsEntity>> call() {
    return repo.getRegions();
  }
}