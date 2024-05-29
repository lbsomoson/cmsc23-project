import 'package:flutter/material.dart';
import 'package:project/widgets/divider.dart';
import 'package:project/widgets/donation_drive_card.dart';
import 'package:project/widgets/text2.dart';
import 'package:project/widgets/text3.dart';

class ViewOrganizationScreen extends StatefulWidget {
  const ViewOrganizationScreen({super.key});

  @override
  State<ViewOrganizationScreen> createState() => _ViewOrganizationScreenState();
}

class _ViewOrganizationScreenState extends State<ViewOrganizationScreen> {
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
                        const Text("Cats of UPLB",
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: Color.fromRGBO(22, 57, 30, 1),
                            )),
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
                                "Lorem ipsum dolor sit amet, consectetur  adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in",
                            style: 'body'),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Icon(Icons.email,
                                color: Theme.of(context).colorScheme.primary,
                                size: 20),
                            const SizedBox(
                              width: 5,
                            ),
                            const Text2Widget(
                                text: "organization@email.org", style: "body3")
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Icon(Icons.phone,
                                color: Theme.of(context).colorScheme.primary,
                                size: 20),
                            const SizedBox(
                              width: 5,
                            ),
                            const Text2Widget(
                                text: "09954695022", style: "body3")
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Icon(Icons.location_on,
                                color: Theme.of(context).colorScheme.primary,
                                size: 20),
                            const SizedBox(
                              width: 5,
                            ),
                            const Text2Widget(
                                text: "Los Baños, Laguna", style: "body3")
                          ],
                        ),
                        const DividerWidget(),
                        const Text2Widget(
                            text: "Donation Drives", style: "sectionHeader"),
                        const SizedBox(
                          height: 10,
                        ),
                        // TODO: SHOW DONATION DRIVE CARDS
                        DonationDriveCard(),
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
