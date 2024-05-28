import 'package:flutter/material.dart';
import 'package:project/widgets/appbar_title.dart';
import 'package:project/widgets/org_application_card.dart';

class ViewOrgApplications extends StatefulWidget {
  const ViewOrgApplications({super.key});

  @override
  State<ViewOrgApplications> createState() => _ViewOrgApplicationsState();
}

class _ViewOrgApplicationsState extends State<ViewOrgApplications> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AppBarTitle(title: "Organization Applications"),
      ),
      body: SafeArea(
        child: GridView.builder(
          padding: EdgeInsets.zero,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 0,
            crossAxisSpacing: 0,
            childAspectRatio: 0.61,
          ),
          itemCount: 5,
          itemBuilder: (BuildContext context, int index) {
            // return const OrgApplicationCard();
          },
        ),
      ),
    );
  }
}
