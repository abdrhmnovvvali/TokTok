class VerifyRequest {
  final String code;
  

  VerifyRequest({
    required this.code,
  });

  factory VerifyRequest.fromJson(Map<String, dynamic> json) => VerifyRequest(
        code: json["code"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "code": code,
      };
}
