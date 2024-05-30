import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:project/api/admin_api.dart';

class AdminProvider with ChangeNotifier {
  FirebaseAdminAPI firebaseService = FirebaseAdminAPI();

  late Stream<QuerySnapshot> _donorsStream;
  late Stream<QuerySnapshot> _organizationsStream;
  late Stream<QuerySnapshot> _organizationsToApproveStream;
  late Stream<QuerySnapshot> _approvedOrganizationsStream;
  late Stream<QuerySnapshot> _donationDriveStream;
  late Stream<QuerySnapshot> _donationsStream;
  late Stream<QuerySnapshot> _donationDriveByOrgIdStream;
  late Stream<QuerySnapshot> _donationsByOrgIdStream;

  AdminProvider() {
    getDonors();
  }

  Future<Map<String, dynamic>> getUserType(String id) async {
    return await firebaseService.getUserType(id);
  }

  // get the number of donors
  Future<int> getDonorsCount() async {
    return await firebaseService.getDonorsCount();
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

  // get the number of organizations
  Future<int> getOrganizationsCount() async {
    return await firebaseService.getOrganizationsCount();
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

  // get ALL organizations to approve
  Stream<QuerySnapshot> getOrganizationsToApprove() {
    _organizationsToApproveStream = firebaseService.getOrganizationsToApprove();
    notifyListeners();
    return _organizationsToApproveStream;
  }

  // get ALL approved organizations
  Stream<QuerySnapshot> getApprovedOrganizations() {
    _approvedOrganizationsStream = firebaseService.getApprovedOrganizations();
    notifyListeners();
    return _approvedOrganizationsStream;
  }

  // get ALL donation drives
  Stream<QuerySnapshot> getDonationDrives(String orgId) {
    _donationDriveStream = firebaseService.getDonationDrives(orgId);
    notifyListeners();
    return _donationDriveStream;
  }

  // get ONE donation drive
  Future<Map<String, dynamic>> getDonationDrive(String id) async {
    return await firebaseService.getDonationDrive(id);
  }

  // get ONE donation by id
  Future<Map<String, dynamic>> getDonation(String orgId) async {
    return await firebaseService.getDonation(orgId);
  }

  // get ALL donation drives by organization id
  Stream<QuerySnapshot> getDonationDrivesByOrgId(String orgId) {
    _donationDriveByOrgIdStream =
        firebaseService.getDonationDrivesByOrgId(orgId);
    notifyListeners();
    return _donationDriveByOrgIdStream;
  }

  // get ALL donations
  Stream<QuerySnapshot> getDonations() {
    _donationsStream = firebaseService.getDonations();
    notifyListeners();
    return _donationsStream;
  }

  // get ALL donations by orgId
  Stream<QuerySnapshot> getDonationsByOrgId(String orgId) {
    _donationsByOrgIdStream = firebaseService.getDonationsByOrgId(orgId);
    notifyListeners();
    return _donationsByOrgIdStream;
  }

  // get total donations count per organization
  Future<int> getDonationsCountByOrgId(String orgId) async {
    return await firebaseService.getDonationsCountByOrgId(orgId);
  }

  // get total donations count per organization
  Future<int> getDonationDrivesCountByOrgId(String orgId) async {
    return await firebaseService.getDonationDrivesCountByOrgId(orgId);
  }

  // get the number of donations
  Future<int> getDonationsCount() async {
    return await firebaseService.getDonationsCount();
  }

  // approve organization application
  Future<String> approveOrganization(String orgId) {
    return firebaseService.approveOrganization(orgId);
  }
}
