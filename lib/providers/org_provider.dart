import 'package:flutter/material.dart';
import 'package:project/api/org.api.dart';
import 'package:project/models/donation_drive_model.dart';

class OrgProvider with ChangeNotifier {
  FirebaseOrgAPI firebaseService = FirebaseOrgAPI();

  Future<String> addDonationDrive(DonationDrive donationDrive) async {
    String res = await firebaseService
        .addDonationDrive(donationDrive.toJson(donationDrive));
    notifyListeners();
    return res;
  }
}
