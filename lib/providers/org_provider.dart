import 'package:flutter/material.dart';
import 'package:project/api/org.api.dart';

class OrgProvider with ChangeNotifier {
  FirebaseOrgAPI firebaseService = FirebaseOrgAPI();
}
