import 'dart:convert';

class User {
  String? userId;
  String name;
  String email;
  String userType;

  User({
    this.userId,
    required this.name,
    required this.email,
    required this.userType,
  });

  // Factory constructor to instantiate object from json format
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      userId: json['adminId'],
      name: json['name'],
      email: json['email'],
      userType: json['userType'],
    );
  }

  static List<User> fromJsonArray(String jsonData) {
    final Iterable<dynamic> data = jsonDecode(jsonData);
    return data.map<User>((dynamic d) => User.fromJson(d)).toList();
  }

  Map<String, dynamic> toJson(User user) {
    return {
      'userId': user.userId,
      'name': user.name,
      'email': user.email,
      'userType': user.userType,
    };
  }
}
