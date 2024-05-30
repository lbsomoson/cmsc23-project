import 'package:flutter/material.dart';
import 'package:project/models/donation_drive_model.dart';
import 'package:project/screens/view_donation_drive.dart';
import 'package:project/widgets/text3.dart';
import 'package:transparent_image/transparent_image.dart';

class DonationDriveCard extends StatefulWidget {
  final DonationDrive drive;
  const DonationDriveCard({required this.drive, super.key});

  @override
  State<DonationDriveCard> createState() => _DonationDriveCardState();
}

class _DonationDriveCardState extends State<DonationDriveCard> {
  int _computeDaysLeft() {
    final now = DateTime.now();
    final difference = widget.drive.date.difference(now);
    return difference.inDays;
  }

  @override
  Widget build(BuildContext context) {
    final daysLeft = _computeDaysLeft();

    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ViewOrgDonationDrive(drive: widget.drive),
          ),
        );
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
                  child: FadeInImage.memoryNetwork(
                    placeholder: kTransparentImage,
                    image: widget.drive.photoUrl,
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 28),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.drive.title,
                        maxLines: 1,
                        style: const TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Color.fromRGBO(22, 57, 30, 1),
                        )),
                    const SizedBox(height: 5),
                    Text3Widget(
                      size: 14,
                      text1: widget.drive.donationIds!.length.toString(),
                      text2: 21 > 1 ? "donors" : "donor",
                    ),
                    Text3Widget(
                      size: 14,
                      text1: daysLeft.toString(),
                      text2: daysLeft > 1 ? "days left" : "day left",
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
