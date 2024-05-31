import 'package:cloud_firestore/cloud_firestore.dart';

// TODO: ADD CATEGORY OF ORGANIZATION
class Organization {
  String? organizationId;
  String name;
  String username;
  String email;
  List<String> addresses;
  List<String> donationDrives;
  String contactNumber;
  String userType;
  String photoUrl;
  String proofPath;
  Timestamp uploadedAt;
  bool isApproved;
  bool isOpen;

  Organization({
    this.organizationId,
    required this.name,
    required this.username,
    required this.email,
    required this.addresses,
    required this.donationDrives,
    required this.contactNumber,
    required this.userType,
    required this.photoUrl,
    required this.proofPath,
    required this.uploadedAt,
    required this.isApproved,
    required this.isOpen,
  });

  factory Organization.fromJson(Map<String, dynamic> json) {
    return Organization(
      organizationId: json['organizationId'],
      name: json['name'] ?? '',
      username: json['username'] ?? '',
      email: json['email'] ?? '',
      addresses: List<String>.from(json['addresses'] ?? []),
      donationDrives: List<String>.from(json['donationDrives'] ?? []),
      contactNumber: json['contactNumber'] ?? '',
      userType: json['userType'] ?? '',
      photoUrl: json['photoUrl'] ?? '',
      proofPath: json['proofPath'] ?? '',
      uploadedAt: json['uploadedAt'] ?? Timestamp.now(),
      isApproved: json['isApproved'] ?? false,
      isOpen: json['isOpen'] ?? true,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'organizationId': organizationId,
      'name': name,
      'username': username,
      'email': email,
      'addresses': addresses,
      'donationDrives': donationDrives,
      'contactNumber': contactNumber,
      'userType': userType,
      'photoUrl': photoUrl,
      'proofPath': proofPath,
      'uploadedAt': uploadedAt,
      'isApproved': isApproved,
      'isOpen': isOpen,
    };
  }
}
