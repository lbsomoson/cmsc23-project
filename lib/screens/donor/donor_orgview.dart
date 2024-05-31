import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:project/models/donation_drive_model.dart';
import 'package:project/models/organization_model.dart';
import 'package:project/providers/admin_provider.dart';
import 'package:project/widgets/divider.dart';
import 'package:project/widgets/donor_org_info.dart';
import 'package:project/widgets/donor_view_help.dart';
import 'package:project/widgets/text2.dart';
import '../../widgets/appbar_title.dart';
import 'donor_donation_form.dart';
import 'package:project/providers/admin_provider.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DonorOrgView extends StatefulWidget {
  final Organization org;
  const DonorOrgView({required this.org, super.key});

  @override
  State<DonorOrgView> createState() => _DonorOrgViewState();
}

class _DonorOrgViewState extends State<DonorOrgView> {
  @override
  Widget build(BuildContext context) {
    Stream<QuerySnapshot> donationDriveStream = context
        .watch<AdminProvider>()
        .getDonationDrives(widget.org.organizationId!);
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DonorDonationForm(
                      org: widget.org,
                    )),
          );
        },
        label: Text("Donate Now!"),
        backgroundColor: Color.fromRGBO(62, 218, 134, 1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        extendedPadding: EdgeInsets.all(16),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Container(
                    width: double.infinity,
                    height: 224,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: true
                            ? NetworkImage(widget.org.photoUrl)
                            : AssetImage('assets/images/noImageAvailable.png')
                                as ImageProvider,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ),
                  SizedBox(height: 5),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: DonorOrgInfo(
                      org: widget.org,
                    ),
                  ),
                  DividerWidget(),
                  StreamBuilder(
                    stream: donationDriveStream,
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Center(
                          child: Text("Error encountered! ${snapshot.error}"),
                        );
                      } else if (snapshot.connectionState ==
                          ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (!snapshot.hasData) {
                        return const Center(
                          child: Text2Widget(
                            text: "No Donation Drives Found",
                            style: 'body3',
                          ),
                        );
                      } else if (snapshot.data!.docs.isEmpty) {
                        return const Center(
                            child: Center(
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Center(
                                    child: Text2Widget(
                                        text: "No Donation Drives yet",
                                        style: 'body2'))
                              ]),
                        ));
                      }
                      return Container(
                        height: MediaQuery.of(context).size.height,
                        child: ListView.builder(
                            itemCount: snapshot.data?.docs.length,
                            itemBuilder: (context, index) {
                              DonationDrive drive = DonationDrive.fromJson(
                                  snapshot.data?.docs[index].data()
                                      as Map<String, dynamic>);
                              drive.driveId = snapshot.data?.docs[index].id;
                              return DonorViewHelp(
                                  donationDrive: drive, org: widget.org);
                            }),
                      );
                    },
                  ),
                ],
              ),
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
    );
  }
}
