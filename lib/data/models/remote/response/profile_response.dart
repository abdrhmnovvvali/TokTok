class UserProfileResponse {
  final String fullName;
  final String username;
  final String dateOfBirth;
  final String phoneNumber;
  final String occupation;
  final String image;

  UserProfileResponse({
    required this.image,
    required this.fullName,
    required this.username,
    required this.dateOfBirth,
    required this.phoneNumber,
    required this.occupation,
  });

  factory UserProfileResponse.fromJson(Map<String, dynamic> json) {
    final user = json['user'] ?? {};

    return UserProfileResponse(
      image: json["image"] ?? "",
      fullName: json["fullName"] ?? "",
      username: user["username"] ?? "",
      dateOfBirth: json["birth"] ?? "", 
      phoneNumber: user["phone"] ?? "",
      occupation: json["occupation"] ?? "",
    );
  }
}
