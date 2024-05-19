import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:project/widgets/appbar_title.dart';
import 'package:project/widgets/divider.dart';
import 'package:project/widgets/org_application_card.dart';
import 'package:project/widgets/text2.dart';

class AdminDashboard extends StatefulWidget {
  const AdminDashboard({super.key});

  @override
  State<AdminDashboard> createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
  List list = [1, 2, 3, 4, 5];

  @override
  Widget build(BuildContext context) {
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
                    Expanded(
                      flex: 2,
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 18),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(
                                color: Theme.of(context).colorScheme.primary)),
                        child: Column(
                          children: [
                            FaIcon(
                              FontAwesomeIcons.handHoldingHeart,
                              size: 18,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              "15,000",
                              style: TextStyle(
                                  color: Theme.of(context).colorScheme.primary,
                                  fontSize: 24),
                            ),
                            Text(
                              "Donors",
                              style: TextStyle(
                                  color: Theme.of(context).colorScheme.primary,
                                  fontSize: 14),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      flex: 2,
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 18),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(
                                color: Theme.of(context).colorScheme.primary)),
                        child: Column(
                          children: [
                            FaIcon(
                              FontAwesomeIcons.globe,
                              size: 18,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              "200",
                              style: TextStyle(
                                  color: Theme.of(context).colorScheme.primary,
                                  fontSize: 24),
                            ),
                            Text(
                              "Organizations",
                              style: TextStyle(
                                  color: Theme.of(context).colorScheme.primary,
                                  fontSize: 14),
                            ),
                          ],
                        ),
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
                // CarouselSlider(
                //   options: CarouselOptions(),
                //   items: list
                //       .map(
                //         (item) => const OrgApplicationCard(),
                //       )
                //       .toList(),
                // ),
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
                // const Row(
                //   children: [
                //     OrgApplicationCard(),
                //   ],
                // ),
                const DividerWidget(),
                InkWell(
                  borderRadius: BorderRadius.circular(15),
                  splashColor: const Color.fromRGBO(3, 198, 185, 0.296),
                  onTap: () {},
                  child: GestureDetector(
                    onTap: () =>
                        Navigator.pushNamed(context, "/admin-view-orgs"),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 20),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey[300]!,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.transparent,
                      ),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text2Widget(
                                text: "View all organizations",
                                style: "sectionHeader"),
                            Icon(
                              Icons.keyboard_arrow_right_rounded,
                              color: Theme.of(context).colorScheme.primary,
                              size: 30,
                            )
                          ]),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                InkWell(
                  borderRadius: BorderRadius.circular(15),
                  splashColor: const Color.fromRGBO(3, 198, 185, 0.296),
                  onTap: () {},
                  child: GestureDetector(
                    onTap: () =>
                        Navigator.pushNamed(context, "/admin-view-donors"),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 20),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey[300]!,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.transparent,
                      ),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text2Widget(
                                text: "View all donors",
                                style: "sectionHeader"),
                            Icon(
                              Icons.keyboard_arrow_right_rounded,
                              color: Theme.of(context).colorScheme.primary,
                              size: 30,
                            )
                          ]),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
