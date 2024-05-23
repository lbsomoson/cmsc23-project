import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:project/api/admin_api.dart';

class AdminProvider with ChangeNotifier {
  FirebaseAdminAPI firebaseService = FirebaseAdminAPI();

  late Stream<QuerySnapshot> _donorsStream;
  late Future<Map<String, dynamic>> _donor;
  late Stream<QuerySnapshot> _organizationsStream;
  late Future<Map<String, dynamic>> _organization;

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
}
