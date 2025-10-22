import 'package:dartz/dartz.dart';
import 'package:obour/core/errors/failures.dart';
import 'package:obour/features/auth/add_supplier/data/models/get_regions_model.dart';


abstract class AddSupplierRemoteDs{
  Future<Either<Failures,GetRegionsModel>> getRegions();
}