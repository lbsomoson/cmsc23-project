import 'package:flutter/material.dart';
import 'package:project/screens/view_donation.dart';
import 'package:project/widgets/text2.dart';

class DonationCard extends StatelessWidget {
  final String donationId;
  const DonationCard({required this.donationId, super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return ViewDonation(donationId: donationId);
        }));
      },
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
                      'assets/images/juan.jpg',
                      fit: BoxFit.cover,
                    )),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Juan Dela Cruz",
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Color.fromRGBO(22, 57, 30, 1),
                        )),
                    const SizedBox(height: 5),
                    Row(
                      children: [
                        Icon(Icons.calendar_month_rounded,
                            color: Theme.of(context).colorScheme.primary,
                            size: 20),
                        const SizedBox(
                          width: 5,
                        ),
                        const Text2Widget(text: "May 31, 2021", style: "body3")
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
                        const Text2Widget(text: "09954695022", style: "body3")
                      ],
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
