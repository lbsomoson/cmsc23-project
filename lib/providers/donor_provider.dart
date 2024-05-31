import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:project/api/donor_api.dart';
import 'package:project/models/donation_model.dart';

class DonorProvider with ChangeNotifier {
  FirebaseDonorAPI firebaseService = FirebaseDonorAPI();
  late Stream<QuerySnapshot> _donorDonationsStream;

  Stream<QuerySnapshot> getDonorPendingDonations(String donorId) {
    _donorDonationsStream = firebaseService.getDonorPendingDonations(donorId);
    notifyListeners();
    return _donorDonationsStream;
  }

  Future<String> addDonationDrive(Donation donation) async {
    String res =
        await firebaseService.addDonorDonation(donation.toJson(donation));
    notifyListeners();
    return res;
  }
}
