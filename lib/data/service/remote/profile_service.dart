import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tok_tok/data/dio/auth_dio.dart';
import 'package:tok_tok/data/dio/client_dio.dart';
import 'package:tok_tok/data/models/remote/request/profile_request.dart';
import 'package:tok_tok/data/models/remote/response/profile_response.dart';
import 'package:tok_tok/data/service/local/auth_hive_service.dart';
import 'package:tok_tok/locator.dart';
import 'package:tok_tok/utils/constants/api_keys.dart';
import 'package:tok_tok/utils/extensions/int_extensions.dart';

class ProfileService {
  final Dio _dio = AuthDio.instance.dio;

  Future<UserProfileResponse> updateUser(ProfileRequest formData,
      {File? image}) async {
    try {
      final String? token = await AuthHiveService.getToken();
      if (token == null) {
        throw Exception("Token tapılmadı!");
      }
      final userId =
          await locator<AuthHiveService>().getUserIdFromStoredToken();

      final formDataMap = {
        "fullName": formData.fullName,
        "occupation": formData.occupation,
        "birth": formData.birth,
      };

      final response = await _dio.patch(
        "${ApiKeys.profileUpdate}/$userId/profile",
        data: FormData.fromMap(formDataMap),
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
          'Profil məlumatları yenilənmədi. Status: ${response.statusCode}',
        );
      }
    } on DioException catch (dioError) {
      throw Exception("DioException: ${dioError.message}");
    } catch (e) {
      log('Error: $e');
      throw Exception('Unexpected error during profile update: $e');
    }
  }

  Future<UserProfileResponse> getUser() async {
    try {
      final String? token = await AuthHiveService.getToken();
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
}
