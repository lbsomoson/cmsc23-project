import 'package:flutter/material.dart';

class OrgDonationScreen extends StatefulWidget {
  const OrgDonationScreen({super.key});

  @override
  State<OrgDonationScreen> createState() => _OrgDonationScreenState();
}

class _OrgDonationScreenState extends State<OrgDonationScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Organization Donation Screen"),
      ),
    );
  }
}
