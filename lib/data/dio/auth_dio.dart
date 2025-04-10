import 'dart:developer';

import 'package:awesome_dio_interceptor/awesome_dio_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../utils/constants/app_durations.dart';

class AuthDio {
  AuthDio._();

  static AuthDio? _instance;
  Dio? _dio;

  static AuthDio get instance => _instance ??= AuthDio._();

    Dio get dio {
      _dio ??= Dio(
      BaseOptions(
        sendTimeout: AppDurations.s60,
        connectTimeout: AppDurations.s60,
        receiveTimeout: AppDurations.s60,
      ),
    );

    if (kDebugMode) {
      _dio!.interceptors.add(AwesomeDioInterceptor(logger: log));
    }

    return _dio!;
  }
}
