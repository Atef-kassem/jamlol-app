import 'package:dio/dio.dart';
import 'package:obour/core/cache/shared_preferences.dart';
import 'package:obour/core/utils/constants.dart';

class ApiManager {
  final Dio dio;

  ApiManager({Dio? dioInstance}) : dio = dioInstance ?? Dio() {
    dio.options.headers = {"Accept": "*/*", "Content-Type": "application/json"};
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final String? token =CacheData.getData(key: "token");
          if (token != null && token.isNotEmpty) {
            options.headers["Authorization"] = "Bearer $token";
          }
          return handler.next(options);
        },
      ),
    );
  }

  Options _options({Map<String, dynamic>? extraHeaders}) {
    return Options(
      headers: {
        "Accept": "*/*",
        "Content-Type": "application/json",
        ...?extraHeaders,
      },
    );
  }

  Future<Response> getData(
    String endPoint, {
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      return await dio.get(
        Constants.baseUrl + endPoint,
        queryParameters: queryParameters,
        options: _options(),
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> postData(
    String endPoint, {
    Map<String, dynamic>? body,
    Map<String, dynamic>? extraHeaders,
  }) async {
    try {
      return await dio.post(
        Constants.baseUrl + endPoint,
        data: body,
        options: _options(extraHeaders: extraHeaders),
      );
    } catch (e) {
      rethrow;
    }
  }
}
