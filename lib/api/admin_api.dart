import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseAdminAPI {
  static final FirebaseFirestore db = FirebaseFirestore.instance;

  // get USERTYPE by id
  Future<Map<String, dynamic>> getUserType(String userId) async {
    DocumentSnapshot u = await db.collection('users').doc(userId).get();
    Map<String, dynamic> user = u.data() as Map<String, dynamic>;
    return user;
  }

  // get the number of donors
  Future<int> getDonorsCount() async {
    QuerySnapshot snapshot = await db.collection('donors').get();
    return snapshot.docs.length;
  }

  // get ALL DONORS
  Stream<QuerySnapshot> getDonors() {
    return db.collection('donors').snapshots();
  }

  // get ONE donor by id
  Future<Map<String, dynamic>> getDonor(String id) async {
    DocumentSnapshot d = await db.collection("donors").doc(id).get();
    Map<String, dynamic> donor = d.data() as Map<String, dynamic>;

    return donor;
  }

  // get the number of organizations
  Future<int> getOrganizationsCount() async {
    QuerySnapshot snapshot = await db.collection('organizations').get();
    return snapshot.docs.length;
  }

  // get ALL organizations
  Stream<QuerySnapshot> getOrganizations() {
    return db.collection('organizations').snapshots();
  }

  // get ONE organization by id
  Future<Map<String, dynamic>> getOrganization(String id) async {
    DocumentSnapshot o = await db.collection("organizations").doc(id).get();
    Map<String, dynamic> org = o.data() as Map<String, dynamic>;

    return org;
  }

  // get ALL organizations that are not yet approved
  Stream<QuerySnapshot> getOrganizationsToApprove() {
    return db
        .collection("organizations")
        .where("isApproved", isEqualTo: false)
        .snapshots();
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

  // get ALL donations
  Stream<QuerySnapshot> getDonations() {
    return db.collection('donations').snapshots();
  }

  // get ONE donation by id
  Future<Map<String, dynamic>> getDonation(String donationId) async {
    DocumentSnapshot donation =
        await db.collection("donation").doc(donationId).get();
    Map<String, dynamic> donationDetails =
        donation.data() as Map<String, dynamic>;

    return donationDetails;
  }

  // get ALL donations
  Stream<QuerySnapshot> getDonationsByOrgId(String orgId) {
    return db
        .collection('donations')
        .where("organizationId", isEqualTo: orgId)
        .snapshots();
  }

  // get total donations count per organization
  Future<int> getDonationsCountByOrgId(String orgId) async {
    QuerySnapshot snapshot = await db
        .collection('donations')
        .where("organizationId", isEqualTo: orgId)
        .get();

    return snapshot.size;
  }

  // get total donation drives count per organization
  Future<int> getDonationDrivesCountByOrgId(String orgId) async {
    QuerySnapshot snapshot = await db
        .collection('donation_drives')
        .where("organizationId", isEqualTo: orgId)
        .get();

    return snapshot.size;
  }

  // get total donations count
  Future<int> getDonationsCount() async {
    QuerySnapshot snapshot = await db.collection('donations').get();
    return snapshot.docs.length;
  }
}
