import 'package:flutter/material.dart';

class AdminViewOrgsScreen extends StatefulWidget {
  const AdminViewOrgsScreen({super.key});

  @override
  State<AdminViewOrgsScreen> createState() => _AdminViewOrgsScreenState();
}

class _AdminViewOrgsScreenState extends State<AdminViewOrgsScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Admin View All Organizations Screen"),
      ),
    );
  }
}
