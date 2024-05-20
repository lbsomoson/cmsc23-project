import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseAuthAPI {
  static final FirebaseAuth auth = FirebaseAuth.instance;

  static final FirebaseFirestore allusers = FirebaseFirestore.instance;

  User? getUser(){
    return auth.currentUser;
  }

  Future<String?> signIn(String email, String password) async {
    try{
      await auth.signInWithEmailAndPassword(email: email, password: password);
      return"";
    } on FirebaseException catch(e){
      if(e.code == 'invalid-email'){
        return e.message;
      } else if(e.code == 'invalid credential'){
        return e.message;
      } else{
        return "Failed at ${e.code}: ${e.message}";
      }
    }
  }

  //Rereturn kung may nakalog in ba
  Stream<User?> userSignedIn(){
    return auth.authStateChanges();
  }

  Future<void> signUp(String email, String password) async {
    UserCredential credential; //Built in
    try{
      credential = await auth.createUserWithEmailAndPassword(email: email, password: password);
      print(credential);
    } on FirebaseAuthException catch (e){
      if(e.code == 'email-already-in use'){
        print('The account already exists for that email.');
      }
    } catch (e){ 
      print(e);
    }
  }

  Future<String> addUser(Map<String, dynamic> newuser) async {
    try {
      await allusers.collection("users").add(newuser);
      return "Successfully added user!";
    } on FirebaseException catch (e) {
      return "Failed with error '${e.code}: ${e.message}";
    }
  }

  Future<void> signOut() async{
    await auth.signOut();
  }




}
