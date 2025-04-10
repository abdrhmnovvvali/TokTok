class ProfileRequest {
  final String fullName;
  final String username;
  final String dateOfBirth;
  final String phoneNumber;
  final String occupation;
  final String image;

  ProfileRequest({
    required this.fullName,
    required this.username,
    required this.dateOfBirth,
    required this.phoneNumber,
    required this.occupation,
    required this.image,
  });

  factory ProfileRequest.fromJson(Map<String, dynamic> json) {
    return ProfileRequest(
      fullName: json["fullName"] ?? '',
      username: json["username"] ?? '',
      dateOfBirth: json["dateOfBirth"] ?? '',
      phoneNumber: json["phoneNumber"] ?? '',
      occupation: json["occupation"] ?? '',
      image: json["image"] ?? '', 
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "fullName": fullName,
      "username": username,
      "dateOfBirth": dateOfBirth,
      "phoneNumber": phoneNumber,
      "occupation": occupation,
      "image": image,
    };
  }
}
