import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:tok_tok/data/dio/auth_dio.dart';
import 'package:tok_tok/data/service/local/auth_hive_service.dart';
import 'package:tok_tok/utils/constants/api_keys.dart';

class TokenDioInterceptor extends Interceptor {
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    const noTokenRequiredPaths = [
      '/api/auth/login',
      '/api/auth/register',
      '/auth/register',
      '/auth/login',
      '/auth/forget_password',
      '/auth/otp_confirm',
    ];

    if (noTokenRequiredPaths.any((path) => options.path.contains(path))) {
      log("Request to ${options.path} - No token required");
      return handler.next(options);
    }
    try {
      final token = await AuthHiveService.getToken();

      if (token != null && token.isNotEmpty) {
        options.headers["Authorization"] = "Bearer $token";
      }

      final response = await AuthDio.instance.dio.post(
        ApiKeys.check,
        data: {"token": token},
      );

      if (response.statusCode == 200) {
        handler.next(options);
      } else {
        handler.reject(
          DioException(
            requestOptions: options,
            error: "Token is invalid",
            response: response,
          ),
        );
      }
    } catch (e) {
      handler.reject(
        DioException(
          requestOptions: options,
          error: e.toString(),
        ),
      );
    }
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (err.response?.statusCode == 401 || err.response?.statusCode == 403) {
      log("Unauthorized! Logging out user.");
    }

    handler.next(err);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    handler.next(response);
  }
}
