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
    'file': null, // Initialize file as null
    'photoUrl': '',
  };
  String? errorMessage, errorMessage2;
  bool showImageUploadMessage = false, showDateMessage = false;

  Widget get imageUploadMessage => Padding(
        padding: const EdgeInsets.only(bottom: 30),
        child: Text(
          errorMessage!,
          style: const TextStyle(
              color: Colors.red, fontSize: 14, fontWeight: FontWeight.w400),
        ),
      );

  Widget get noDateMessage => Padding(
        padding: const EdgeInsets.only(bottom: 30),
        child: Text(
          errorMessage2!,
          style: const TextStyle(
              color: Colors.red, fontSize: 14, fontWeight: FontWeight.w400),
        ),
      );

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

      if (donationDrive['date'] == '') {
        setState(() {
          errorMessage2 = "Add a date";
          showDateMessage = true;
        });
        return;
      }

      if ((donationDrive['file'] == null || donationDrive['file'] == '') &&
          donationDrive['path'] == '') {
        setState(() {
          errorMessage = "Upload your image";
          showImageUploadMessage = true;
        });
        return;
      }

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
          file: donationDrive['file'],
          donationDeliveryProof: donationDrive[
              'donationDeliveryProof']); // upon creation, set status to open

      await context.read<OrgProvider>().addDonationDrive(newDonationDrive);

      final snackBar = SnackBar(
        content: const Text('Successfully added donation drive!'),
        action: SnackBarAction(label: 'Close', onPressed: () {}),
      );

      // TODO: FIX NAVIGATION AFTER ADDING A DONATION DRIVE
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        // Navigator.pop(context);
        // Navigator.pushReplacementNamed(context, '/organization-drives');
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
                      setState(() {
                        showDateMessage = false;
                      })
                    },
                    hintText: "Date of Expiration",
                    isRequired: true,
                    label: "Date of Expiration",
                  ),
                  showDateMessage
                      ? Column(
                          children: [
                            const SizedBox(
                              height: 5,
                            ),
                            noDateMessage,
                          ],
                        )
                      : Container(),
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
                      setState(() {
                        showImageUploadMessage = false;
                      })
                    },
                  ),
                  showImageUploadMessage
                      ? Column(
                          children: [
                            const SizedBox(
                              height: 5,
                            ),
                            imageUploadMessage,
                          ],
                        )
                      : Container(),
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
