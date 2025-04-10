import 'package:tok_tok/data/models/remote/response/profile_response.dart';

abstract class ProfileRepo {
 Future<UserProfileResponse> getUser();
}