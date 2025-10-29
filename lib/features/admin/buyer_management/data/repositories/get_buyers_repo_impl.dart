import 'package:dartz/dartz.dart';
import 'package:obour/core/errors/failures.dart';
import 'package:obour/features/admin/buyer_management/data/data_sources/remote/get_buyers_remote_ds.dart';
import 'package:obour/features/admin/buyer_management/data/models/get_all_buyer_model.dart';
import 'package:obour/features/admin/buyer_management/domain/repositories/get_buyers_repo.dart';
import 'package:obour/features/auth/add_buyer/data/data_sources/remote/add_buyer_remote_ds.dart';
import 'package:obour/features/auth/add_buyer/data/models/add_buyer_model.dart';
import 'package:obour/features/auth/add_buyer/domain/repositories/add_buyer_repo.dart';

class GetBuyersRepoImpl implements GetBuyersRepo {
  GetBuyersRemoteDs remoteDs;

  GetBuyersRepoImpl(this.remoteDs);

  @override
  Future<Either<Failures, GetAllBuyerModel>> getBuyers() async {
    var res = await remoteDs.getBuyers();
    return res;
  }
}
