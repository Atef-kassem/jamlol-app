import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:obour/core/api/api-manager.dart';
import 'package:obour/core/api/end_points.dart';
import 'package:obour/core/api/status_code_handler.dart';
import 'package:obour/core/cache/shared_preferences.dart';
import 'package:obour/core/errors/error_handler.dart';
import 'package:obour/core/errors/failures.dart';
import 'package:obour/features/auth/sign_up/data/data_sources/remote/sign_up_remote_ds.dart';
import 'package:obour/features/auth/sign_up/data/models/sign_up_model.dart';

class SignUpRemoteDsImpl implements SignUpRemoteDs {
  final ApiManager apiManager;

  SignUpRemoteDsImpl(this.apiManager);

  @override
  Future<Either<Failures, SignUpModel>> signUp({
    required int roleId,
    required String name,
    required String userName,
    required String phone,
    required String email,
    required String password,
    required String address,
    required String personType,
    required String status,
  }) async {
    try {
      final Map<String, dynamic> body = {
        "role_id": roleId,
        "name": name,
        "username": userName,
        "phone": phone,
        "email": email,
        "password": password,
        "address": address,
        "person_type": personType,
        "status": status,
      };
      final response = await apiManager.postData(EndPoints.signUp, body: body);

      debugPrint(
        '[signUp RemoteDs] status=${response.statusCode} data=${response.data}',
      );

      if (response.statusCode == 200||response.statusCode == 201) {
        SignUpModel model = SignUpModel.fromJson(response.data);
        if (model.status == "success") {
          CacheData.saveData(data:model.data?.user, key: "SignUpUser");
          return Right(model);
        } else {
          final errorMessage = response.data['message'] ?? "sign up failed.";
          return Left(ServerFailure(errorMessage));
        }
      }
      debugPrint(
        '[signUp RemoteDs failure] status=${response.statusCode} data=${response.data}',
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
