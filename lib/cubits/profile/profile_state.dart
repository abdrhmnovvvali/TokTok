part of 'profile_cubit.dart';

@immutable
sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}
final class ProfileSuccess extends ProfileState {
  ProfileSuccess(this.profileRepo);
  final UserProfileResponse profileRepo;
  
}
final class ProfileLoading extends ProfileState {}
final class ProfileError extends ProfileState {
  ProfileError(this.message);
  String message;
}
final class ProfileNetworkError extends ProfileState {}