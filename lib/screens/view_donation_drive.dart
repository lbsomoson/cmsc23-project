import 'package:flutter/material.dart';
import 'package:project/widgets/button.dart';
import 'package:project/widgets/divider.dart';
import 'package:project/widgets/donor_card.dart';
import 'package:project/widgets/summary.dart';
import 'package:project/widgets/text2.dart';
import 'package:project/widgets/text3.dart';
import 'package:project/widgets/text4.dart';

class ViewOrgDonationDrive extends StatefulWidget {
  const ViewOrgDonationDrive({super.key});

  @override
  State<ViewOrgDonationDrive> createState() => _ViewOrgDonationDriveState();
}

class _ViewOrgDonationDriveState extends State<ViewOrgDonationDrive> {
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
          content: const Text(
              "Are you sure you want to delete this donation drive?"),
          actions: [
            TextButton(
              child: const Text("OK"),
              onPressed: () {
                Navigator.pop(context);
                final snackBar = SnackBar(
                  backgroundColor: const Color.fromARGB(255, 245, 88, 77),
                  content:
                      const Text('Deleted Organization Drive successfully!'),
                  action: SnackBarAction(label: 'Close', onPressed: () {}),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Column(
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
                        const Text("Help Animal Sanctuary",
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: Color.fromRGBO(22, 57, 30, 1),
                            )),
                        const Text3Widget(
                          size: 16,
                          text1: "Mama's Cradle Animal Sanctuary",
                          text2: 1 > 1 ? "• 4 days left" : "• 1 day left",
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text2Widget(
                            text:
                                "Lorem ipsum dolor sit amet, consectetur  adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in",
                            style: 'body'),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text4Widget(
                            text1: "by", text2: "Cats of UPLB", size: 16),
                        // SizedBox(
                        //   height: 10,
                        // ),
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
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              DonorCard(name: "Donor Name"),
                              DonorCard(name: "Donor Name"),
                              DonorCard(name: "Donor Name"),
                            ],
                          ),
                        ),
                        // TODO: CHECK USER TYPE IF ORGANIZATION OR ADMIN, DISPLAY BUTTONS IF ORGANIZATION
                        const DividerWidget(),
                        const SizedBox(
                          height: 5,
                        ),
                        ButtonWidget(
                            handleClick: () {
                              Navigator.pushNamed(
                                  context, '/organization-edit-drive');
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
