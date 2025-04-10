import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:tok_tok/data/models/remote/response/profile_response.dart';
import 'package:tok_tok/data/repo/profile_repo.dart';
import 'package:tok_tok/utils/manager/internet_checker_manager.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this._profileRepo) : super(ProfileInitial());
  final ProfileRepo _profileRepo;

  final usernameController = TextEditingController();
  final firstnameController = TextEditingController();
  final datebirthController = TextEditingController();
  final phoneController = TextEditingController();
  final occoptionController = TextEditingController();

  Future<void> getUser() async {
    try {
      emit(ProfileLoading());
      final hasInternet = await InternetCheckerManager.hasInternetConnection();
      if (!hasInternet) {
        emit(ProfileError('No internet connection'));
        return;
      }

      final profile = await _profileRepo.getUser();
      
      usernameController.text = profile.username ;
      firstnameController.text = profile.fullName ;
      datebirthController.text = profile.dateOfBirth ;
      phoneController.text = profile.phoneNumber ;
      occoptionController.text = profile.occupation ;
      
      emit(ProfileSuccess(profile));
    } on DioException catch (e) {
      emit(ProfileError(e.message ?? 'Not found profile info'));
    } catch (e) {
      emit(ProfileError(e.toString()));
    }
  }

  @override
  Future<void> close() {
    usernameController.dispose();
    firstnameController.dispose();
    datebirthController.dispose();
    phoneController.dispose();
    occoptionController.dispose();
    return super.close();
  }
}