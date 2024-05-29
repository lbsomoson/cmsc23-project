import 'package:flutter/material.dart';
import 'package:project/widgets/text3.dart';

class DonationDriveCard extends StatefulWidget {
  const DonationDriveCard({super.key});

  @override
  State<DonationDriveCard> createState() => _DonationDriveCardState();
}

class _DonationDriveCardState extends State<DonationDriveCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
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
                    Text3Widget(
                      size: 14,
                      text1: 21.toString(),
                      text2: 21 > 1 ? "donors" : "donor",
                    ),
                    Text3Widget(
                      size: 14,
                      text1: 4.toString(),
                      text2: 4 > 1 ? "days left" : "day left",
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
