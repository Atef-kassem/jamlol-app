import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:obour/core/api/api-manager.dart';
import 'package:obour/core/api/end_points.dart';
import 'package:obour/core/api/status_code_handler.dart';
import 'package:obour/core/errors/error_handler.dart';
import 'package:obour/core/errors/failures.dart';
import 'package:obour/features/admin/carrier_management/data/models/get_all_carriers_model.dart';
import 'package:obour/features/admin/carrier_management/data/remote/get_carriers_remote_ds.dart';


class GetCarriersRemoteDsImpl implements GetCarriersRemoteDs{
  final ApiManager apiManager;

  GetCarriersRemoteDsImpl(this.apiManager);


  @override
  Future<Either<Failures, GetAllCarriersModel>> getCarriers() async{
    try {
      final response = await apiManager.getData(EndPoints.getAllCarrier);

      debugPrint(
        '[Get Carriers RemoteDs] status=${response.statusCode} data=${response.data}',
      );

      if (response.statusCode == 200||response.statusCode == 201) {
        GetAllCarriersModel model = GetAllCarriersModel.fromJson(response.data);
        if (model.status == "success") {
          return Right(model);
        } else {
          final errorMessage = response.data['message'] ?? "Get All Carriers failed.";
          return Left(ServerFailure(errorMessage));
        }
      }
      debugPrint(
        '[Get All Carriers RemoteDs failure] status=${response.statusCode} data=${response.data}',
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
