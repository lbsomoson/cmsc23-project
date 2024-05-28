import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:project/api/admin_api.dart';

class AdminProvider with ChangeNotifier {
  FirebaseAdminAPI firebaseService = FirebaseAdminAPI();

  late Stream<QuerySnapshot> _donorsStream;
  late Stream<QuerySnapshot> _organizationsStream;
  late Stream<QuerySnapshot> _donationDriveStream;
  late Stream<QuerySnapshot> _donationsStream;

  AdminProvider() {
    getDonors();
  }

  Future<Map<String, dynamic>> getUserType(String id) async {
    return await firebaseService.getUserType(id);
  }

  // get ALL donors
  Stream<QuerySnapshot> getDonors() {
    _donorsStream = firebaseService.getDonors();
    notifyListeners();
    return _donorsStream;
  }

  // get ONE donor by id
  Future<Map<String, dynamic>> getDonor(String id) async {
    return await firebaseService.getDonor(id);
  }

  // get ALL organizations
  Stream<QuerySnapshot> getOrganizations() {
    _organizationsStream = firebaseService.getOrganizations();
    notifyListeners();
    return _organizationsStream;
  }

  // get ONE organization by id
  Future<Map<String, dynamic>> getOrganization(String id) async {
    return await firebaseService.getOrganization(id);
  }

  // get ALL donation drives
  Stream<QuerySnapshot> getDonationDrives(String orgId) {
    _donationDriveStream = firebaseService.getDonationDrives(orgId);
    notifyListeners();
    return _donationDriveStream;
  }

  // get ALL donations
  Stream<QuerySnapshot> getDonations() {
    _donationsStream = firebaseService.getDonations();
    notifyListeners();
    return _donationsStream;
  }

  // get ONE donation by id
  Future<Map<String, dynamic>> getDonation(String orgId) async {
    return await firebaseService.getDonation(orgId);
  }
}
