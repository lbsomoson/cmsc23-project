import 'package:flutter/material.dart';
import 'package:project/models/organization_model.dart';
import 'package:project/screens/donor/donor_orgview.dart';
import 'package:project/widgets/donation_card.dart';
import 'package:project/widgets/donor_bottom_navbar.dart';
import 'package:project/widgets/donor_card.dart';
import 'package:project/widgets/donor_org_card.dart';
import 'package:project/widgets/org_card.dart';
import 'package:project/widgets/text2.dart';

import '../../widgets/appbar_title.dart';
import '../../widgets/text.dart';
import 'package:project/providers/admin_provider.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DonorDashboardScreen extends StatefulWidget {
  const DonorDashboardScreen({Key? key}) : super(key: key);

  @override
  State<DonorDashboardScreen> createState() => _DonorDashboardScreenState();
}

class _DonorDashboardScreenState extends State<DonorDashboardScreen> {
  @override
  Widget build(BuildContext context) {
    Stream<QuerySnapshot> approvedOrganizationsStream =
        context.watch<AdminProvider>().getApprovedOrganizations();

    return Scaffold(
      appBar: AppBar(
        title: AppBarTitle(title: 'Donor Dashboard'),
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: StreamBuilder(
          stream: approvedOrganizationsStream,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text("Error encountered! ${snapshot.error}"),
              );
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (!snapshot.hasData) {
              return const Center(
                child: Text2Widget(
                  text: "No Organizations Found",
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
                              text: "No organizations yet", style: 'body2'))
                    ]),
              ));
            }
            return ListView.builder(
                itemCount: snapshot.data?.docs.length,
                itemBuilder: (context, index) {
                  Organization org = Organization.fromJson(
                      snapshot.data?.docs[index].data()
                          as Map<String, dynamic>);
                  org.organizationId = snapshot.data?.docs[index].id;
                  return DonorOrgCard(org: org);
                });
          },
        ),
      ),
    );
  }
}
