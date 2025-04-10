

import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tok_tok/data/models/remote/request/verify_request.dart';
import 'package:tok_tok/data/repo/auth_repo.dart';
import 'package:tok_tok/utils/manager/internet_checker_manager.dart';

part 'verify_state.dart';

class VerifyCubit extends Cubit<VerifyState> {
  VerifyCubit(this._authRepo) : super(VerifyInitial());
  
  final AuthRepo _authRepo;

  final formKey = GlobalKey<FormState>();

   final List<TextEditingController> verifyController =
      List.generate(4, (_) => TextEditingController());

   void handleVerify() async {
    if (!formKey.currentState!.validate()) return;
    await _verifyCode();
  }


Future<void> _verifyCode() async {
  try {
    final hasInternet = await InternetCheckerManager.hasInternetConnection();
    if (!hasInternet) {
      emit(VerifyError('No Internet connection'));
      return;
    }

    emit(VerifyLoading());
     if (verifyController.any((controller) => controller.text.isEmpty)) {
      emit(VerifyError('Please fill all the fields'));
      return;
    }

  String verificationCode = verifyController.map((controller) => controller.text).join();

    final data = await _authRepo.verify(
      request: VerifyRequest(code:verificationCode )
    );



    log("🟢 Giriş uğurlu oldu: $data");

    emit(VerifySuccess());
  } on DioException catch (e) {
    log("❌ DioException: ${e.response?.data ?? e.message}");

   
    emit(VerifyError("Server xətası: ${e.response?.data ?? e.message}"));
  } catch (e, s) {
    log("❌ Bilinməyən xəta: $e\n$s");
    emit(VerifyError("Bilinməyən xəta: $e\n$s"));
  }
}


  @override
  Future<void> close() {
    for (var controller in verifyController) {
      controller.dispose();
    }
    return super.close();
  }
}
