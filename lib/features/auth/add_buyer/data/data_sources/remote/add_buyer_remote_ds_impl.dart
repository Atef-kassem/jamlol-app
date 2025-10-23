import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:obour/core/api/api-manager.dart';
import 'package:obour/core/api/end_points.dart';
import 'package:obour/core/api/status_code_handler.dart';
import 'package:obour/core/errors/error_handler.dart';
import 'package:obour/core/errors/failures.dart';
import 'package:obour/features/auth/add_buyer/data/data_sources/remote/add_buyer_remote_ds.dart';
import 'package:obour/features/auth/add_buyer/data/models/add_buyer_model.dart';


class AddBuyerRemoteDsImpl implements AddBuyerRemoteDs {
  final ApiManager apiManager;

  AddBuyerRemoteDsImpl(this.apiManager);


  @override
  Future<Either<Failures, AddBuyerModel>> addBuyer({required String name, required String phone,
    required String address,
    required String status, required int regionId}) async{
    try {
      final Map<String, dynamic> body = {
        "name": name,
        "jwal": phone,
        "address": address,
        "region_id": regionId,
        "active": status
      };
      final response = await apiManager.postData(EndPoints.addClient, body: body);

      debugPrint(
        '[Add Buyer RemoteDs] status=${response.statusCode} data=${response.data}',
      );

      if (response.statusCode == 200||response.statusCode == 201) {
        AddBuyerModel model = AddBuyerModel.fromJson(response.data);
        if (model.status == "success") {
          return Right(model);
        } else {
          final errorMessage = response.data['message'] ?? "Add Buyer failed.";
          return Left(ServerFailure(errorMessage));
        }
      }
      debugPrint(
        '[Add Buyer RemoteDs failure] status=${response.statusCode} data=${response.data}',
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
