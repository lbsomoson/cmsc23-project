import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
                  const Padding(
                    padding: EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Help Animal Sanctuary",
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: Color.fromRGBO(22, 57, 30, 1),
                            )),
                        Text3Widget(
                          size: 16,
                          text1: "Mama's Cradle Animal Sanctuary",
                          text2: 1 > 1 ? "• 4 days left" : "• 1 day left",
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text2Widget(
                            text:
                                "Lorem ipsum dolor sit amet, consectetur  adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in",
                            style: 'body'),
                        SizedBox(
                          height: 10,
                        ),
                        Text4Widget(
                            text1: "by", text2: "Cats of UPLB", size: 16),
                        // SizedBox(
                        //   height: 10,
                        // ),
                        DividerWidget(),
                        Text2Widget(text: "Summary", style: "sectionHeader"),
                        SizedBox(
                          height: 10,
                        ),
                        SummaryWidget(),
                        DividerWidget(),
                        Text2Widget(
                            text: "Recent Donors", style: "sectionHeader"),
                        Padding(
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
