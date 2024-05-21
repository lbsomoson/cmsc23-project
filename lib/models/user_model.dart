import 'dart:convert';

class User {
  String name;
  String username;
  String? address;
  String type;
  String? contact;

  User({
    required this.name,
    required this.username,
    this.address,
    required this.type,
    this.contact,
  });

  // Factory constructor to instantiate object from json format
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'],
      username: json['username'],
      address: json['address'],
      type: json['type'],
      contact: json['contact'],
    );
  }

  static List<User> fromJsonArray(String jsonData) {
    final Iterable<dynamic> data = jsonDecode(jsonData);
    return data.map<User>((dynamic d) => User.fromJson(d)).toList();
  }

  Map<String, dynamic> toJson(User user) {
    return {
      'name': user.name,
      'username': user.username,
      'address': user.address,
      'type': user.type,
      'contact': user.contact
    };
  }
}
