import 'package:dartz/dartz.dart';
import 'package:obour/core/errors/failures.dart';
import 'package:obour/features/auth/add_supplier/domain/entities/add_supplier_entity.dart';
import 'package:obour/features/auth/add_supplier/domain/repositories/add_supplier_repo.dart';

class AddSupplierUseCase {
  AddSupplierRepo repo;

  AddSupplierUseCase(this.repo);

  Future<Either<Failures, AddSupplierEntity>> call({
    required String name,
    required String phone,
    required String idNum,
    required String idType,
    required String address,
    required String supplierType,
    required String status,
    required int regionId,
  }) {
    return repo.addSupplier(
      name: name,
      phone: phone,
      idNum: idNum,
      idType: idType,
      address: address,
      supplierType: supplierType,
      status: status,
      regionId: regionId,
    );
  }
}
