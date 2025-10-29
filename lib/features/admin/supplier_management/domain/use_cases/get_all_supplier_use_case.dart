import 'package:dartz/dartz.dart';
import 'package:obour/core/errors/failures.dart';
import 'package:obour/features/admin/supplier_management/domain/entities/get_all_suppliers_entity.dart';
import 'package:obour/features/admin/supplier_management/domain/repositories/get_suppliers_repo.dart';

class GetAllSuppliersUseCase {
  GetSuppliersRepo repo;

  GetAllSuppliersUseCase(this.repo);

  Future<Either<Failures,GetAllSuppliersEntity>> call() {
    return repo.getSuppliers();
  }
}
