import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:project/models/donation_drive_model.dart';
import 'package:project/models/organization_model.dart';
import 'package:project/providers/admin_provider.dart';
import 'package:project/widgets/divider.dart';
import 'package:project/widgets/donation_drive_card.dart';
import 'package:project/widgets/text2.dart';
import 'package:project/widgets/text3.dart';
import 'package:provider/provider.dart';

class ViewOrganizationScreen extends StatefulWidget {
  final Organization org;
  const ViewOrganizationScreen({required this.org, super.key});

  @override
  State<ViewOrganizationScreen> createState() => _ViewOrganizationScreenState();
}

class _ViewOrganizationScreenState extends State<ViewOrganizationScreen> {
  Stream<QuerySnapshot>? donationDrivesById;

  @override
  Widget build(BuildContext context) {
    donationDrivesById = context
        .watch<AdminProvider>()
        .getDonationDrivesByOrgId(widget.org.organizationId!);

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    'assets/images/dog.jpg',
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: 200,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.org.name,
                          style: const TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: Color.fromRGBO(22, 57, 30, 1),
                          ),
                        ),
                        const Text3Widget(
                          size: 16,
                          text1: "Organization Category",
                          text2: "",
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text2Widget(
                          maxLines: 10,
                          text:
                              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in",
                          style: 'body',
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.email,
                              color: Theme.of(context).colorScheme.primary,
                              size: 20,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text2Widget(
                              text: widget.org.email,
                              style: "body3",
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.phone,
                              color: Theme.of(context).colorScheme.primary,
                              size: 20,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text2Widget(
                              text: widget.org.contactNumber,
                              style: "body3",
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.location_on,
                              color: Theme.of(context).colorScheme.primary,
                              size: 20,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: widget.org.addresses
                                  .map(
                                    (address) => Text2Widget(
                                      text: address,
                                      style: 'body3',
                                    ),
                                  )
                                  .toList(),
                            ),
                          ],
                        ),
                        const DividerWidget(),
                        const Text2Widget(
                          text: "Donation Drives",
                          style: "sectionHeader",
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        StreamBuilder(
                          stream: donationDrivesById,
                          builder: (context, snapshot) {
                            if (snapshot.hasError) {
                              return Center(
                                child: Text(
                                    "Error encountered! ${snapshot.error}"),
                              );
                            } else if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            } else if (!snapshot.hasData ||
                                snapshot.data!.docs.isEmpty) {
                              return Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.create_new_folder_rounded,
                                      size: 150,
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                    ),
                                    const Text2Widget(
                                      text: "No donation drives yet",
                                      style: 'bodyLarge',
                                    )
                                  ],
                                ),
                              );
                            }
                            return Column(
                              children: snapshot.data!.docs.map((doc) {
                                DonationDrive drive = DonationDrive.fromJson(
                                  doc.data() as Map<String, dynamic>,
                                );
                                drive.driveId = doc.id;
                                return DonationDriveCard(
                                  driveId: drive.driveId!,
                                );
                              }).toList(),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                leading: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      icon: Icon(Icons.arrow_back,
                          color: Theme.of(context).colorScheme.primary),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
