import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:project/api/org.api.dart';
import 'package:project/models/donation_drive_model.dart';

class OrgProvider with ChangeNotifier {
  FirebaseOrgAPI firebaseService = FirebaseOrgAPI();
  late Stream<QuerySnapshot> _orgdonationsStream;

  Future<String> addDonationDrive(DonationDrive donationDrive) async {
    String res = await firebaseService
        .addDonationDrive(donationDrive.toJson(donationDrive));
    notifyListeners();
    return res;
  }

  void editDonationDrive(
      String driveId, Map<String, dynamic> editedDrive) async {
    await firebaseService.editDonationDrive(driveId, editedDrive);
    notifyListeners();
  }

  void deleteDonationDrive(String driveId) async {
    await firebaseService.deleteDonationDrive(driveId);
    notifyListeners();
  }

  Stream<QuerySnapshot> getDonations(String orgId) {
    _orgdonationsStream = firebaseService.getorgDonations(orgId);
    notifyListeners();
    return _orgdonationsStream;
  }

  Future<Map<String, dynamic>> getDonation(String orgId) async {
    return await firebaseService.getorgDonation(orgId);
  }
}
