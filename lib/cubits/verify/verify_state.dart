part of 'verify_cubit.dart';

@immutable
sealed class VerifyState {}

final class VerifyInitial extends VerifyState {}
class VerifyLoading extends VerifyState{}
class VerifySuccess extends VerifyState{}
class VerifyError extends VerifyState{
  VerifyError(this.error);
  String error;

}
class VerifyNetworkError extends VerifyState{
  VerifyNetworkError(this.error);
  String error;
}