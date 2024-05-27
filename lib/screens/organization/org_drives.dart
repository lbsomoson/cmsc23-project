import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project/models/donation_drive_model.dart';
import 'package:project/providers/admin_provider.dart';
import 'package:project/providers/auth_provider.dart';
import 'package:project/widgets/appbar_title.dart';
import 'package:project/widgets/org_drive_card.dart';
import 'package:project/widgets/text2.dart';
import 'package:provider/provider.dart';

class OrgDonationDrivesScreen extends StatefulWidget {
  const OrgDonationDrivesScreen({super.key});

  @override
  State<OrgDonationDrivesScreen> createState() =>
      _OrgDonationDrivesScreenState();
}

class _OrgDonationDrivesScreenState extends State<OrgDonationDrivesScreen> {
  Stream<QuerySnapshot>? _donationDrivesStream;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    User? user = context.read<UserAuthProvider>().user;
    _donationDrivesStream =
        context.read<AdminProvider>().getDonationDrives(user!.uid);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AppBarTitle(title: "My Donation Drives"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/organization-add-drive');
        },
        tooltip: 'Add',
        shape: const CircleBorder(),
        child: const Icon(Icons.add),
      ),
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
          child: StreamBuilder(
            stream: _donationDrivesStream,
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Center(
                  child: Text("Error encountered! ${snapshot.error}"),
                );
              } else if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.data!.docs.isEmpty) {
                return Center(
                    child: Center(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.create_new_folder_rounded,
                          size: 150,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        const Text2Widget(
                            text: "No donation drives yet", style: 'bodyLarge')
                      ]),
                ));
              } else if (!snapshot.hasData) {
                return const Center(
                  child: Text("No donation drives Found"),
                );
              }
              return ListView.builder(
                  itemCount: snapshot.data?.docs.length,
                  itemBuilder: (context, index) {
                    DonationDrive drive = DonationDrive.fromJson(
                        snapshot.data?.docs[index].data()
                            as Map<String, dynamic>);
                    drive.driveId = snapshot.data?.docs[index].id;
                    return OrgDriveCard(drive: drive);
                  });
            },
          ),
        ),
      ),
    );
  }
}
