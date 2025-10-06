class ApiKeys {
  ApiKeys._();

  static const baseUrl = 'http://192.168.0.25:3002/api';
  static const register = '$baseUrl/auth/register';
  static const login = '$baseUrl/auth/login';
  static const forget = '$baseUrl/auth/forget_password';
  static const verify = '$baseUrl/auth/otp_confirm';
  static const profile = '$baseUrl/user/{id}/profile/me';
  static const profileUpdate = '$baseUrl/user';
  static const check = '$baseUrl/auth/check';
}
