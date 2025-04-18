part of 'signup_cubit.dart';

@immutable
abstract class SignUpState {}

class SignUpInitial extends SignUpState {}

class SignUpLoading extends SignUpState {}

class SignUpSuccess extends SignUpState {
    final UserProfile response;
  SignUpSuccess(this.response);
}

class SignUpError extends SignUpState {
  final String message;

  SignUpError(this.message);
}
class SignUpNetworkError extends SignUpState {
  final String message;

  SignUpNetworkError(this.message);
}