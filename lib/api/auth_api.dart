import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseAuthAPI {
  static final FirebaseAuth auth = FirebaseAuth.instance;
  static final FirebaseFirestore db = FirebaseFirestore.instance;

  User? getUser() {
    return auth.currentUser;
  }

  Stream<User?> userSignedIn() {
    return auth.authStateChanges();
  }

  // TODO: Refactor code, use the appropriate models
  Future<String?> signIn(String email, String password) async {
    try {
      // Sign in the user
      await auth.signInWithEmailAndPassword(email: email, password: password);

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
          String userType = userDoc.get('userType');
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
  Future<String?> signUp(String email, String username, String password,
      String name, List<String> addresses, String contact, String type) async {
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

      if (type == "donor") {
        // add name, and email, address/es, contact, and user type of user to `donors` collection
        await db.collection('donors').doc(credential.user!.uid).set({
          "userId": credential.user!.uid,
          "name": name,
          "email": email,
          "address": addresses,
          "contactNumber": contact,
          "userType": type
        });
      } else if (type == "organization") {
        // add name, and email, address/es, contact, and user type of user to `organizations` collection
        await db.collection('organizations').doc(credential.user!.uid).set({
          "userId": credential.user!.uid,
          "name": name,
          "email": email,
          "address": addresses,
          "contactNumber": contact,
          "userType": type
        });
      }
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

  Future<void> signOut() async {
    await auth.signOut();
  }
}
