import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:obour/core/api/api-manager.dart';
import 'package:obour/core/api/end_points.dart';
import 'package:obour/core/api/status_code_handler.dart';
import 'package:obour/core/errors/error_handler.dart';
import 'package:obour/core/errors/failures.dart';
import 'package:obour/features/auth/add_carrier/data/data_sources/remote/add_carrier_remote_ds.dart';
import 'package:obour/features/auth/add_carrier/data/models/add_carrier_model.dart';


class AddCarrierRemoteDsImpl implements AddCarrierRemoteDs {
  final ApiManager apiManager;

  AddCarrierRemoteDsImpl(this.apiManager);


  @override
  Future<Either<Failures, AddCarrierModel>> addCarrier({required String name, required String phone,
    required String idNum, required String address, required String carrierType,
    required String status, required int regionId}) async{
    try {
      final Map<String, dynamic> body = {
        "name": name,
        "naqlen_type": carrierType,
        "identification_number": idNum,
        "jwal": phone,
        "address": address,
        "regions": [regionId],
        "active": status
      };
      final response = await apiManager.postData(EndPoints.addCarrier, body: body);

      debugPrint(
        '[Add carrier RemoteDs] status=${response.statusCode} data=${response.data}',
      );

      if (response.statusCode == 200||response.statusCode == 201) {
        AddCarrierModel model = AddCarrierModel.fromJson(response.data);
        if (model.status == "success") {
          return Right(model);
        } else {
          final errorMessage = response.data['message'] ?? "Add Carrier failed.";
          return Left(ServerFailure(errorMessage));
        }
      }
      debugPrint(
        '[Add Carrier RemoteDs failure] status=${response.statusCode} data=${response.data}',
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
