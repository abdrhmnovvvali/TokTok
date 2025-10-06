import 'dart:developer';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:tok_tok/locator.dart';
import 'package:tok_tok/utils/helpers/go.dart';
import 'package:tok_tok/utils/helpers/pager.dart';

class AuthHiveService {
  static const _boxName = 'authBox';

  /// Private helper – box-u yalnız bir dəfə açır
  static Future<Box<String>> _getBox() async {
    if (Hive.isBoxOpen(_boxName)) {
      return Hive.box<String>(_boxName);
    } else {
      return await Hive.openBox<String>(_boxName);
    }
  }

  // 🔹 Tokeni saxla
  static Future<void> saveToken(String token) async {
    final box = await _getBox();
    await box.put('token', token);
    log("Token saved: $token");
  }

  // 🔹 Tokeni al
  static Future<String?> getToken() async {
    final box = await _getBox();
    final token = box.get('token');
    log("Token retrieved: $token");
    return token;
  }

  // 🔹 Token-dən userId çıxart
  Future<String?> getUserIdFromStoredToken() async {
    final token = await getToken();
    if (token == null) return null;

    try {
      final decoded = JwtDecoder.decode(token);
      if (decoded.containsKey('userId')) {
        return decoded['userId'].toString();
      } else if (decoded.containsKey('sub')) {
        return decoded['sub'].toString();
      }
    } catch (e) {
      log("Error decoding token: $e");
    }
    return null;
  }

  // 🔹 UserId saxla
  Future<void> saveUserId(String id) async {
    final box = await _getBox();
    await box.put('userId', id);
    log("User ID saved: $id");
  }

  // 🔹 UserId al
  Future<String?> getUserId() async {
    final box = await _getBox();
    final userId = box.get('userId');
    log("User ID retrieved: $userId");
    return userId;
  }

  // 🔹 Çıxış
  static Future<void> logout({bool redirect = true}) async {
    final box = await _getBox();
    await box.clear();

    if (redirect) {
      Go.replace(appContext, Pager.signin);
    }
  }

  // 🔹 Onboard status saxla
  static Future<void> setOnboarded(bool value) async {
    final box = await _getBox();
    await box.put('isOnboarded', value.toString());
    log("Onboard status saved: $value");
  }

  // 🔹 Onboard status al
  static Future<bool> isOnboarded() async {
    final box = await _getBox();
    final onboardedStr = box.get('isOnboarded', defaultValue: 'false');
    final onboarded = onboardedStr == 'true';
    log("Onboard status retrieved: $onboarded");
    return onboarded;
  }
}
