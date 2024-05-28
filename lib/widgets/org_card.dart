import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project/models/organization_model.dart';
import 'package:project/providers/admin_provider.dart';
import 'package:project/providers/auth_provider.dart';
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
    User? user = context.watch<UserAuthProvider>().user;
    _donationDrivesCount =
        context.watch<AdminProvider>().getDonationDrivesCountByOrgId(user!.uid);
    _donationsCount =
        context.watch<AdminProvider>().getDonationsCountByOrgId(user.uid);
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, '/admin-view-organizations');
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
