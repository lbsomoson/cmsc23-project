import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:project/models/organization_model.dart';
import 'package:project/providers/admin_provider.dart';
import 'package:project/providers/auth_provider.dart';
import 'package:project/screens/signin.dart';
import 'package:project/widgets/appbar_title.dart';
import 'package:project/widgets/button.dart';
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
  Future<int>? _organizationsCount, _donorsCount, _donationsCount;
  Stream<QuerySnapshot>? _organizationsToApproveStream;

  @override
  Widget build(BuildContext context) {
    _organizationsCount = context.read<AdminProvider>().getOrganizationsCount();
    _donorsCount = context.read<AdminProvider>().getDonorsCount();
    _donationsCount = context.read<AdminProvider>().getDonationsCount();
    _organizationsToApproveStream =
        context.watch<AdminProvider>().getOrganizationsToApprove();

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
                FutureBuilder<int>(
                  future: _donationsCount,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator();
                    }
                    if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    }
                    final int donationsCount = snapshot.data!;
                    return Container(
                      padding: const EdgeInsets.symmetric(vertical: 18),
                      width: double.infinity / 2,
                      decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primary,
                          borderRadius: BorderRadius.circular(15)),
                      child: Column(
                        children: [
                          Text(
                            donationsCount.toString(),
                            style: const TextStyle(
                                color: Colors.white, fontSize: 32),
                          ),
                          const Text(
                            "Total donations",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w400),
                          )
                        ],
                      ),
                    );
                  },
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
                StreamBuilder<QuerySnapshot>(
                  stream: _organizationsToApproveStream,
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Center(
                        child: Text("Error encountered! ${snapshot.error}"),
                      );
                    } else if (snapshot.connectionState ==
                        ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (!snapshot.hasData) {
                      return const Center(
                        child: Text("No organizations to approve found"),
                      );
                    } else if (snapshot.data!.docs.isEmpty) {
                      return const Center(
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                            Text2Widget(
                                text: "No organizations to approve yet",
                                style: 'body3')
                          ]));
                    }

                    List<Widget> orgCards = snapshot.data!.docs.map((doc) {
                      Organization org = Organization.fromJson(
                        doc.data() as Map<String, dynamic>,
                      );
                      org.organizationId = doc.id;
                      return OrgApplicationCard(org: org);
                    }).toList();

                    return CarouselSlider(
                      items: orgCards,
                      options: CarouselOptions(
                        aspectRatio: 1.10,
                        viewportFraction: 0.6,
                        enableInfiniteScroll: false,
                        initialPage: 0,
                        padEnds: false,
                        scrollDirection: Axis.horizontal,
                      ),
                    );
                  },
                ),
                ButtonWidget(
                    handleClick: () {
                      context.read<UserAuthProvider>().signOut();
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return const SignInScreen();
                      }));
                    },
                    block: true,
                    label: "Logout",
                    style: 'outlined'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
