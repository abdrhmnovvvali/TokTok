import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tok_tok/data/models/remote/request/signup_request.dart';
import 'package:tok_tok/data/models/remote/response/user_profile.dart';
import 'package:tok_tok/data/repo/auth_repo.dart';

part 'signup_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit(this._signUpRepo) : super(SignUpInitial());

  final AuthRepo _signUpRepo;

  final formKey = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final fullNameController = TextEditingController();

  void handleSignUp(BuildContext context) async {
    if (!formKey.currentState!.validate()) return;


    try {
      emit(SignUpLoading());

      final request = SignUpRequest(
        username: usernameController.text,
        phoneNumber: phoneController.text,
        email: emailController.text,
        password: passwordController.text,
        fullname: fullNameController.text,
      );

      final response = await _signUpRepo.signUp(request: request);

     
        emit(SignUpSuccess(response));
   
      
    } catch (e, s) {
      log("SignUp error: $e", stackTrace: s);
      emit(SignUpError("Qeydiyyat zamanı xəta baş verdi!"));
    }
  }

  @override
  Future<void> close() {
    usernameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    passwordController.dispose();
    fullNameController.dispose();
    return super.close();
  }
}
