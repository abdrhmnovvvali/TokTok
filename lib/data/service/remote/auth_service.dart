import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:tok_tok/cubits/profile/profile_cubit.dart';
import 'package:tok_tok/data/models/remote/request/forget_request.dart';
import 'package:tok_tok/data/models/remote/request/verify_request.dart';
import 'package:tok_tok/data/models/remote/response/forget_response.dart';
import 'package:tok_tok/data/models/remote/response/verify_response.dart';
import 'package:tok_tok/data/service/local/auth_hive_service.dart';
import 'package:tok_tok/locator.dart';
import 'package:tok_tok/utils/extensions/int_extensions.dart';
import '../../../utils/constants/api_keys.dart';
import '../../dio/auth_dio.dart';
import '../../models/remote/request/login_request.dart';
import '../../models/remote/request/signup_request.dart';
import '../../models/remote/response/login_response.dart';
import '../../models/remote/response/user_profile.dart';

class AuthService {
  Future<LoginResponse> login({
    required LoginRequest request,
  }) async {
    try {
      log('🚀 GÖNDƏRİLƏN DATA: ${request.toJson()}');
      log('🚀 API URL: ${ApiKeys.login}');

      final response = await AuthDio.instance.dio.post(
        ApiKeys.login,
        data: request.toJson(),
      );

      log('📥 RESPONSE STATUS: ${response.statusCode}');
      log('📥 RESPONSE DATA: ${response.data}');

      if (response.statusCode!.isSuccess) {
        final loginResponse = LoginResponse.fromJson(response.data);

        await AuthHiveService.saveToken(loginResponse.token.access);

        return loginResponse;
      }

      throw DioException(
        requestOptions: response.requestOptions,
        response: response,
        message: 'Login failed with status code: ${response.statusCode}',
      );
    } on DioException catch (e) {
      log('❌ DioException: ${e.response?.data}');
      rethrow;
    } catch (e, s) {
      log('❌ Xəta: $e');

      throw Exception('Unexpected error during login: $e');
    }
  }

  Future<UserProfile> signUp(SignUpRequest request) async {
    try {
      final response = await AuthDio.instance.dio.post(
        ApiKeys.register,
        data: request.toJson(),
      );

      log("Response Status: ${response.statusCode}");
      log("Response Data: ${response.data}");

      if (response.statusCode!.isSuccess) {
        return UserProfile.fromMap(response.data);
      } else {
        throw Exception(
            'Sign up failed with status code: ${response.statusCode}');
      }
    } on DioException catch (dioError) {
      throw Exception("DioException occurred: ${dioError.message}");
    } catch (e, s) {
      log('Unexpected error: $e');
      log('StackTrace Unexpected error: $s');
      throw Exception('Unexpected error during sign-up: $e');
    }
  }

  Future<ForgetResponse> forgetPassword(ForgetRequest request) async {
    try {
      final response = await AuthDio.instance.dio.post(
        ApiKeys.forget,
        data: request.toJson(),
      );

      log("Response Status: ${response.statusCode}");
      log("Response Data: ${response.data}");

      if (response.statusCode!.isSuccess) {
        return ForgetResponse.fromJson(response.data);
      } else {
        throw Exception(
            'Sign up failed with status code: ${response.statusCode}');
      }
    } on DioException catch (dioError) {
      throw Exception("DioException occurred: ${dioError.message}");
    } catch (e, s) {
      log('Unexpected error: $e');
      log('StackTrace Unexpected error: $s');
      throw Exception('Unexpected error during sign-up: $e');
    }
  }

  Future<VerifyResponse> verify(VerifyRequest request) async {
    try {
      final response = await AuthDio.instance.dio.post(
        ApiKeys.verify,
        data: request.toJson(),
      );

      log("Response Status: ${response.statusCode}");
      log("Response Data: ${response.data}");

      if (response.statusCode!.isSuccess) {
        return VerifyResponse.fromJson(response.data);
      } else {
        throw Exception(
            'Sign up failed with status code: ${response.statusCode}');
      }
    } on DioException catch (dioError) {
      throw Exception("DioException occurred: ${dioError.message}");
    } catch (e, s) {
      log('Unexpected error: $e');
      log('StackTrace Unexpected error: $s');
      throw Exception('Unexpected error during sign-up: $e');
    }
  }
  // final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  // final GoogleSignIn _googleSignIn = GoogleSignIn();

  // Future<UserCredential?> signInWithGoogle() async {
  //   try {
  //     final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
  //     if (googleUser == null) return null;

  //     final GoogleSignInAuthentication googleAuth =
  //         await googleUser.authentication;

  //     final AuthCredential credential = GoogleAuthProvider.credential(
  //       accessToken: googleAuth.accessToken,
  //       idToken: googleAuth.idToken,
  //     );

  //     UserCredential userCredential =
  //         await _firebaseAuth.signInWithCredential(credential);

  //     return userCredential;
  //   } catch (e) {
  //     print('❌ Google Sign-In error: $e');
  //     return null;
  //   }
  // }

  // Future<void> signOut() async {
  //   await _firebaseAuth.signOut();
  //   await _googleSignIn.signOut();
  // }

  Future<bool> checkAuthStatus() async {
    final data = await AuthHiveService.getToken();
    final response =
        await AuthDio.instance.dio.post(ApiKeys.check, data: {'token': data});
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
