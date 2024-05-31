import 'package:flutter/material.dart';
import 'package:project/models/donation_drive_model.dart';
import 'package:project/models/organization_model.dart';
import 'package:project/providers/admin_provider.dart';
import 'package:project/widgets/text2.dart';

import 'buttonSmall.dart';
import 'package:project/providers/admin_provider.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DonorViewHelp extends StatefulWidget {
  final DonationDrive donationDrive;
  final Organization org;
  const DonorViewHelp(
      {required this.org, required this.donationDrive, super.key});

  @override
  State<DonorViewHelp> createState() => _DonorViewHelp();
}

class _DonorViewHelp extends State<DonorViewHelp> {
  Future<int>? _drivesCount;
  @override
  Widget build(BuildContext context) {
    _drivesCount = context
        .watch<AdminProvider>()
        .getDonationDrivesCountByOrgId(widget.org.organizationId!);
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
                    child: Image.network(
                      widget.donationDrive.photoUrl,
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
                    Text(widget.donationDrive.title,
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
                        Text2Widget(
                            text: widget.donationDrive.donationIds!.length
                                .toString(),
                            style: "body5")
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
