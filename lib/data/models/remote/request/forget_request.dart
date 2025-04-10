class ForgetRequest {
  final String email;
  

  ForgetRequest({
    required this.email,
  });

  factory ForgetRequest.fromJson(Map<String, dynamic> json) => ForgetRequest(
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
      };
}
