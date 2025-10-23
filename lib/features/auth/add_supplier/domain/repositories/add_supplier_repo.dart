import 'package:dartz/dartz.dart';
import 'package:obour/core/errors/failures.dart';
import 'package:obour/features/auth/add_supplier/domain/entities/add_supplier_entity.dart';
import 'package:obour/features/auth/add_supplier/domain/entities/get_regions_entity.dart';

abstract class AddSupplierRepo {
  Future<Either<Failures, GetRegionsEntity>> getRegions();

  Future<Either<Failures, AddSupplierEntity>> addSupplier({
    required String name,
    required String phone,
    required String idNum,
    required String idType,
    required String address,
    required String supplierType,
    required String status,
    required int regionId,
  });
}
