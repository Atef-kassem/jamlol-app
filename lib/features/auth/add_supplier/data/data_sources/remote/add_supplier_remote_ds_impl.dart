import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:obour/core/api/api-manager.dart';
import 'package:obour/core/api/end_points.dart';
import 'package:obour/core/api/status_code_handler.dart';
import 'package:obour/core/errors/error_handler.dart';
import 'package:obour/core/errors/failures.dart';
import 'package:obour/features/auth/add_supplier/data/data_sources/remote/add_supplier_remote_ds.dart';
import 'package:obour/features/auth/add_supplier/data/models/add_supplier_model.dart';
import 'package:obour/features/auth/add_supplier/data/models/get_regions_model.dart';


class AddSupplierRemoteDsImpl implements AddSupplierRemoteDs {
  final ApiManager apiManager;

  AddSupplierRemoteDsImpl(this.apiManager);
  
  @override
  Future<Either<Failures, GetRegionsModel>> getRegions() async{
    try {
      final response = await apiManager.getData(EndPoints.getRegions);

      debugPrint(
        '[get regions RemoteDs] status=${response.statusCode} data=${response.data}',
      );

      if (response.statusCode == 200||response.statusCode==201) {
        GetRegionsModel model = GetRegionsModel.fromJson(response.data);
        return right(model);
      }
      debugPrint(
        '[get regions RemoteDs failure] status=${response.statusCode} data=${response.data}',
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

  @override
  Future<Either<Failures, AddSupplierModel>> addSupplier({required String name, required String phone,
    required String idNum, required String idType, required String address, required String supplierType,
    required String status, required int regionId}) async{
    try {
      final Map<String, dynamic> body = {
        "name": name,
        "supplier_type": supplierType,
        "identification_number": idNum,
        "identification_type": idType,
        "jwal":phone,
        "address": address,
        "region_id": regionId,
        "active": status
      };
      final response = await apiManager.postData(EndPoints.addSupplier, body: body);

      debugPrint(
        '[AddSupplier RemoteDs] status=${response.statusCode} data=${response.data}',
      );

      if (response.statusCode == 200||response.statusCode == 201) {
        AddSupplierModel model = AddSupplierModel.fromJson(response.data);
        if (model.status == "success") {
          return Right(model);
        } else {
          final errorMessage = response.data['message'] ?? "AddSupplier failed.";
          return Left(ServerFailure(errorMessage));
        }
      }
      debugPrint(
        '[AddSupplier RemoteDs failure] status=${response.statusCode} data=${response.data}',
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
