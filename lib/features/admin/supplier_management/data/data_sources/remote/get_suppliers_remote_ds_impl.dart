import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:obour/core/api/api-manager.dart';
import 'package:obour/core/api/end_points.dart';
import 'package:obour/core/api/status_code_handler.dart';
import 'package:obour/core/errors/error_handler.dart';
import 'package:obour/core/errors/failures.dart';
import 'package:obour/features/admin/supplier_management/data/data_sources/remote/get_suppliers_remote_ds.dart';
import 'package:obour/features/admin/supplier_management/data/models/get_all_suppliers_model.dart';



class GetSuppliersRemoteDsImpl implements GetSuppliersRemoteDs{
  final ApiManager apiManager;

  GetSuppliersRemoteDsImpl(this.apiManager);


  @override
  Future<Either<Failures, GetAllSuppliersModel>> getSuppliers() async{
    try {
      final response = await apiManager.getData(EndPoints.getAllSupplier);

      debugPrint(
        '[Add Buyer RemoteDs] status=${response.statusCode} data=${response.data}',
      );

      if (response.statusCode == 200||response.statusCode == 201) {
        GetAllSuppliersModel model = GetAllSuppliersModel.fromJson(response.data);
        if (model.status == "success") {
          return Right(model);
        } else {
          final errorMessage = response.data['message'] ?? "Get All Suppliers failed.";
          return Left(ServerFailure(errorMessage));
        }
      }
      debugPrint(
        '[Get All Suppliers RemoteDs failure] status=${response.statusCode} data=${response.data}',
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
