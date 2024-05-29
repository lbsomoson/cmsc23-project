import 'package:flutter/material.dart';
import 'package:project/widgets/button.dart';
import 'package:project/widgets/text2.dart';

import '../screens/donor/donor_view_donation_drive.dart';
import 'buttonSmall.dart';

class DonorViewHelp extends StatelessWidget {
  const DonorViewHelp({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(color: Colors.grey[300]!),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              child: AspectRatio(
                aspectRatio: 1,
                child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                    ),
                    child: Image.asset(
                      'assets/images/dog.jpg',
                      fit: BoxFit.cover,
                    )),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Help Animal Sanctuary",
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Color.fromRGBO(22, 57, 30, 1),
                        )),
                    const SizedBox(height: 5),
                    Row(
                      children: [
                        const Text2Widget(text: "₱5,000", style: "body6"),
                        const SizedBox(
                          width: 5,
                        ),
                        const Text2Widget(
                            text: "fund raised from ₱7,000", style: "body5")
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        const Text2Widget(text: "21", style: "body6"),
                        const SizedBox(
                          width: 5,
                        ),
                        const Text2Widget(text: "donors", style: "body5")
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        const Text2Widget(text: "4", style: "body6"),
                        const SizedBox(
                          width: 5,
                        ),
                        const Text2Widget(text: "days left", style: "body5")
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    ButtonSmallWidget(
                      handleClick: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DonorViewDonationDrive()),
                        );
                      },
                      block: false,
                      label: "View",
                      style: 'outlined',
                      icon: Icon(Icons.visibility,
                          size: 16,
                          color: Theme.of(context).colorScheme.primary),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
