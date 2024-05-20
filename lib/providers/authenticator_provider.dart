import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:project/models/user_model.dart';
import '../api/authenticator_api.dart';

class UserAuthProvider with ChangeNotifier {
  late FirebaseAuthAPI authService;
  FirebaseAuthAPI auth = FirebaseAuthAPI();

  late Stream<User?> uStream;
  User? userObj;
  UserAuthProvider() {
    authService = FirebaseAuthAPI();
    fetchAuthentication();
  }
  Stream<User?> get userStream => uStream;
  User? get user => authService.getUser();

  void fetchAuthentication() {
    uStream = authService.userSignedIn();
    notifyListeners();
  }

  Future<void> signUp(String email, String password) async {
    await authService.signUp(email, password);
    notifyListeners();
  }

  Future<void> signIn(String email, String password) async {
    await authService.signIn(email, password);
    notifyListeners();
  }

  Future<void> signOut() async {
    await authService.signOut();
    notifyListeners();
  }

  void addUser(newUser user) async {
    String message = await auth.addUser(user.toJson(user));
    print(message);
    notifyListeners();
  }


}
