class UserProfile {
  final String email;
  String username;
  String fullName;
  String phoneNumber;
  String password;

  UserProfile({
    required this.email,
    required this.username,
    required this.phoneNumber,
    required this.password,
    required this.fullName,
  });

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'username': username,
      'phone': phoneNumber,
      'password': password,
      'fullName': fullName,
    };
  }

  factory UserProfile.fromMap(Map<String, dynamic> map) {
    return UserProfile(
      email: map['email'] ?? '',
      username: map['username'] ?? '',
      phoneNumber: map['phone'] ?? '',
      password: map['password'] ?? '', 
      fullName: map['fullName'] ?? '',
    );
  }
}
