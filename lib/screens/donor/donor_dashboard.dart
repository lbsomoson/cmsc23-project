import 'package:flutter/material.dart';
import 'package:project/widgets/donation_card.dart';
import 'package:project/widgets/donor_card.dart';

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
                  Container(
                    width: 130,
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
                return Padding(
                  padding: const EdgeInsets.all(20),
                  child: _buildCard(),
                );
              },
              childCount: 6,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCard() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
        border: Border.all(
          color: Color.fromRGBO(220, 220, 220, 1),
          width: 1,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.horizontal(
                left: Radius.circular(15),
              ),
              image: DecorationImage(
                image: const AssetImage('assets/images/Rectangle 34.png'),
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 16),
                  Text(
                    'Cats of UPLB',
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Inter',
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Organization Category',
                    style: TextStyle(
                      color: Color.fromRGBO(62, 218, 134, 1),
                      fontFamily: 'Inter',
                      fontSize: 10,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud',
                    style: TextStyle(
                      color: Color.fromRGBO(159, 159, 159, 1),
                      fontFamily: 'Inter',
                      fontSize: 10,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Container(
                        width: 12,
                        height: 12,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/images/Location.png'),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      SizedBox(width: 4),
                      Text(
                        'Los Baños, Laguna',
                        style: TextStyle(
                          color: Color.fromRGBO(62, 218, 134, 1),
                          fontFamily: 'Inter',
                          fontSize: 10,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
