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

  Future<String?> signIn(String email, String password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return "No user found for that email";
      } else if (e.code == 'wrong-password') {
        return 'Wrong password provided for that user.';
      } else if (e.code == 'invalid-email') {
        return 'Invalid email.';
      } else if (e.code == 'invalid-credential') {
        return ("Invalid credential.");
      } else {
        return "Failed at ${e.code}: ${e.message}";
      }
    }
    return null;
  }

  Future<String?> signUp(String email, String password, String name) async {
    UserCredential credential;
    try {
      // signup
      credential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // add firstName, lastName, and email of user to Firestore
      await db.collection('users').doc(credential.user!.uid).set({
        "name": name,
        "email": email,
      });

      await credential.user?.updateDisplayName(name);
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
