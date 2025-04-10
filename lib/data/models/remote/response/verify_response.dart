class VerifyResponse {
  final String message;

  VerifyResponse({required this.message});

  factory VerifyResponse.fromJson(Map<String, dynamic> json) {
    return VerifyResponse(
      message: json["message"] ?? "Unknown response",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "message": message,
    };
  }
}
