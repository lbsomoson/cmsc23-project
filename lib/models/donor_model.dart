import 'dart:convert';

class Donor {
  final String? donorId;
  String name;
  String email;
  String userType;
  List<String> organizations;

  Donor(
      {this.donorId,
      required this.name,
      required this.email,
      required this.userType,
      required this.organizations});

  // Factory constructor to instantiate object from json format
  factory Donor.fromJson(Map<String, dynamic> json) {
    return Donor(
      donorId: json['donorId'],
      name: json['name'],
      email: json['email'],
      userType: json['userType'],
      organizations: json['organizations'],
    );
  }

  static List<Donor> fromJsonArray(String jsonData) {
    final Iterable<dynamic> data = jsonDecode(jsonData);
    return data.map<Donor>((dynamic d) => Donor.fromJson(d)).toList();
  }

  Map<String, dynamic> toJson(Donor donor) {
    return {
      'donorId': donor.donorId,
      'name': donor.name,
      'email': donor.email,
      'userType': donor.userType,
      'organizations': donor.organizations,
    };
  }
}
