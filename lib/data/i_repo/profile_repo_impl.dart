import 'package:tok_tok/data/models/remote/response/profile_response.dart';
import 'package:tok_tok/data/repo/profile_repo.dart';
import 'package:tok_tok/data/service/remote/profile_service.dart';

class ProfileRepoImpl extends ProfileRepo {
ProfileRepoImpl(this._profileService);
final ProfileService _profileService;


  @override
  Future<UserProfileResponse> getUser() {
  return _profileService.getUser();

  
  }
}