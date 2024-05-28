import 'package:flutter/material.dart';
import 'package:project/screens/donor/donor_orgview.dart';
import 'package:project/widgets/donation_card.dart';
import 'package:project/widgets/donor_bottom_navbar.dart';
import 'package:project/widgets/donor_card.dart';
import 'package:project/widgets/donor_org_card.dart';
import 'package:project/widgets/org_card.dart';

import '../../widgets/appbar_title.dart';
import '../../widgets/text.dart';

class DonorDashboardScreen extends StatefulWidget {
  const DonorDashboardScreen({Key? key}) : super(key: key);

  @override
  State<DonorDashboardScreen> createState() => _DonorDashboardScreenState();
}

class _DonorDashboardScreenState extends State<DonorDashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppBarTitle(title: 'Donor Dashboard'),
        backgroundColor: Colors.white,
      ),
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
            sliver: SliverList(
              delegate: SliverChildListDelegate(
                [
                  // Your existing Container with rich text
                  Container(
                    width: 200,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Color(0xFFF4F4F4),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'Empower ',
                              style: TextStyle(
                                color: Color(0xFF3EDA86),
                                fontFamily: 'Lato',
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextSpan(
                              text: 'their future. ',
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Lato',
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextSpan(
                              text: 'Donate ',
                              style: TextStyle(
                                color: Color(0xFF3EDA86),
                                fontFamily: 'Lato',
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextSpan(
                              text: 'today!',
                              style: TextStyle(
                                color: Color(0xFF3EDA86),
                                fontFamily: 'Lato',
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],

              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return _buildCard(); 
              },
              childCount: 1, 
            ),
          )
        ],

        
      ),
    );
  }

  Widget _buildCard() {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          DonorOrgCard(),
          DonorOrgCard(),
          DonorOrgCard(),

        ],
      ),
    );
  }


}
