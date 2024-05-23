import 'dart:io';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../api/auth_api.dart';

class UserAuthProvider with ChangeNotifier {
  late FirebaseAuthAPI authService;
  FirebaseAuthAPI auth = FirebaseAuthAPI();

  late Stream<User?> uStream;

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
    String? message = await authService.orgSignUp(
        email, username, password, name, addresses, contact, type, path, file);
    notifyListeners();
    return message;
  }

  Future<String?> donorSignUp(
    String email,
    String username,
    String password,
    String name,
    List<String> addresses,
    String contact,
    String type,
  ) async {
    String? message = await authService.donorSignUp(
        email, username, password, name, addresses, contact, type);
    notifyListeners();
    return message;
  }

  Future<String?> signIn(String email, String password) async {
    String? message = await authService.signIn(email, password);
    notifyListeners();
    return message;
  }

  Future<void> signOut() async {
    await authService.signOut();
    notifyListeners();
  }
}
