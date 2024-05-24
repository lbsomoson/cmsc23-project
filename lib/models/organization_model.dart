import 'dart:convert';

class Organization {
  String? organizationId;
  String name;
  String email;
  String userName;
  String address;
  int contactNumber;
  String about;
  String userType;
  List<String> donationDrives;
  List<String> donations;

  Organization({
    this.organizationId,
    required this.name,
    required this.email,
    required this.userName,
    required this.address,
    required this.contactNumber,
    required this.about,
    required this.userType,
    required this.donationDrives,
    required this.donations,
  });

  // Factory constructor to instantiate object from json format
  factory Organization.fromJson(Map<String, dynamic> json) {
    return Organization(
      organizationId: json['organizationId'],
      name: json['name'],
      email: json['email'],
      userName: json['userName'],
      address: json['address'],
      contactNumber: json['contactNumber'],
      about: json['about'],
      userType: json['userType'],
      donationDrives: json['donationDrives'],
      donations: json['donations'],
    );
  }

  static List<Organization> fromJsonArray(String jsonData) {
    final Iterable<dynamic> data = jsonDecode(jsonData);
    return data
        .map<Organization>((dynamic d) => Organization.fromJson(d))
        .toList();
  }

  Map<String, dynamic> toJson(Organization organization) {
    return {
      'organizationId': organization.organizationId,
      'name': organization.name,
      'email': organization.email,
      'userName': organization.userName,
      'address': organization.address,
      'contactNumber': organization.contactNumber,
      'about': organization.about,
      'userType': organization.userType,
      'donationDrives': organization.donationDrives,
      'donations': organization.donations,
    };
  }
}
