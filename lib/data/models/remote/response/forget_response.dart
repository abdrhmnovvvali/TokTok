class ForgetResponse {
  final String message;

  ForgetResponse({required this.message});

  factory ForgetResponse.fromJson(Map<String, dynamic> json) {
    return ForgetResponse(
      message: json["message"] ?? "Unknown response",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "message": message,
    };
  }
}
