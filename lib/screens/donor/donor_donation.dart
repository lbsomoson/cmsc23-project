import 'package:flutter/material.dart';
import 'package:project/widgets/appbar_title.dart';
import 'package:project/widgets/donation_card.dart';

class DonorDonation extends StatefulWidget {
  const DonorDonation({Key? key}) : super(key: key);

  @override
  State<DonorDonation> createState() => _DonorDonationState();
}

class _DonorDonationState extends State<DonorDonation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AppBarTitle(title: "Donations"),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: DefaultTabController(
        length: 5,
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            const SliverToBoxAdapter(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    TabBar(
                      labelStyle: TextStyle(fontSize: 12.0),
                      indicatorPadding: EdgeInsets.zero,
                      indicatorSize: TabBarIndicatorSize.label,
                      unselectedLabelColor: Colors.grey,
                      tabs: [
                        Tab(text: "Pending"),
                        Tab(text: "Confirmed"),
                        Tab(text: "Scheduled"),
                        Tab(text: "Complete"),
                        Tab(text: "Canceled"),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
          body: TabBarView(
            children: [
              Container(
                  color: Colors.white,
                  child: const Column(
                    children: [
                      DonationCard(),
                      DonationCard(),
                      DonationCard(),
                      DonationCard(),
                    ],
                  )),
              Container(
                color: Colors.white,
                child: const Center(
                  child: Text("Confirmed"),
                ),
              ),
              Container(
                color: Colors.white,
                child: const Center(
                  child: Text("Scheduled"),
                ),
              ),
              Container(
                color: Colors.white,
                child: const Center(
                  child: Text("Complete"),
                ),
              ),
              Container(
                color: Colors.white,
                child: const Center(
                  child: Text("Canceled"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
