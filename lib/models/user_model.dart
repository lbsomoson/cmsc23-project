import 'dart:convert';

class newUser {
  String name;
  String username;
  String? address;
  String type;
  String? contact;


  newUser({
    required this.name,
    required this.username,
    this.address,
    required this.type,
    this.contact,
  });

  // Factory constructor to instantiate object from json format
  factory newUser.fromJson(Map<String, dynamic> json) {
    return newUser(
      name: json['name'],
      username: json['username'],
      address: json['address'],
      type: json['type'],
      contact: json['contact'],
    );
  }

  static List<newUser> fromJsonArray(String jsonData) {
    final Iterable<dynamic> data = jsonDecode(jsonData);
    return data.map<newUser>((dynamic d) => newUser.fromJson(d)).toList();
  }

  Map<String, dynamic> toJson(newUser User) {
    return {
      'name' : User.name,
      'username' : User.username,
      'address' : User.address,
      'type' : User.type,
      'contact' : User.contact
    };
  }
}
