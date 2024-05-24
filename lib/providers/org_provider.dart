import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:project/api/org.api.dart';
import 'package:project/models/donation_drive_model.dart';

class OrgProvider with ChangeNotifier {
  FirebaseOrgAPI firebaseService = FirebaseOrgAPI();

  void addDonationDrive(DonationDrive donationDrive) async {
    await firebaseService.addDonationDrive(donationDrive.toJson(donationDrive));
    notifyListeners();
  }

  void editDonationDrive(String driveId) async {
    await firebaseService.editDonationDrive(driveId);
    notifyListeners();
  }

  void deleteDonationDrive(String driveId) async{
    await firebaseService.deleteDonationDrive(driveId);
    notifyListeners();
  }
}
