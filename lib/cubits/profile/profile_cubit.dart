import 'dart:io';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
import 'package:tok_tok/data/models/remote/request/profile_request.dart';
import 'package:tok_tok/data/models/remote/response/profile_response.dart'
    hide User;
import 'package:tok_tok/data/service/local/auth_hive_service.dart';
import 'package:tok_tok/data/service/remote/profile_service.dart';
import 'package:tok_tok/locator.dart';
import 'package:tok_tok/utils/manager/internet_checker_manager.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this._profileService) : super(ProfileInitial());

  final ProfileService _profileService;
  File? selectedImage;

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

      final profile = await _profileService.getUser();
      usernameController.text = profile.user!.username;
      firstnameController.text = profile.fullName;
      datebirthController.text = profile.birth;
      phoneController.text = profile.user!.phone;
      occoptionController.text = profile.occupation;

      emit(ProfileSuccess(profile));
    } on DioException catch (e) {
      emit(ProfileError(e.message ?? 'Not found profile info'));
    } catch (e) {
      emit(ProfileError(e.toString()));
    }
  }

  Future<void> pickImageFromGallery() async {
    try {
      final picker = ImagePicker();
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        selectedImage = File(pickedFile.path);
        emit(ProfileImagePicked(selectedImage!));
      } else {
        emit(ProfileError("No image selected"));
      }
    } catch (e, s) {
      emit(ProfileError("Şəkil seçilə bilmədi: $e"));
      log("Stack Trace: $s");
    }
  }

Future<void> updateUserProfile() async {
  try {
    log("🔥 updateUserProfile başladı");
    emit(ProfileLoading());

    final profileRequest = ProfileRequest(
        fullName: firstnameController.text,
        occupation: occoptionController.text,
        birth: datebirthController.text,
    );

    log("🔥 API çağırışı edilir...");
    final response = await _profileService.updateUser(profileRequest);
    
    log("🔥 API uğurlu, ProfileUpdated emit ediləcək");
    emit(ProfileUpdated(response)); // ProfileUpdated yaratdınmı?
    log("🔥 ProfileUpdated emit edildi");
    
  } on DioException catch (dioError) {
    log("❌ DioException: ${dioError.message}");
    emit(ProfileError("DioException: ${dioError.message}"));
  } catch (e) {
    log("❌ Error: $e");
    emit(ProfileError("Error updating profile: $e"));
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
