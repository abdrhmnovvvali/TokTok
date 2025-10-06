
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tok_tok/data/service/local/auth_hive_service.dart';
import 'package:tok_tok/data/service/remote/auth_service.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashInitial());

  Future<void> checkAuthStatus() async {
    emit(SplashLoading());

    try {
      final user = await AuthHiveService.getToken();

      if (user == null) {
        emit(SplashFirstTime()); 
        return;
      }

      final isValid = await AuthService().checkAuthStatus();

      if (isValid) {
        emit(SplashAuthenticated()); 
      } else {
        await AuthHiveService.logout();
        emit(SplashUnauthenticated()); 
      }
    } catch (e) {
      emit(SplashAuthenticated());
    }
  }


}
