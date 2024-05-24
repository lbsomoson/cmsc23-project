import 'dart:convert';

class Donation {
  String? donationId;
  final String donorId;
  List<String> itemCategory;
  String transferMode;
  double? weight;
  String? image;
  String? dateTime;
  List<String>? addresses;
  String? contactNumber;
  String? qrCode;
  String status;

  Donation({
    this.donationId,
    required this.donorId,
    required this.itemCategory,
    required this.transferMode,
    this.weight,
    this.image,
    this.dateTime,
    this.addresses,
    this.contactNumber,
    this.qrCode,
    required this.status,
  });

  // Factory constructor to instantiate object from json format
  factory Donation.fromJson(Map<String, dynamic> json) {
    return Donation(
      donationId: json['donationId'],
      donorId: json['donorId'],
      itemCategory: json['itemCategory'],
      transferMode: json['transferMode'],
      weight: json['weight'],
      image: json['image'],
      dateTime: json['dateTime'],
      addresses: json['addresses'],
      contactNumber: json['contactNumber'],
      qrCode: json['qrCode'],
      status: json['status'],
    );
  }

  static List<Donation> fromJsonArray(String jsonData) {
    final Iterable<dynamic> data = jsonDecode(jsonData);
    return data.map<Donation>((dynamic d) => Donation.fromJson(d)).toList();
  }

  Map<String, dynamic> toJson(Donation donation) {
    return {
      'donationId': donation.donationId,
      'donorId': donation.donorId,
      'itemCategory': donation.itemCategory,
      'transferMode': donation.transferMode,
      'weight': donation.weight,
      'image': donation.image,
      'dateTime': donation.dateTime,
      'addresses': donation.addresses,
      'contactNumber': donation.contactNumber,
      'qrCode': donation.qrCode,
      'status': donation.status,
    };
  }
}
