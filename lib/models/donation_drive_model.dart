import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';

class DonationDrive {
  String? driveId;
  final String organizationId;
  List<String>? donationIds;
  String title;
  String recipient;
  String plan;
  DateTime date;
  String status;
  String path;
  File? file;
  String photoUrl;
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
    required this.path,
    this.file,
    required this.photoUrl,
    this.donationDeliveryProof,
  });

  // Factory constructor to instantiate object from json format
  factory DonationDrive.fromJson(Map<String, dynamic> json) {
    return DonationDrive(
      driveId: json['driveId'],
      organizationId: json['organizationId'],
      donationIds: json['donationIds'] != null
          ? List<String>.from(json['donationIds'])
          : null,
      title: json['title'] ?? '',
      recipient: json['recipient'] ?? '',
      plan: json['plan'] ?? '',
      date: (json['date'] as Timestamp).toDate(),
      status: json['status'] ?? '',
      path: json['path'] ?? '',
      file: json['file'] != null ? File(json['file']) : null,
      photoUrl: json['photoUrl'] ?? '',
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
      'path': donationDrive.path,
      'file': donationDrive.file?.path,
      'photoUrl': donationDrive.photoUrl,
      'donationDeliveryProof': donationDrive.donationDeliveryProof,
    };
  }
}
