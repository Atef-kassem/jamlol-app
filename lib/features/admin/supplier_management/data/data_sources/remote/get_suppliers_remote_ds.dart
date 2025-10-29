import 'package:dartz/dartz.dart';
import 'package:obour/core/errors/failures.dart';
import 'package:obour/features/admin/supplier_management/data/models/get_all_suppliers_model.dart';

abstract class GetSuppliersRemoteDs{
  Future<Either<Failures,GetAllSuppliersModel>> getSuppliers();
}