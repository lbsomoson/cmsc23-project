import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:project/models/organization_model.dart';
import 'package:project/providers/admin_provider.dart';
import 'package:project/widgets/appbar_title.dart';
import 'package:project/widgets/org_card.dart';
import 'package:project/widgets/text2.dart';
import 'package:provider/provider.dart';

class AdminViewOrgsScreen extends StatefulWidget {
  const AdminViewOrgsScreen({super.key});

  @override
  State<AdminViewOrgsScreen> createState() => _AdminViewOrgsScreenState();
}

class _AdminViewOrgsScreenState extends State<AdminViewOrgsScreen> {
  @override
  Widget build(BuildContext context) {
    Stream<QuerySnapshot> organizationsStream =
        context.watch<AdminProvider>().getOrganizations();
    return Scaffold(
        appBar: AppBar(
          title: const AppBarTitle(title: "Organization List"),
        ),
        body: SafeArea(
            child: StreamBuilder(
                stream: organizationsStream,
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
                                    text: "No organizations yet",
                                    style: 'body2'))
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
                        return OrgCard(org: org);
                      });
                })));
  }
}
