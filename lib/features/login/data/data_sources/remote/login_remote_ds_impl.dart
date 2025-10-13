import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:obour/core/api/api-manager.dart';
import 'package:obour/core/api/end_points.dart';
import 'package:obour/core/api/status_code_handler.dart';
import 'package:obour/core/errors/error_handler.dart';
import 'package:obour/core/errors/failures.dart';
import 'package:obour/features/login/data/data_sources/remote/login_remote_ds.dart';
import 'package:obour/features/login/data/models/login_model.dart';

class LoginRemoteDsImpl implements LoginRemoteDs {
  final ApiManager apiManager;

  LoginRemoteDsImpl(this.apiManager);

  @override
  Future<Either<Failures, LoginModel>> login({
    required String email,
    required String password,
  }) async {
    try {
      final Map<String, dynamic> body = {"email": email, "password": password};
      final response = await apiManager.postData(EndPoints.login, body: body);

      debugPrint(
        '[login RemoteDs] status=${response.statusCode} data=${response.data}',
      );

      if (response.statusCode == 200) {
        LoginModel model = LoginModel.fromJson(response.data);
        if (model.status == "success") {
          return Right(model);
        } else {
          final errorMessage = response.data['message'] ?? "Login failed.";
          return Left(ServerFailure(errorMessage));
        }
      }
      debugPrint(
        '[login RemoteDs failure] status=${response.statusCode} data=${response.data}',
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
