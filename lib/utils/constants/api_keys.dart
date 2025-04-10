class ApiKeys {
  ApiKeys._();
  
  static const baseUrl = 'https://tok-tok.onrender.com/api';
  static const register = '$baseUrl/auth/register';
  static const login = '$baseUrl/auth/login';
    static const forget = '$baseUrl/auth/forget_password';
        static const verify = '$baseUrl/auth/otp_confirm';
    static const profile = '$baseUrl/user/{id}/profile/me';     
        static const profileUpdate = '$baseUrl/user/{id}/profile';     






}

