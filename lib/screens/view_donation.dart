import 'package:flutter/material.dart';
import 'package:project/widgets/appbar_title.dart';

class ViewDonation extends StatefulWidget {
  const ViewDonation({super.key});

  @override
  State<ViewDonation> createState() => _ViewDonationState();
}

class _ViewDonationState extends State<ViewDonation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const AppBarTitle(title: "Juan Dela Cruz"),), 
      body: const SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [Text("View Donation")],
          ),
        ),
      ),
    );
  }
}