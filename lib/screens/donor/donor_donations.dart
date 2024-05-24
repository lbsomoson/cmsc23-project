import 'package:flutter/material.dart';

class DonorDonationScreen extends StatefulWidget {
  const DonorDonationScreen({super.key});

  @override
  State<DonorDonationScreen> createState() => _DonorDonationScreenState();
}

class _DonorDonationScreenState extends State<DonorDonationScreen> {
  @override
  Widget build(BuildContext context) {
      return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Text(
            "donations"
          )
        )
      )
    );
  }
}