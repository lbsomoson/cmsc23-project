import 'package:flutter/material.dart';

class OrgDonationDrivesScreen extends StatefulWidget {
  const OrgDonationDrivesScreen({super.key});

  @override
  State<OrgDonationDrivesScreen> createState() =>
      _OrgDonationDrivesScreenState();
}

class _OrgDonationDrivesScreenState extends State<OrgDonationDrivesScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Organization Donation Drives Screen"),
      ),
    );
  }
}
