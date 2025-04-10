class SignUpRequest {
  final String username;
  final String phoneNumber;
  final String email;
  final String password;
  final String fullname;

  SignUpRequest({
    required this.username,
    required this.phoneNumber,
    required this.email,
    required this.password,
    required this.fullname,
  });

  factory SignUpRequest.fromJson(Map<String, dynamic> json) => SignUpRequest(
        username: json["username"] ?? "",  
        phoneNumber: json["phone"] ?? "", 
        email: json["email"] ?? "",
        password: json["password"] ?? "",
        fullname: json["fullName"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "username": username,
        "phone": phoneNumber,
        "email": email,
        "password": password,
        "fullName": fullname,
      };
}
