part of 'forget_cubit.dart';

@immutable
sealed class ForgetState {}

final class ForgetInitial extends ForgetState {}
class ForgetPasswordInitial extends ForgetState {}

class ForgetPasswordLoading extends ForgetState {}

class ForgetPasswordSuccess extends ForgetState {}

class ForgetPasswordFailure extends ForgetState {
  final String message;
  ForgetPasswordFailure(this.message);
}
class ForgetPasswordNetworkError extends ForgetState {
  final String error;
  ForgetPasswordNetworkError(this.error);
}