import 'dart:convert';

class UserProfileResponse {
  final int? id;
  final String fullName;
  final String birth; // null gəlirsə boş string olacaq
  final String occupation;
  final String bio;
  final int follower;
  final int following;
  final int postCount;
  final User? user;
  final String image;

  UserProfileResponse({
    this.id,
    required this.fullName,
    required this.birth,
    required this.occupation,
    required this.bio,
    required this.follower,
    required this.following,
    required this.postCount,
    this.user,
    required this.image,
  });

  factory UserProfileResponse.fromRawJson(String str) =>
      UserProfileResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UserProfileResponse.fromJson(Map<String, dynamic> json) {
    final userJson = json['user'] as Map<String, dynamic>?;

    return UserProfileResponse(
      id: json["id"] as int?,
      fullName: (json["fullName"] ?? "") as String,
      birth: json["birth"]?.toString() ?? "",
      occupation: (json["occupation"] ?? "") as String,
      bio: json["bio"]?.toString() ?? "",
      follower: json["follower"] ?? 0,
      following: json["following"] ?? 0,
      postCount: json["postCount"] ?? 0,
      user: userJson != null ? User.fromJson(userJson) : null,
      image: json["image"]?.toString() ?? "",
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "fullName": fullName,
        "birth": birth,
        "occupation": occupation,
        "bio": bio,
        "follower": follower,
        "following": following,
        "postCount": postCount,
        "user": user?.toJson(),
        "image": image,
      };

  UserProfileResponse copyWith({
    int? id,
    String? fullName,
    String? birth,
    String? occupation,
    String? bio,
    int? follower,
    int? following,
    int? postCount,
    User? user,
    String? image,
  }) {
    return UserProfileResponse(
      id: id ?? this.id,
      fullName: fullName ?? this.fullName,
      birth: birth ?? this.birth,
      occupation: occupation ?? this.occupation,
      bio: bio ?? this.bio,
      follower: follower ?? this.follower,
      following: following ?? this.following,
      postCount: postCount ?? this.postCount,
      user: user ?? this.user,
      image: image ?? this.image,
    );
  }
}

class User {
  final int? id;
  final String username;
  final String email;
  final String phone;
  final bool isPrivate;

  User({
    this.id,
    required this.username,
    required this.email,
    required this.phone,
    required this.isPrivate,
  });

  factory User.fromRawJson(String str) => User.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json["id"] as int?,
      username: (json["username"] ?? "") as String,
      email: (json["email"] ?? "") as String,
      phone: (json["phone"] ?? "") as String,
      isPrivate: json["isPrivate"] ?? false,
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "email": email,
        "phone": phone,
        "isPrivate": isPrivate,
      };

  User copyWith({
    int? id,
    String? username,
    String? email,
    String? phone,
    bool? isPrivate,
  }) {
    return User(
      id: id ?? this.id,
      username: username ?? this.username,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      isPrivate: isPrivate ?? this.isPrivate,
    );
  }
}
