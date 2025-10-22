import 'package:dartz/dartz.dart';
import 'package:obour/core/errors/failures.dart';
import 'package:obour/features/auth/add_supplier/domain/entities/get_regions_entity.dart';


abstract  class AddSupplierRepo{
  Future<Either<Failures,GetRegionsEntity>> getRegions();
}