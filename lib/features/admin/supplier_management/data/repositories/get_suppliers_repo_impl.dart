import 'package:dartz/dartz.dart';
import 'package:obour/core/errors/failures.dart';
import 'package:obour/features/admin/supplier_management/data/data_sources/remote/get_suppliers_remote_ds.dart';
import 'package:obour/features/admin/supplier_management/data/models/get_all_suppliers_model.dart';
import 'package:obour/features/admin/supplier_management/domain/repositories/get_suppliers_repo.dart';


class GetSuppliersRepoImpl implements GetSuppliersRepo {
  GetSuppliersRemoteDs remoteDs;

  GetSuppliersRepoImpl(this.remoteDs);

  @override
  Future<Either<Failures, GetAllSuppliersModel>> getSuppliers() async {
    var res = await remoteDs.getSuppliers();
    return res;
  }
}
