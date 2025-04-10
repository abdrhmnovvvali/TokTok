
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tok_tok/data/models/remote/request/forget_request.dart';
import 'package:tok_tok/data/models/remote/request/signup_request.dart';
import 'package:tok_tok/data/repo/auth_repo.dart';
import 'package:tok_tok/utils/manager/internet_checker_manager.dart';

part 'forget_state.dart';

class ForgetCubit extends Cubit<ForgetState> {
  ForgetCubit(this._authRepo) : super(ForgetInitial());

  final AuthRepo _authRepo;

  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
    String? email;

 

  void handleForget() async {
    if (!formKey.currentState!.validate()) return;
    await _forgetPassword();
  }


Future<void> _forgetPassword() async {
  try {
    final hasInternet = await InternetCheckerManager.hasInternetConnection();
    if (!hasInternet) {
      emit(ForgetPasswordFailure('No Internet connection'));
      return;
    }

    emit(ForgetPasswordLoading());

    log("🟢 Giriş göndərilir: ${emailController.text} ");
      email = emailController.text;

    final data = await _authRepo.forgetPassword(
      request: ForgetRequest(email: emailController.text)
    );



    log("🟢 Giriş uğurlu oldu: $data");

    emit(ForgetPasswordSuccess());
  } on DioException catch (e) {
    log("❌ DioException: ${e.response?.data ?? e.message}");
     if (e.response?.statusCode == 429) {
      emit(ForgetPasswordFailure("Too many requests. Please try again later."));
    } 
  } catch (e, s) {
    log("❌ Bilinməyən xəta: $e\n$s");
    emit(ForgetPasswordFailure("Bilinməyən xəta: $e\n$s"));
  }
}


  @override
  Future<void> close() {
    emailController.dispose();
    return super.close();
  }
}
