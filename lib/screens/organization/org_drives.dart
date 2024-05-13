import 'package:flutter/material.dart';
import 'package:project/widgets/org_drive_card.dart';

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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [OrgDriveCard()],
            ),
          ),
        ),
      ),
    );
  }
}
