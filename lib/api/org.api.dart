import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class FirebaseOrgAPI {
  static final FirebaseAuth auth = FirebaseAuth.instance;
  static final FirebaseFirestore db = FirebaseFirestore.instance;
  static final FirebaseStorage storage = FirebaseStorage.instance;

  Future<String> addDonationDrive(Map<String, dynamic> donationDrive) async {
    try {
      TaskSnapshot taskSnapshot = await storage
          .ref()
          .child(donationDrive['path'])
          .putFile(donationDrive['file']);

      // get the download URL
      String downloadURL = await taskSnapshot.ref.getDownloadURL();

      donationDrive['photoUrl'] = downloadURL;

      // remove the 'file' key from the donationDrive map
      donationDrive.remove('file');

      await db.collection('donation_drives').add(donationDrive);
      return "Successfully added donation drive!";
    } on FirebaseException catch (e) {
      return "Failed with error '${e.code}: ${e.message}'";
    }
  }

  Future<String> editDonationDrive(String driveId) async {
    try {
      await db.collection('donation_drives').doc(driveId).update({});
      return "Successfully edited donation drive!";
    } on FirebaseException catch (e) {
      return "Failed with error '${e.code}: ${e.message}'";
    }
  }

  Future<String> deleteDonationDrive(String driveId) async {
    try {
      await db.collection('donation_drives').doc(driveId).delete();
      return "Successfully deleted donation drive!";
    } on FirebaseException catch (e) {
      return "Failed with error '${e.code}: ${e.message}'";
    }
  }
}
