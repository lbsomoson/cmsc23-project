import 'package:flutter/material.dart';
import 'package:project/models/organization_model.dart';
import 'package:project/providers/admin_provider.dart';
import 'package:project/screens/view_organization.dart';
import 'package:project/widgets/text3.dart';
import 'package:provider/provider.dart';

class OrgCard extends StatefulWidget {
  final Organization org;
  const OrgCard({required this.org, super.key});

  @override
  State<OrgCard> createState() => _OrgCardState();
}

class _OrgCardState extends State<OrgCard> {
  Future<int>? _donationDrivesCount, _donationsCount;
  @override
  Widget build(BuildContext context) {
    _donationDrivesCount = context
        .watch<AdminProvider>()
        .getDonationDrivesCountByOrgId(widget.org.organizationId!);
    _donationsCount = context
        .watch<AdminProvider>()
        .getDonationsCountByOrgId(widget.org.organizationId!);
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return ViewOrganizationScreen(org: widget.org);
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
              child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                  ),
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: Image.asset(
                      'assets/images/org logo.jpg',
                      fit: BoxFit.cover,
                    ),
                  )),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.org.name,
                      style: const TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Color.fromRGBO(22, 57, 30, 1),
                      ),
                    ),
                    const Text3Widget(
                      size: 14,
                      text1: "Category of Organization",
                      text2: "",
                    ),
                    const SizedBox(height: 10),
                    FutureBuilder<int>(
                      future: _donationDrivesCount,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const CircularProgressIndicator();
                        }
                        if (snapshot.hasError) {
                          return Text('Error: ${snapshot.error}');
                        }
                        final int donationDrivesCount = snapshot.data!;
                        return Text3Widget(
                          size: 14,
                          text1: donationDrivesCount.toString(),
                          text2: donationDrivesCount > 1 &&
                                  donationDrivesCount != 0
                              ? "donation drives"
                              : "donation drive",
                        );
                      },
                    ),
                    FutureBuilder<int>(
                      future: _donationsCount,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const CircularProgressIndicator();
                        }
                        if (snapshot.hasError) {
                          return Text('Error: ${snapshot.error}');
                        }
                        final int donationsCount = snapshot.data!;
                        return Text3Widget(
                          size: 14,
                          text1: donationsCount.toString(),
                          text2: donationsCount > 1 && donationsCount != 0
                              ? "donors"
                              : "donor",
                        );
                      },
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
