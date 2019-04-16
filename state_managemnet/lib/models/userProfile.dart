class UserProfile {
  final String userId;
  final String name;

  UserProfile({this.userId, this.name});

  factory UserProfile.fromJson(Map<String, dynamic> json) {
    return UserProfile(
      name: json['name'],
      userId: json['userId'],
    );
  }
}
