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

  // TODO: VIEW ORG DONATION DRIVES
  // TODO: VIEW ORG DONATION DRIVE

  // TODO: VIEW DONATION DRIVE DONATIONS
  // TODO: VIEW DONATION DRIVE DONATIONS
}
