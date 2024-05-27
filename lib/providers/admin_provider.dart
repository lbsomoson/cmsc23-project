import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:project/api/admin_api.dart';

class AdminProvider with ChangeNotifier {
  FirebaseAdminAPI firebaseService = FirebaseAdminAPI();

  late Stream<QuerySnapshot> _donorsStream;
  late Future<Map<String, dynamic>> _donor;
  late Stream<QuerySnapshot> _organizationsStream;
  late Future<Map<String, dynamic>> _organization;
  late Stream<QuerySnapshot> _donationDriveStream;
  late Future<Map<String, dynamic>> _donationDrive;
  late Stream<QuerySnapshot> _donationsStream;
  late Future<Map<String, dynamic>> _donation;


  AdminProvider() {
    getDonors();
  }

  Stream<QuerySnapshot> getDonors() {
    _donorsStream = firebaseService.getDonors();
    notifyListeners();
    return _donorsStream;
  }

  Future<Map<String, dynamic>> getDonor(String id) async {
    return await firebaseService.getDonor(id);
  }

  Stream<QuerySnapshot> getOrganizations() {
    _organizationsStream = firebaseService.getOrganizations();
    notifyListeners();
    return _organizationsStream;
  }

  Future<Map<String, dynamic>> getOrganization(String id) async {
    return await firebaseService.getOrganization(id);
  }

  Stream<QuerySnapshot> getDonationDrives(String orgId) {
    _donationDriveStream = firebaseService.getDonationDrives(orgId);
    notifyListeners();
    return _donationDriveStream;
  }

  Stream<QuerySnapshot> getDonations () {
    _donationsStream = firebaseService.getDonations();
    notifyListeners();
    return _donationsStream;
  }

  Future<Map<String, dynamic>> getDonation(String orgId) async {
    return await firebaseService.getDonation(orgId);
  }


}
