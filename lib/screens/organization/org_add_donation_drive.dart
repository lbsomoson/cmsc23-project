import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project/providers/auth_provider.dart';
import 'package:project/providers/org_provider.dart';
import 'package:project/widgets/appbar_title.dart';
import 'package:project/widgets/button.dart';
import 'package:project/widgets/datepicker.dart';
import 'package:project/widgets/divider.dart';
import 'package:project/widgets/image_upload2.dart';
import 'package:project/widgets/text2.dart';
import 'package:project/widgets/textfield.dart';
import 'package:provider/provider.dart';

import '../../models/donation_drive_model.dart';

class OrgAddDonationDriveScreen extends StatefulWidget {
  const OrgAddDonationDriveScreen({super.key});

  @override
  State<OrgAddDonationDriveScreen> createState() =>
      _OrgAddDonationDriveScreenState();
}

class _OrgAddDonationDriveScreenState extends State<OrgAddDonationDriveScreen> {
  final _formKey = GlobalKey<FormState>();
  late Map<String, dynamic> donationDrive = {
    'driveId': '',
    'organizationId': '',
    'donationIds': <String>[],
    'title': '',
    'recipient': '',
    'plan': '',
    'status': '',
    'date': '',
    'donationDeliveryProof': '',
    'path': '',
    'file': '',
    'photoUrl': '',
  };

  void handleAddClick(String id) async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState?.save();

      DateTime? parsedDate;
      List<String> dateParts = donationDrive['date'].split('/');
      if (dateParts.length == 3) {
        int month = int.parse(dateParts[0]);
        int day = int.parse(dateParts[1]);
        int year = int.parse(dateParts[2]);
        parsedDate = DateTime(year, month, day);
      }

      print(donationDrive['donationIds']);
      print(donationDrive['recipient']);
      print(donationDrive['title']);
      print(donationDrive['plan']);
      print(parsedDate);
      print(donationDrive['photoUrl']);
      print(donationDrive['path']);
      print(donationDrive['file']);

      DonationDrive newDonationDrive = DonationDrive(
          organizationId: id,
          donationIds: donationDrive['donationIds'],
          recipient: donationDrive['recipient'],
          title: donationDrive['title'],
          plan: donationDrive['plan'],
          date: parsedDate!,
          status: 'open',
          photoUrl: donationDrive['photoUrl'],
          path: donationDrive['path'],
          file: donationDrive['file']); // upon creation, set status to open

      await context.read<OrgProvider>().addDonationDrive(newDonationDrive);

      final snackBar = SnackBar(
        content: const Text('Successfully added donation drive!'),
        action: SnackBarAction(label: 'Close', onPressed: () {}),
      );

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    User? user = context.watch<UserAuthProvider>().user;
    return Scaffold(
      appBar: AppBar(
        title: const AppBarTitle(title: "Create Donation Drive"),
        iconTheme: IconThemeData(color: Theme.of(context).colorScheme.primary),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
            child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 12),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text2Widget(text: "Details", style: "sectionHeader"),
                  TextFieldWidget(
                    callback: (String val) => donationDrive['title'] = val,
                    hintText: "Title",
                    type: "String",
                    label: "Title",
                    isRequired: true,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFieldWidget(
                    callback: (String val) => donationDrive['recipient'] = val,
                    hintText: "Name of Recipient",
                    type: "String",
                    label: "Name of Recipient",
                    isRequired: true,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFieldWidget(
                    callback: (String val) => donationDrive['plan'] = val,
                    hintText: "Usage Plan",
                    type: "String",
                    maxLines: 5,
                    label: "Usage Plan",
                    isRequired: true,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  DatePickerWidget(
                    callback: (String val) => {
                      donationDrive['date'] = val,
                    },
                    hintText: "Date of Expiration",
                    isRequired: true,
                    label: "Date of Expiration",
                  ),
                  const DividerWidget(),
                  const Text2Widget(
                      text: "Upload Image", style: "sectionHeader"),
                  const SizedBox(
                    height: 10,
                  ),
                  ImageUpload2Widget(
                    callBack: (String path, File file) => {
                      donationDrive['file'] = file,
                      donationDrive['path'] = path,
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ButtonWidget(
                      handleClick: () {
                        handleAddClick(user!.uid);
                      },
                      block: true,
                      label: "Add",
                      style: 'filled'),
                ],
              ),
            ),
          ),
        )),
      ),
    );
  }
}
