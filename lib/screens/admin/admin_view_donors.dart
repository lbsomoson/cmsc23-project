import 'package:flutter/material.dart';
import 'package:project/widgets/admin_donor_card.dart';
import 'package:project/widgets/appbar_title.dart';

class AdminViewDonorsScreen extends StatefulWidget {
  const AdminViewDonorsScreen({super.key});

  @override
  State<AdminViewDonorsScreen> createState() => _AdminViewDonorsScreenState();
}

class _AdminViewDonorsScreenState extends State<AdminViewDonorsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const AppBarTitle(title: "Donors List"),
        ),
        body: const SafeArea(
            child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                AdminDonorCard(name: "Juan Dela Cruz"),
                AdminDonorCard(name: "Juan Dela Cruz"),
                AdminDonorCard(name: "Juan Dela Cruz"),
                AdminDonorCard(name: "Juan Dela Cruz"),
                AdminDonorCard(name: "Juan Dela Cruz"),
                AdminDonorCard(name: "Juan Dela Cruz"),
                AdminDonorCard(name: "Juan Dela Cruz"),
                AdminDonorCard(name: "Juan Dela Cruz"),
                AdminDonorCard(name: "Juan Dela Cruz"),
                AdminDonorCard(name: "Juan Dela Cruz"),
                AdminDonorCard(name: "Juan Dela Cruz"),
                AdminDonorCard(name: "Juan Dela Cruz"),
                AdminDonorCard(name: "Juan Dela Cruz"),
                AdminDonorCard(name: "Juan Dela Cruz"),
                AdminDonorCard(name: "Juan Dela Cruz"),
              ],
            ),
          ),
        )));
  }
}
