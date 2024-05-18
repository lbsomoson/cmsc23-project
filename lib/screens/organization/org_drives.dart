import 'package:flutter/material.dart';
import 'package:project/widgets/appbar_title.dart';
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
    return Scaffold(
      appBar: AppBar(
        title: const AppBarTitle(title: "My Donation Drives"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
            child: const Column(
              children: [
                OrgDriveCard(),
                OrgDriveCard(),
                OrgDriveCard(),
                OrgDriveCard(),
                OrgDriveCard(),
                OrgDriveCard(),
                OrgDriveCard(),
                OrgDriveCard(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
