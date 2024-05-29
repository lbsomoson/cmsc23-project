import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:project/models/organization_model.dart';
import 'package:project/providers/admin_provider.dart';
import 'package:project/widgets/appbar_title.dart';
import 'package:project/widgets/org_application_card.dart';
import 'package:project/widgets/text2.dart';
import 'package:provider/provider.dart';

class ViewOrgApplications extends StatefulWidget {
  const ViewOrgApplications({super.key});

  @override
  State<ViewOrgApplications> createState() => _ViewOrgApplicationsState();
}

class _ViewOrgApplicationsState extends State<ViewOrgApplications> {
  Stream<QuerySnapshot>? _organizationsToApproveStream;

  @override
  Widget build(BuildContext context) {
    _organizationsToApproveStream =
        context.watch<AdminProvider>().getOrganizationsToApprove();
    return Scaffold(
      appBar: AppBar(
        title: const AppBarTitle(title: "Organization Applications"),
      ),
      body: SafeArea(
        child: StreamBuilder<QuerySnapshot>(
          stream: _organizationsToApproveStream,
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
                child: Text("No organizations to approve found"),
              );
            } else if (snapshot.data!.docs.isEmpty) {
              return const Center(
                  child: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text2Widget(
                          text: "No organizations to approve yet",
                          style: 'body3')
                    ]),
              ));
            }
            return GridView.builder(
              padding: EdgeInsets.zero,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 0,
                crossAxisSpacing: 0,
                childAspectRatio: 0.61,
              ),
              itemCount: snapshot.data?.docs.length,
              itemBuilder: (BuildContext context, int index) {
                Organization org = Organization.fromJson(
                  snapshot.data?.docs[index].data() as Map<String, dynamic>,
                );
                return OrgApplicationCard(org: org);
              },
            );
          },
        ),
      ),
    );
  }
}
