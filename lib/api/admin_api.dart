import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseAdminAPI {
  static final FirebaseFirestore db = FirebaseFirestore.instance;

  Stream<QuerySnapshot> getDonors() {
    return db.collection('donors').snapshots();
  }

  Future<Map<String, dynamic>> getDonor(String id) async {
    DocumentSnapshot d = await db.collection("donors").doc(id).get();
    Map<String, dynamic> donor = d.data() as Map<String, dynamic>;

    return donor;
  }

  Stream<QuerySnapshot> getOrganizations() {
    return db.collection('organizations').snapshots();
  }

  Future<Map<String, dynamic>> getOrganization(String id) async {
    DocumentSnapshot o = await db.collection("organizations").doc(id).get();
    Map<String, dynamic> org = o.data() as Map<String, dynamic>;

    return org;
  }

  // fetch all instances of `donation_drives` as a Stream of QuerySnapshot
  Stream<QuerySnapshot> getDonationDrives(String orgId) {
    return db
        .collection("donation_drives")
        .where("organizationId", isEqualTo: orgId)
        .snapshots();
  }

  // fetch one intance of donation drive
  Future<Map<String, dynamic>> getDonationDrive(String id) async {
    DocumentSnapshot drive =
        await db.collection("donation_drives").doc(id).get();
    Map<String, dynamic> donationDrive = drive.data() as Map<String, dynamic>;

    return donationDrive;
  }

  // TODO: VIEW DONATION DRIVE DONATIONS
  // TODO: VIEW DONATION DRIVE DONATIONS
  Stream<QuerySnapshot> getDonations() {
    return db.collection('donations').snapshots();
  }

  Future<Map<String, dynamic>> getDonation(String donationId) async {
    DocumentSnapshot donation = await db.collection("donation").doc(donationId).get();
    Map<String, dynamic> donationDetails = donation.data() as Map<String, dynamic>;

    return donationDetails;
  }
}
