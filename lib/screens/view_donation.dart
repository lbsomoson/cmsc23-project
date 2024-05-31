import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project/models/donation_model.dart';
import 'package:project/providers/admin_provider.dart';
import 'package:project/providers/auth_provider.dart';
import 'package:project/widgets/appbar_title.dart';
import 'package:project/widgets/button.dart';
import 'package:project/widgets/image_upload2.dart';
import 'package:project/widgets/text2.dart';
import 'package:project/widgets/textfield.dart';
import 'package:provider/provider.dart';

class ViewDonation extends StatefulWidget {
  final String donationId;
  const ViewDonation({required this.donationId, super.key});

  @override
  State<ViewDonation> createState() => _ViewDonationState();
}

class _ViewDonationState extends State<ViewDonation> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    User? user = context.read<UserAuthProvider>().user;

    // Check if user is null
    if (user == null) {
      return Scaffold(
        appBar: AppBar(
          title: const AppBarTitle(title: "Donor Name"),
          iconTheme:
              IconThemeData(color: Theme.of(context).colorScheme.primary),
        ),
        body: const Center(
          child: Text('User not found. Please login.'),
        ),
      );
    }

    Future<Map<String, dynamic>> donation =
        context.watch<AdminProvider>().getDonation(user.uid);

    return Scaffold(
      appBar: AppBar(
        // TODO: UPDATE NAME OF DONOR
        title: const AppBarTitle(title: "Donor Name"),
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
                    FutureBuilder<Map<String, dynamic>>(
                      future: donation,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                              child: CircularProgressIndicator());
                        } else if (snapshot.hasError) {
                          return Text('Error: ${snapshot.error}');
                        } else if (snapshot.hasData) {
                          Map<String, dynamic> d = snapshot.data!;
                          return Column(
                            children: [
                              const SizedBox(height: 10),
                              const Text2Widget(
                                text: "Choose items to donate",
                                style: "titleSmall",
                              ),
                              const SizedBox(height: 10),
                              TextFieldWidget(
                                disabled: true,
                                callback: () {},
                                hintText: "Weight",
                                type: "Number",
                                label: "Weight of items to donate in kg/lbs",
                                isRequired: true,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text2Widget(
                                  text: "Upload Image", style: "sectionHeader"),
                              const SizedBox(
                                height: 10,
                              ),
                              // ImageUpload2Widget(
                              //   callBack: () {},
                              // ),
                              const SizedBox(
                                height: 20,
                              ),
                              TextFieldWidget(
                                disabled: true,
                                callback: () {},
                                hintText: "Address",
                                type: "String",
                                label: "Address",
                                isRequired: true,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              TextFieldWidget(
                                disabled: true,
                                callback: () {},
                                hintText: "Contact Number",
                                type: "Number",
                                label: "Contact Number",
                                isRequired: true,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              ButtonWidget(
                                  handleClick: () {},
                                  block: true,
                                  label: "Approve",
                                  style: 'filled'),
                              const SizedBox(
                                height: 20,
                              ),
                            ],
                          );
                        } else {
                          return const Text('No data found');
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
