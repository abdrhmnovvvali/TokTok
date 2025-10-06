import 'dart:io';

import 'package:dio/dio.dart';
import 'package:tok_tok/data/models/remote/request/profile_request.dart';
import 'package:tok_tok/data/models/remote/response/profile_response.dart';

abstract class ProfileRepo {
 Future<UserProfileResponse> getUser();
 Future<UserProfileResponse> update (ProfileRequest fromdata);

}