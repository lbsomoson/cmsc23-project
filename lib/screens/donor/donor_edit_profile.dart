import 'package:flutter/material.dart';

class DonorEditProfile extends StatefulWidget {
  const DonorEditProfile({super.key});

  @override
  State<DonorEditProfile> createState() => _DonorEditProfileState();
}

class _DonorEditProfileState extends State<DonorEditProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Text(
            "EDIT"
          )
        )
      )
    );
  }
}