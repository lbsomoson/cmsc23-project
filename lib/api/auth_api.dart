import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthAPI {
  static final FirebaseAuth auth = FirebaseAuth.instance;
  static final FirebaseFirestore db = FirebaseFirestore.instance;
  static final FirebaseStorage storage = FirebaseStorage.instance;

  User? getUser() {
    return auth.currentUser;
  }

  Stream<User?> userSignedIn() {
    return auth.authStateChanges();
  }

  Future<Map<String, dynamic>> getUserDetails(String userId) async {
    DocumentSnapshot u = await db.collection("users").doc(userId).get();
    Map<String, dynamic> user = u.data() as Map<String, dynamic>;

    return user;
  }

  // TODO: Refactor code, use the appropriate models
  Future<String?> signIn(String email, String password) async {
    try {
      // Sign in the user
      //await auth.signInWithEmailAndPassword(email: email, password: password);

      // get the user document with the specified email
      QuerySnapshot querySnapshot = await db
          .collection('users')
          .where('email', isEqualTo: email)
          .limit(1)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        String documentId = querySnapshot.docs.first.id;

        // get the user document from the 'users' collection
        DocumentSnapshot userDoc =
            await db.collection("users").doc(documentId).get();
        if (userDoc.exists) {
          // extract and return the userType field
          String userType = userDoc.get('type');
          if (userType == 'organization') {
            DocumentSnapshot orgDoc =
                await db.collection('organizations').doc(documentId).get();
            bool status = orgDoc.get('isApproved');
            if (status == false) {
              return 'Wait for admin approval';
            } else {
              await auth.signInWithEmailAndPassword(
                  email: email, password: password);
              return userType;
            }
          }
          await auth.signInWithEmailAndPassword(
              email: email, password: password);
          return userType;
        } else {
          return 'User document in donors collection does not exist.';
        }
      } else {
        return 'User document in users collection not found.';
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return "No user found for that email.";
      } else if (e.code == 'wrong-password') {
        return 'Wrong password provided for that user.';
      } else if (e.code == 'invalid-email') {
        return 'Invalid email.';
      } else if (e.code == 'invalid-credential') {
        return "Invalid credential.";
      } else {
        return "Failed at ${e.code}: ${e.message}";
      }
    } catch (e) {
      return "An unknown error occurred: $e";
    }
  }

  // TODO: Refactor code, use the appropriate models
  // TODO: Can either separate this to sign up as donor and sign up as organization
  // TODO: Or add an optional parameter for uploading the proof of legitimacy
  Future<String?> orgSignUp(
      String email,
      String username,
      String password,
      String name,
      List<String> addresses,
      String contact,
      String type,
      String path,
      File file) async {
    UserCredential credential;

    try {
      // signup
      credential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      TaskSnapshot taskSnapshot = await storage.ref().child(path).putFile(file);

      // get the download URL
      String downloadURL = await taskSnapshot.ref.getDownloadURL();

      // add name, and email, address/es, contact, and user type of user to `users` collection
      await db
          .collection('users')
          .doc(credential.user!.uid)
          .set({"email": email, "type": type});

      // add name, and email, address/es, contact, and user type of user to `organizations` collection
      await db.collection('organizations').doc(credential.user!.uid).set({
        "userId": credential.user!.uid,
        "name": name,
        "username": username,
        "email": email,
        "addresses": addresses,
        "contactNumber": contact,
        "userType": type,
        "photoUrl": downloadURL,
        "proofPath": path,
        "uploadedAt": Timestamp.now(),
        "isApproved": false,
        "isOpen": true,
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return "The password provided is too weak.";
      } else if (e.code == 'email-already-in-use') {
        return "The account already exists for that email.";
      }
    } catch (e) {
      return e.toString();
    }
    return null;
  }

  Future<String?> donorSignUp(
    String email,
    String username,
    String password,
    String name,
    List<String> addresses,
    String contact,
    String? type,
  ) async {
    UserCredential credential;

    try {
      // signup
      credential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // add name, and email, address/es, contact, and user type of user to `users` collection
      await db
          .collection('users')
          .doc(credential.user!.uid)
          .set({"email": email, "type": type});

      // add name, and email, address/es, contact, and user type of user to `donors` collection
      await db.collection('donors').doc(credential.user!.uid).set({
        "userId": credential.user!.uid,
        "name": name,
        "email": email,
        "address": addresses,
        "contactNumber": contact,
        "userType": type
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return "The password provided is too weak.";
      } else if (e.code == 'email-already-in-use') {
        return "The account already exists for that email.";
      }
    } catch (e) {
      return e.toString();
    }
    return null;
  }

  Future signInWithGoogle() async {
    // trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // once signed in, return the UserCredential
    UserCredential userCredential =
        await FirebaseAuth.instance.signInWithCredential(credential);

    // retrieve the User object
    User? user = userCredential.user;

    // retrieve additional user data from Firestore
    if (user != null) {
      DocumentSnapshot userSnapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .get();
      // access user data from the userSnapshot
      String userType = userSnapshot['type'];
      return userType;
    }

    return null;
  }

  Future<void> signOut() async {
    await auth.signOut();
    await GoogleSignIn().signOut();
  }
}
