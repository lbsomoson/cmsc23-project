import 'package:flutter/material.dart';
import 'package:project/widgets/appbar_title.dart';
import 'package:project/widgets/org_card.dart';

class AdminViewOrgsScreen extends StatefulWidget {
  const AdminViewOrgsScreen({super.key});

  @override
  State<AdminViewOrgsScreen> createState() => _AdminViewOrgsScreenState();
}

class _AdminViewOrgsScreenState extends State<AdminViewOrgsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const AppBarTitle(title: "Organization List"),
        ),
        body: const SafeArea(
            child: SingleChildScrollView(
          child: Column(
            children: [
              OrgCard(),
              OrgCard(),
              OrgCard(),
              OrgCard(),
            ],
          ),
        )));
  }
}
