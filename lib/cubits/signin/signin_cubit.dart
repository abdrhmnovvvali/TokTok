import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tok_tok/data/service/local/auth_hive_service.dart';
import 'package:tok_tok/utils/manager/internet_checker_manager.dart';

import '../../../data/models/remote/request/login_request.dart';
import '../../../data/repo/auth_repo.dart';

part 'signin_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit(this._authRepo) : super(SignInInitial());

  final AuthRepo _authRepo;
  

  final formKey = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  void handleSignIn() async {
    if (!formKey.currentState!.validate()) return;
    await _signIn();
  }


Future<void> _signIn() async {
  try {
    final hasInternet = await InternetCheckerManager.hasInternetConnection();
    if (!hasInternet) {
      emit(SignInNetworkError('No Internet connection'));
      return;
    }

    emit(SignInLoading());

    log("🟢 Giriş göndərilir: ${usernameController.text} - ${passwordController.text}");

    final data = await _authRepo.login(
      request: LoginRequest(
        username: usernameController.text.trim(),
        password: passwordController.text.trim(),
      ),
    );

    if (data == null) {
      log("🔴 Login uğursuz oldu, serverdən boş cavab gəldi!");
      emit(SignInError("Login uğursuz oldu, məlumat tapılmadı"));
      return;
    }

    log("🟢 Giriş uğurlu oldu: $data");

    emit(SignInSuccess());
    
  } on DioException catch (e) {
    log("❌ DioException: ${e.response?.data ?? e.message}");
    emit(SignInError("Server xətası: ${e.response?.data ?? e.message}"));
  } catch (e, s) {
    log("❌ Bilinməyən xəta: $e\n$s");
    emit(SignInError("Bilinməyən xəta: $e\n$s"));
  }
}


// void handleGoogleSignIn() async {
//   try {
//     emit(SignInLoading());

//     final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
//     if (googleUser == null) {
//       emit(SignInError("Google giriş imtina edildi"));
//       return;
//     }

//     final GoogleSignInAuthentication googleAuth =
//         await googleUser.authentication;

//     final AuthCredential credential = GoogleAuthProvider.credential(
//       accessToken: googleAuth.accessToken,
//       idToken: googleAuth.idToken,
//     );

//     final UserCredential userCredential =
//         await FirebaseAuth.instance.signInWithCredential(credential);

//     log("✅ Google ilə giriş uğurlu oldu: ${userCredential.user?.displayName}");

//     emit(SignInSuccess());
//   } catch (e) {
//     log("❌ Google Sign-In error: $e");
//     emit(SignInError("Google giriş xətası: $e"));
//   }
// }



  @override
  Future<void> close() {
    usernameController.dispose();
    passwordController.dispose();
    return super.close();
  }
}
