import 'dart:convert';

class Donor {
  String? donorId;
  String name;
  String email;
  String userType;
  String contactNumber;
  List<String> addresses;
  List<String> organizations;

  Donor(
      {this.donorId,
      required this.name,
      required this.email,
      required this.userType,
      required this.contactNumber,
      required this.addresses,
      required this.organizations});

  // Factory constructor to instantiate object from json format
  factory Donor.fromJson(Map<String, dynamic> json) {
    return Donor(
      donorId: json['donorId'],
      name: json['name'],
      email: json['email'],
      userType: json['userType'],
      contactNumber: json['contactNumber'],
      addresses: json['addresses'],
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
      'contactNumber': donor.contactNumber,
      'addresses': donor.addresses,
      'organizations': donor.organizations,
    };
  }
}
