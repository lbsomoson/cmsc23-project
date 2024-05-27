import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class DonorOrgView extends StatefulWidget {
  const DonorOrgView({super.key});

  @override
  State<DonorOrgView> createState() => _DonorOrgViewState();
}

class _DonorOrgViewState extends State<DonorOrgView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Stack(
      children: <Widget>[
        Positioned(
          child: Container(
            width: 428,
            height: 224,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/orgpic.png'),
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
        ),
      ],
    )));
  }
}
