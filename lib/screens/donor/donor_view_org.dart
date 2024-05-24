import 'package:flutter/material.dart';

class DonorViewOrg extends StatefulWidget {
  const DonorViewOrg({super.key});

  @override
  State<DonorViewOrg> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<DonorViewOrg> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Text(
            "Organization"
          )
        )
      )
    );
  }
}