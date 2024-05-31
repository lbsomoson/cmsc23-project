import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class FirebaseDonorAPI {
  static final FirebaseAuth auth = FirebaseAuth.instance;
  static final FirebaseFirestore db = FirebaseFirestore.instance;
  static final FirebaseStorage storage = FirebaseStorage.instance;

  Stream<QuerySnapshot> getDonorPendingDonations(String donorId) {
    return db
        .collection('donations')
        .where('donorId', isEqualTo: donorId)
        .snapshots();
  }

  Future<String> addDonorDonation(Map<String, dynamic> donation) async {
    try {
      await db.collection('donations').add(donation);
      return "Please wait for donation confimation, thank you!";
    } on FirebaseException catch (e) {
      return "Failed with error '${e.code}: ${e.message}'";
    }
  }

  // Future<String> donorProfile() async {
  //   Map<String, dynamic> details = {};
  //   final User user = getUser()!;
  //   String email = user.email!;
  //   QuerySnapshot querySnapshot = await db
  //       .collection("donors")
  //       .where('email', isEqualTo: email)
  //       .limit(1)
  //       .get();
  //   String documentId = querySnapshot.docs.first.id;
  //   DocumentSnapshot userDoc =
  //       await db.collection("donors").doc(documentId).get();
  //   return userDoc.get('name');
  // }
}
