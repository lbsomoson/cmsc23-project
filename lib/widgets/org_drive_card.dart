import 'package:flutter/material.dart';
import 'package:project/models/donation_drive_model.dart';
import 'package:project/screens/view_donation_drive.dart';
import 'package:project/widgets/text3.dart';
import 'package:transparent_image/transparent_image.dart';

class OrgDriveCard extends StatefulWidget {
  final DonationDrive drive;
  const OrgDriveCard({required this.drive, super.key});

  @override
  State<OrgDriveCard> createState() => _OrgDriveCardState();
}

class _OrgDriveCardState extends State<OrgDriveCard> {
  @override
  Widget build(BuildContext context) {
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
                    )),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 22, horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.drive.title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        softWrap: true,
                        style: const TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Color.fromRGBO(22, 57, 30, 1),
                        )),
                    const SizedBox(height: 5),
                    const Text3Widget(
                      size: 14,
                      text1: "₱41",
                      text2: "fund raised",
                    ),
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
            ),
          ],
        ),
      ),
    );
  }
}
