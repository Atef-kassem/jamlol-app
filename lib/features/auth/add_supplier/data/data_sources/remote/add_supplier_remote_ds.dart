import 'package:dartz/dartz.dart';
import 'package:obour/core/errors/failures.dart';
import 'package:obour/features/auth/add_supplier/data/models/add_supplier_model.dart';
import 'package:obour/features/auth/add_supplier/data/models/get_regions_model.dart';


abstract class AddSupplierRemoteDs{
  Future<Either<Failures,GetRegionsModel>> getRegions();
  Future<Either<Failures,AddSupplierModel>> addSupplier({
    required String name,
    required String phone,
    required String idNum,
    required String  idType,
    required String address,
    required String supplierType,
    required String status,
    required int regionId,
  });
}