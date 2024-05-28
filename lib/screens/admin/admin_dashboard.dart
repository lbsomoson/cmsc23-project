import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:project/providers/admin_provider.dart';
import 'package:project/providers/auth_provider.dart';
import 'package:project/widgets/appbar_title.dart';
import 'package:project/widgets/divider.dart';
import 'package:project/widgets/org_application_card.dart';
import 'package:project/widgets/text2.dart';
import 'package:provider/provider.dart';

class AdminDashboard extends StatefulWidget {
  const AdminDashboard({super.key});

  @override
  State<AdminDashboard> createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
  Future<int>? _organizationsCount, _donorsCount;
  Stream<QuerySnapshot>? _organizationsToApproveStream;

  @override
  Widget build(BuildContext context) {
    _organizationsCount = context.read<AdminProvider>().getOrganizationsCount();
    _donorsCount = context.read<AdminProvider>().getDonorsCount();
    _organizationsToApproveStream =
        context.read<AdminProvider>().getOrganizationsToApprove();
    return Scaffold(
      appBar: AppBar(
        title: const AppBarTitle(title: "Admin Dashboard"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 18),
                  width: double.infinity / 2,
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      borderRadius: BorderRadius.circular(15)),
                  child: const Column(
                    children: [
                      Text(
                        "₱500,000,000.00",
                        style: TextStyle(color: Colors.white, fontSize: 32),
                      ),
                      Text(
                        "Total donations",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w400),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    // display the number of donors using future builder
                    Expanded(
                      flex: 2,
                      child: FutureBuilder<int>(
                        future: _donorsCount,
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const CircularProgressIndicator();
                          }
                          if (snapshot.hasError) {
                            return Text('Error: ${snapshot.error}');
                          }
                          final int donorsCount = snapshot.data!;
                          return Container(
                            padding: const EdgeInsets.symmetric(vertical: 18),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(
                                color: Theme.of(context).colorScheme.primary,
                              ),
                            ),
                            child: Column(
                              children: [
                                FaIcon(
                                  FontAwesomeIcons.handHoldingHeart,
                                  size: 18,
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  donorsCount.toString(),
                                  style: TextStyle(
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                    fontSize: 24,
                                  ),
                                ),
                                Text(
                                  "Donors",
                                  style: TextStyle(
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    // display the number of organizations using future builder
                    Expanded(
                      flex: 2,
                      child: FutureBuilder<int>(
                        future: _organizationsCount,
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const CircularProgressIndicator();
                          }
                          if (snapshot.hasError) {
                            return Text('Error: ${snapshot.error}');
                          }
                          final int organizationsCount = snapshot.data!;
                          return Container(
                            padding: const EdgeInsets.symmetric(vertical: 18),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(
                                color: Theme.of(context).colorScheme.primary,
                              ),
                            ),
                            child: Column(
                              children: [
                                FaIcon(
                                  FontAwesomeIcons.globe,
                                  size: 18,
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  organizationsCount.toString(),
                                  style: TextStyle(
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                    fontSize: 24,
                                  ),
                                ),
                                Text(
                                  "Organizations",
                                  style: TextStyle(
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
                const DividerWidget(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text2Widget(
                        text: "Waiting for approval", style: "sectionHeader"),
                    InkWell(
                      borderRadius: BorderRadius.circular(15),
                      splashColor: const Color.fromRGBO(3, 198, 185, 0.296),
                      onTap: () {},
                      child: GestureDetector(
                        onTap: () => Navigator.pushNamed(
                            context, "/admin-view-org-applications"),
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.transparent,
                            ),
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.transparent,
                          ),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text2Widget(
                                    text: "View all", style: "sectionHeader2"),
                                Icon(
                                  Icons.keyboard_arrow_right_rounded,
                                  color: Theme.of(context).colorScheme.primary,
                                  size: 30,
                                )
                              ]),
                        ),
                      ),
                    ),
                  ],
                ),
                CarouselSlider(
                  items: const [
                    OrgApplicationCard(),
                    OrgApplicationCard(),
                    OrgApplicationCard(),
                  ],
                  options: CarouselOptions(
                      aspectRatio: 1.10,
                      viewportFraction: 0.6,
                      enableInfiniteScroll: false,
                      initialPage: 0,
                      padEnds: false),
                ),
                TextButton.icon(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color?>(Colors.transparent),
                    ),
                    onPressed: () {
                      context.read<UserAuthProvider>().signOut();
                      Navigator.pushNamed(context, '/login');
                    },
                    label: Text(
                      "Logout",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                    ),
                    icon: Icon(
                      Icons.logout,
                      color: Theme.of(context).colorScheme.primary,
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
