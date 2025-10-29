import 'package:dartz/dartz.dart';
import 'package:obour/core/errors/failures.dart';
import 'package:obour/features/admin/supplier_management/domain/entities/get_all_suppliers_entity.dart';



abstract class GetSuppliersRepo {

  Future<Either<Failures, GetAllSuppliersEntity>> getSuppliers();
}
