part of 'profile_cubit.dart';

@immutable
sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}

final class ProfileLoading extends ProfileState {}

final class ProfileSuccess extends ProfileState {
  final UserProfileResponse profile;
  ProfileSuccess(this.profile);
}

final class ProfileUpdated extends ProfileState {  // ✅ Yeni state
  final UserProfileResponse profile;
  ProfileUpdated(this.profile);
}

final class ProfileImagePicked extends ProfileState {
  final File image;
  ProfileImagePicked(this.image);
}

final class ProfileError extends ProfileState {
  final String message;
  ProfileError(this.message);
}