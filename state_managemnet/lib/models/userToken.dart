class UserToken {
  final String userId;
  final String token;

  UserToken({this.userId, this.token});

  factory UserToken.fromJson(Map<String, dynamic> json) {
    return UserToken(
      token: json['token'],
      userId: json['userId'],
    );
  }

  toMap() {
    return {"userId": userId, "token": token};
  }
}
