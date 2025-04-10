import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:tok_tok/data/dio/auth_dio.dart';
import 'package:tok_tok/data/dio/client_dio.dart';
import 'package:tok_tok/data/models/remote/response/profile_response.dart';
import 'package:tok_tok/data/service/local/auth_hive_service.dart';
import 'package:tok_tok/locator.dart';
import 'package:tok_tok/utils/constants/api_keys.dart';
import 'package:tok_tok/utils/extensions/int_extensions.dart';

class ProfileService {
  final Dio _dio = AuthDio.instance.dio;

  
Future<UserProfileResponse> getUser() async {
  try {
    final String? token = await locator<AuthHiveService>().getToken();
    if (token == null) {
      throw Exception("Token tapılmadı!");
    }

    final response = await _dio.get(
      ApiKeys.profile,
      options: Options(
        headers: {
          "Authorization": "Bearer $token", 
        },
      ),
    );

    if (response.statusCode!.isSuccess) {
      return UserProfileResponse.fromJson(response.data);
    } else {
      throw Exception(
          'Profile data fetching failed with status code: ${response.statusCode}');
    }
  } on DioException catch (dioError) {
    throw Exception("DioException occurred: ${dioError.message}");
  } catch (e, s) {
    log('Unexpected error: $e');
    log('StackTrace Unexpected error: $s');
    throw Exception('Unexpected error during profile fetching: $e');
  }
}
Future<UserProfileResponse> updateUser() async {
  try {
    final String? token = await locator<AuthHiveService>().getToken();
    if (token == null) {
      throw Exception("Token tapılmadı!");
    }

    final response = await _dio.patch(
      ApiKeys.profileUpdate,
      options: Options(
        headers: {
          "Authorization": "Bearer $token", 
        },
      ),
    );

    if (response.statusCode!.isSuccess) {
      return UserProfileResponse.fromJson(response.data);
    } else {
      throw Exception(
          'Profile data fetching failed with status code: ${response.statusCode}');
    }
  } on DioException catch (dioError) {
    throw Exception("DioException occurred: ${dioError.message}");
  } catch (e, s) {
    log('Unexpected error: $e');
    log('StackTrace Unexpected error: $s');
    throw Exception('Unexpected error during profile fetching: $e');
  }
}









}