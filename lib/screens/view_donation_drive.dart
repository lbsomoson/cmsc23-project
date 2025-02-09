import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project/models/donation_drive_model.dart';
import 'package:project/providers/admin_provider.dart';
import 'package:project/providers/auth_provider.dart';
import 'package:project/providers/org_provider.dart';
import 'package:project/screens/organization/org_edit_donation_drive.dart';
import 'package:project/widgets/button.dart';
import 'package:project/widgets/divider.dart';
import 'package:project/widgets/donor_card.dart';
import 'package:project/widgets/radio.dart';
import 'package:project/widgets/summary.dart';
import 'package:project/widgets/text2.dart';
import 'package:project/widgets/text3.dart';
import 'package:project/widgets/text4.dart';
import 'package:provider/provider.dart';
import 'package:transparent_image/transparent_image.dart';

class ViewOrgDonationDrive extends StatefulWidget {
  final DonationDrive drive;
  const ViewOrgDonationDrive({required this.drive, super.key});

  @override
  State<ViewOrgDonationDrive> createState() => _ViewOrgDonationDriveState();
}

class _ViewOrgDonationDriveState extends State<ViewOrgDonationDrive> {
  int _computeDaysLeft() {
    final now = DateTime.now();
    final difference = widget.drive.date.difference(now);
    return difference.inDays;
  }

  void _showDeleteDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          contentTextStyle: TextStyle(
            color: Colors.grey[800],
            fontWeight: FontWeight.w500,
            decoration: TextDecoration.none,
            fontSize: 16,
          ),
          title: const Text("Delete?"),
          content:
              Text("Are you sure you want to delete ${widget.drive.title}?"),
          actions: [
            TextButton(
              child: const Text("OK"),
              onPressed: () {
                context
                    .read<OrgProvider>()
                    .deleteDonationDrive(widget.drive.driveId!);
                final snackBar = SnackBar(
                  backgroundColor: const Color.fromARGB(255, 245, 88, 77),
                  content: const Text('Deleted drive successfully!'),
                  action: SnackBarAction(label: 'Close', onPressed: () {}),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);

                // TODO: FIX NAVIGATION AFTER DELETION
                Navigator.pop(context);
              },
            ),
            TextButton(
              child: const Text("CANCEL"),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  void _showLinkDonationDrive(context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 10, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text2Widget(
                      text: "Link this to a donation drive", style: 'body'),
                  CustomRadios(callback: () {})
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    User? user = context.watch<UserAuthProvider>().user;
    final daysLeft = _computeDaysLeft();

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Column(
                children: [
                  FadeInImage.memoryNetwork(
                    placeholder: kTransparentImage,
                    image: widget.drive.photoUrl,
                    fit: BoxFit.cover,
                    height: 200,
                    width: double.infinity,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(widget.drive.title,
                            style: const TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: Color.fromRGBO(22, 57, 30, 1),
                            )),
                        Text3Widget(
                          size: 16,
                          text1: widget.drive.recipient,
                          text2: daysLeft > 1
                              ? "• $daysLeft days left"
                              : "• $daysLeft day left",
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text2Widget(text: widget.drive.plan, style: 'body'),
                        const SizedBox(
                          height: 10,
                        ),
                        FutureBuilder<Map<String, dynamic>>(
                          future: context
                              .read<AdminProvider>()
                              .getOrganization(widget.drive.organizationId),
                          builder: (context, snapshot) {
                            if (snapshot.hasError) {
                              return const Text(
                                  'Error loading organization name');
                            }
                            final organization = snapshot.data;
                            return Text4Widget(
                                text1: "by",
                                text2: organization?['name'] ?? '',
                                size: 16);
                          },
                        ),
                        const DividerWidget(),
                        const Text2Widget(
                            text: "Summary", style: "sectionHeader"),
                        const SizedBox(
                          height: 10,
                        ),
                        const SummaryWidget(),
                        const DividerWidget(),
                        const Text2Widget(
                            text: "Recent Donors", style: "sectionHeader"),

                        widget.drive.donationIds != null &&
                                widget.drive.donationIds!.isNotEmpty &&
                                widget.drive.donationIds!.length <= 3
                            ? Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    for (int i = 0;
                                        i < 3 ||
                                            i <
                                                widget
                                                    .drive.donationIds!.length;
                                        i++)
                                      FutureBuilder<Map<String, dynamic>>(
                                        future: context
                                            .read<AdminProvider>()
                                            .getDonor(
                                                widget.drive.donationIds![i]),
                                        builder: (context, snapshot) {
                                          if (snapshot.connectionState ==
                                              ConnectionState.waiting) {
                                            return const CircularProgressIndicator();
                                          }
                                          if (snapshot.hasError) {
                                            return const Text(
                                                'Error loading donor');
                                          }
                                          final donorData = snapshot.data!;
                                          return DonorCard(
                                              name: donorData['name']);
                                        },
                                      ),
                                  ],
                                ),
                              )
                            : const Text2Widget(
                                text: "No donations yet", style: 'body3'),

                        // TODO: CHECK USER TYPE, ONLY DISPLAY BUTTONS IF USERTYPE IS ORGANIZATION
                        // TODO: SAVE USERTYPE TO PROVIDER
                        FutureBuilder<Map<String, dynamic>>(
                          future: context
                              .watch<UserAuthProvider>()
                              .getUserDetails(user!.uid),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const CircularProgressIndicator();
                            }
                            if (snapshot.hasError) {
                              return const Text(
                                  'Error loading organization name');
                            }
                            final user = snapshot.data;
                            if (user?['type'] == 'organization') {
                              return Column(
                                children: [
                                  const DividerWidget(),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  ButtonWidget(
                                      handleClick: () {
                                        Navigator.push(context,
                                            MaterialPageRoute(
                                                builder: (context) {
                                          return OrgEditDonationDriveScreen(
                                              drive: widget.drive);
                                        }));
                                      },
                                      block: true,
                                      label: "Edit",
                                      style: 'filled'),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  ButtonWidget(
                                      handleClick: () {
                                        _showDeleteDialog(context);
                                      },
                                      block: true,
                                      label: "Delete",
                                      style: 'outlined'),
                                ],
                              );
                            } else {
                              return Container();
                            }
                          },
                        ),
                        ButtonWidget(
                            handleClick: () {
                              _showLinkDonationDrive(context);
                            },
                            block: true,
                            label: 'Link Donation Drive',
                            style: 'filled')
                      ],
                    ),
                  ),
                ],
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
      ),
    );
  }
}
