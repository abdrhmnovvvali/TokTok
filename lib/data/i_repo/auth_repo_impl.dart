import 'package:tok_tok/data/models/remote/request/forget_request.dart';
import 'package:tok_tok/data/models/remote/request/verify_request.dart';
import 'package:tok_tok/data/models/remote/response/forget_response.dart';
import 'package:tok_tok/data/models/remote/response/user_profile.dart';
import 'package:tok_tok/data/models/remote/response/verify_response.dart';
import 'package:tok_tok/data/service/remote/auth_service.dart';

import '../models/remote/request/login_request.dart';
import '../models/remote/request/signup_request.dart';
import '../models/remote/response/login_response.dart';
import '../repo/auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
    AuthRepoImpl(this._authService, this._signUpService, this._forgetService, this._verifyService);
final AuthService _signUpService;
  final AuthService _authService;
  final AuthService _forgetService;
    final AuthService _verifyService;


  @override
  Future<LoginResponse?> login({
    required LoginRequest request,
  }) =>
      _authService.login(request: request);

      

  @override
  Future<UserProfile> signUp({required SignUpRequest request}) {
    return _signUpService.signUp(request);
  }

  @override
  Future<ForgetResponse> forgetPassword({required ForgetRequest request}) {
  return _forgetService.forgetPassword(request);
  }

  @override
  Future<VerifyResponse> verify({required VerifyRequest request}) {
    return _verifyService.verify(request);
  }
}
