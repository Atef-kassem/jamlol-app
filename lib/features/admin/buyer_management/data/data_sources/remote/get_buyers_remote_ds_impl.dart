import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:obour/core/api/api-manager.dart';
import 'package:obour/core/api/end_points.dart';
import 'package:obour/core/api/status_code_handler.dart';
import 'package:obour/core/errors/error_handler.dart';
import 'package:obour/core/errors/failures.dart';
import 'package:obour/features/admin/buyer_management/data/data_sources/remote/get_buyers_remote_ds.dart';
import 'package:obour/features/admin/buyer_management/data/models/get_all_buyer_model.dart';



class GetBuyersRemoteDsImpl implements GetBuyersRemoteDs{
  final ApiManager apiManager;

  GetBuyersRemoteDsImpl(this.apiManager);


  @override
  Future<Either<Failures, GetAllBuyerModel>> getBuyers() async{
    try {
      final response = await apiManager.getData(EndPoints.getAllClients);

      debugPrint(
        '[Add Buyer RemoteDs] status=${response.statusCode} data=${response.data}',
      );

      if (response.statusCode == 200||response.statusCode == 201) {
        GetAllBuyerModel model = GetAllBuyerModel.fromJson(response.data);
        if (model.status == "success") {
          return Right(model);
        } else {
          final errorMessage = response.data['message'] ?? "Get All Buyer failed.";
          return Left(ServerFailure(errorMessage));
        }
      }
      debugPrint(
        '[Get All Buyer RemoteDs failure] status=${response.statusCode} data=${response.data}',
      );
      return Left(
        StatusCodeHandler.handleStatusCode(
          response.statusCode,
          response.data["message"],
        ),
      );
    } catch (e, stackTrace) {
      return Left(ErrorHandler.handleException(e, stackTrace));
    }
  }
}
