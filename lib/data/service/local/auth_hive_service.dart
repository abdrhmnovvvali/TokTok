import 'package:hive_flutter/hive_flutter.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class AuthHiveService {
  Future<void> saveToken(String token) async {
    final box = await Hive.openBox('authBox');
    await box.put('accessToken', token);
  }

  Future<String?> getToken() async {
    final box = await Hive.openBox('authBox');
    return box.get('accessToken');
  }

  Future<String?> getUserIdFromToken(String token) async {
    try {
      
        Map<String, dynamic> decodedToken = JwtDecoder.decode(token);
        return decodedToken['id']; 
     
      
    } catch (e) {
      print("Error decoding token: $e");
      return null;
    }
  }

  Future<void> saveUserId(String id) async {
    final box = await Hive.openBox('authBox');
    await box.put('userId', id);
  }

  Future<String?> getUserId() async {
    final box = await Hive.openBox('authBox');
    return box.get('userId');
  }
}
