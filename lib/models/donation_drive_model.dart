import 'dart:convert';

class DonationDrive {
  final String? driveId;
  final String organizationId;
  List<String>? donationIds;
  String title;
  String recipient;
  String plan;
  DateTime date;
  String status;
  String? donationDeliveryProof;

  DonationDrive({
    this.driveId,
    required this.organizationId,
    required this.donationIds,
    required this.title,
    required this.recipient,
    required this.plan,
    required this.date,
    required this.status,
    this.donationDeliveryProof,
  });

  // Factory constructor to instantiate object from json format
  factory DonationDrive.fromJson(Map<String, dynamic> json) {
    return DonationDrive(
      driveId: json['driveId'],
      organizationId: json['organizationId'],
      donationIds: json['donationIds'],
      title: json['title'],
      recipient: json['recipient'],
      plan: json['plan'],
      date: json['date'],
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
      'donationIds': donationDrive.donationIds,
      'title': donationDrive.title,
      'recipient': donationDrive.recipient,
      'plan': donationDrive.plan,
      'date': donationDrive.date,
      'status': donationDrive.status,
      'donationDeliveryProof': donationDrive.donationDeliveryProof,
    };
  }
}
