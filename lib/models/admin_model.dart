import 'dart:convert';

class Admin {
  final String? adminId;
  String name;
  String email;
  String userType;

  Admin({
    this.adminId,
    required this.name,
    required this.email,
    required this.userType,
  });

  // Factory constructor to instantiate object from json format
  factory Admin.fromJson(Map<String, dynamic> json) {
    return Admin(
      adminId: json['adminId'],
      name: json['name'],
      email: json['email'],
      userType: json['userType'],
    );
  }

  static List<Admin> fromJsonArray(String jsonData) {
    final Iterable<dynamic> data = jsonDecode(jsonData);
    return data.map<Admin>((dynamic d) => Admin.fromJson(d)).toList();
  }

  Map<String, dynamic> toJson(Admin admin) {
    return {
      'adminId': admin.adminId,
      'name': admin.name,
      'email': admin.email,
      'userType': admin.userType,
    };
  }
}
