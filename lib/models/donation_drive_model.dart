import 'dart:convert';

class DonationDrive {
  final String? driveId;
  final String organizationId;
  List<String> donationId;
  String title;
  String description;
  String status;
  String? donationDeliveryProof;

  DonationDrive({
    this.driveId,
    required this.organizationId,
    required this.donationId,
    required this.title,
    required this.description,
    required this.status,
    this.donationDeliveryProof,
  });

  // Factory constructor to instantiate object from json format
  factory DonationDrive.fromJson(Map<String, dynamic> json) {
    return DonationDrive(
      driveId: json['driveId'],
      organizationId: json['organizationId'],
      donationId: json['donationId'],
      title: json['title'],
      description: json['description'],
      status: json['status'],
      donationDeliveryProof: json['donationDeliveryProof'],
    );
  }

  static List<DonationDrive> fromJsonArray(String jsonData) {
    final Iterable<dynamic> data = jsonDecode(jsonData);
    return data
        .map<DonationDrive>((dynamic d) => DonationDrive.fromJson(d))
        .toList();
  }

  Map<String, dynamic> toJson(DonationDrive donationDrive) {
    return {
      'driveId': donationDrive.driveId,
      'organizationId': donationDrive.organizationId,
      'donationId': donationDrive.donationId,
      'title': donationDrive.title,
      'description': donationDrive.description,
      'status': donationDrive.status,
      'donationDeliveryProof': donationDrive.donationDeliveryProof,
    };
  }
}
