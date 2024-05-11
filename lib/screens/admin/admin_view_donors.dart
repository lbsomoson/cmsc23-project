import 'package:flutter/material.dart';

class AdminViewDonorsScreen extends StatefulWidget {
  const AdminViewDonorsScreen({super.key});

  @override
  State<AdminViewDonorsScreen> createState() => _AdminViewDonorsScreenState();
}

class _AdminViewDonorsScreenState extends State<AdminViewDonorsScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Admin View All Donors Screen"),
      ),
    );
  }
}
