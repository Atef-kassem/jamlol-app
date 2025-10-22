import 'package:dartz/dartz.dart';
import 'package:obour/core/errors/failures.dart';
import 'package:obour/features/auth/add_supplier/data/data_sources/remote/add_supplier_remote_ds.dart';
import 'package:obour/features/auth/add_supplier/domain/entities/get_regions_entity.dart';
import 'package:obour/features/auth/add_supplier/domain/repositories/add_supplier_repo.dart';

class AddSupplierRepoImpl implements AddSupplierRepo {
  AddSupplierRemoteDs remoteDs;

  AddSupplierRepoImpl(this.remoteDs);

  @override
  Future<Either<Failures, GetRegionsEntity>> getRegions() async{
    var res = await remoteDs.getRegions();
    return res;
  }
}
