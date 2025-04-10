class LoginResponse {
  final Tokens token;

  LoginResponse({required this.token});

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    if (json["token"] is String) {
      return LoginResponse(token: Tokens(access: json["token"]));
    } else if (json["token"] is Map<String, dynamic>) {
      return LoginResponse(token: Tokens.fromJson(json["token"]));
    } else {
      throw Exception("Token formatı düzgün deyil");
    }
  }

  Map<String, dynamic> toJson() => {
        "token": token.toJson(),
      };
}

class Tokens {
  final String access;

  Tokens({required this.access});

  factory Tokens.fromJson(Map<String, dynamic> json) {
    return Tokens(
      access: json["access"] ?? "", 
    );
  }

  Map<String, dynamic> toJson() => {
        "access": access,
      };
}
