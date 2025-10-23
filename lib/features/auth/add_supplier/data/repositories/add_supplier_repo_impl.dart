import 'package:dartz/dartz.dart';
import 'package:obour/core/errors/failures.dart';
import 'package:obour/features/auth/add_supplier/data/data_sources/remote/add_supplier_remote_ds.dart';
import 'package:obour/features/auth/add_supplier/data/models/add_supplier_model.dart';
import 'package:obour/features/auth/add_supplier/domain/entities/get_regions_entity.dart';
import 'package:obour/features/auth/add_supplier/domain/repositories/add_supplier_repo.dart';

class AddSupplierRepoImpl implements AddSupplierRepo {
  AddSupplierRemoteDs remoteDs;

  AddSupplierRepoImpl(this.remoteDs);

  @override
  Future<Either<Failures, GetRegionsEntity>> getRegions() async {
    var res = await remoteDs.getRegions();
    return res;
  }

  @override
  Future<Either<Failures, AddSupplierModel>> addSupplier({
    required String name,
    required String phone,
    required String idNum,
    required String idType,
    required String address,
    required String supplierType,
    required String status,
    required int regionId,
  }) async {
    var res = await remoteDs.addSupplier(
      name: name,
      phone: phone,
      idNum: idNum,
      idType: idType,
      address: address,
      supplierType: supplierType,
      status: status,
      regionId: regionId,
    );
    return res;
  }
}
