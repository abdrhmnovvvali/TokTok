class ProfileRequest {
    final int? id;
    final String? fullName;
    final dynamic birth;
    final String? occupation;
    final dynamic bio;
    final int? follower;
    final int? following;
    final int? postCount;
    final User? user;
    final dynamic image;

    ProfileRequest({
        this.id,
        this.fullName,
        this.birth,
        this.occupation,
        this.bio,
        this.follower,
        this.following,
        this.postCount,
        this.user,
        this.image,
    });

    ProfileRequest copyWith({
        int? id,
        String? fullName,
        dynamic birth,
        String? occupation,
        dynamic bio,
        int? follower,
        int? following,
        int? postCount,
        User? user,
        dynamic image,
    }) => 
        ProfileRequest(
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

class User {
    final int? id;
    final String? username;
    final String? email;
    final String? phone;
    final bool? isPrivate;

    User({
        this.id,
        this.username,
        this.email,
        this.phone,
        this.isPrivate,
    });

    User copyWith({
        int? id,
        String? username,
        String? email,
        String? phone,
        bool? isPrivate,
    }) => 
        User(
            id: id ?? this.id,
            username: username ?? this.username,
            email: email ?? this.email,
            phone: phone ?? this.phone,
            isPrivate: isPrivate ?? this.isPrivate,
        );
}
