import 'package:tok_tok/data/models/remote/request/forget_request.dart';
import 'package:tok_tok/data/models/remote/request/verify_request.dart';
import 'package:tok_tok/data/models/remote/response/forget_response.dart';
import 'package:tok_tok/data/models/remote/response/verify_response.dart';
import 'package:tok_tok/ui/pages/forget/forget_password.dart';

import '../models/remote/request/login_request.dart';
import '../models/remote/request/signup_request.dart';
import '../models/remote/response/login_response.dart';
import '../models/remote/response/user_profile.dart';

abstract class AuthRepo {
  Future<LoginResponse?> login({
    required LoginRequest request,
  });
   Future<UserProfile> signUp({
  required SignUpRequest request,
  });
    Future<ForgetResponse> forgetPassword({
  required ForgetRequest request,
  });
     Future<VerifyResponse> verify({
  required VerifyRequest request,
  });
}
