import 'package:flutter/material.dart';
import 'package:project/widgets/donor_org_info.dart'; 

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
        child: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              height: 224,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/orgpic.png'),
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            SizedBox(height: 10), 
            Padding(
              padding: const EdgeInsets.all(10.0), 
              child: DonorOrgInfo(),
            ),
          ],
        ),
      ),
    );
  }
}
