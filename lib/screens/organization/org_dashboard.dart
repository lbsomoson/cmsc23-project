import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project/models/donation_model.dart';
import 'package:project/providers/admin_provider.dart';
import 'package:project/providers/auth_provider.dart';
import 'package:project/widgets/appbar_title.dart';
import 'package:project/widgets/donation_card.dart';
import 'package:project/widgets/text2.dart';
import 'package:provider/provider.dart';
import 'package:project/widgets/qrcode.dart';
import 'package:project/widgets/qrscanner.dart';

class OrgDashboardScreen extends StatefulWidget {
  const OrgDashboardScreen({Key? key}) : super(key: key);

  @override
  State<OrgDashboardScreen> createState() => _OrgDashboardScreenState();
}

class _OrgDashboardScreenState extends State<OrgDashboardScreen> {
  @override
  Widget build(BuildContext context) {
    User? user = context.watch<UserAuthProvider>().user;
    Stream<QuerySnapshot> donationsStream =
        context.watch<AdminProvider>().getDonationsByOrgId(user!.uid);

    Widget _buildPendingTab(BuildContext context) {
      return StreamBuilder(
          stream: donationsStream,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text("Error encountered! ${snapshot.error}"),
              );
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (!snapshot.hasData) {
              return const Center(
                child: Text2Widget(
                  text: "No Donations Found",
                  style: 'body3',
                ),
              );
            } else if (snapshot.data!.docs.isEmpty) {
              return const Center(
                  child: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Center(
                          child: Text2Widget(
                              text: "No donations yet", style: 'body2'))
                    ]),
              ));
            }
            print(snapshot.data);
            return ListView.builder(
                itemCount: snapshot.data?.docs.length,
                itemBuilder: (context, index) {
                  Donation donation = Donation.fromJson(
                      snapshot.data?.docs[index].data()
                          as Map<String, dynamic>);
                  donation.donationId = snapshot.data?.docs[index].id;
                  print("=========================$donation");
                  print(donation.status);
                  if (donation.status == "pending") {
                    return DonationCard(donationId: donation.donationId!);
                  } else {
                    return Container();
                  }
                });
          });
    }

    Widget _buildConfirmedTab(BuildContext context) {
      return StreamBuilder(
          stream: donationsStream,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text("Error encountered! ${snapshot.error}"),
              );
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (!snapshot.hasData) {
              return const Center(
                child: Text2Widget(
                  text: "No Donations Found",
                  style: 'body3',
                ),
              );
            } else if (snapshot.data!.docs.isEmpty) {
              return const Center(
                  child: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Center(
                          child: Text2Widget(
                              text: "No donations yet", style: 'body2'))
                    ]),
              ));
            }
            print(snapshot.data);
            return ListView.builder(
                itemCount: snapshot.data?.docs.length,
                itemBuilder: (context, index) {
                  Donation donation = Donation.fromJson(
                      snapshot.data?.docs[index].data()
                          as Map<String, dynamic>);
                  donation.donationId = snapshot.data?.docs[index].id;
                  print("=========================$donation");
                  print(donation.status);
                  if (donation.status == "confirmed") {
                    return DonationCard(donationId: donation.donationId!);
                  } else {
                    return Container();
                  }
                });
          });
    }

    Widget _buildScheduledTab(BuildContext context) {
      return StreamBuilder(
          stream: donationsStream,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text("Error encountered! ${snapshot.error}"),
              );
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (!snapshot.hasData) {
              return const Center(
                child: Text2Widget(
                  text: "No Donations Found",
                  style: 'body3',
                ),
              );
            } else if (snapshot.data!.docs.isEmpty) {
              return const Center(
                  child: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Center(
                          child: Text2Widget(
                              text: "No donations yet", style: 'body2'))
                    ]),
              ));
            }
            print(snapshot.data);
            return ListView.builder(
                itemCount: snapshot.data?.docs.length,
                itemBuilder: (context, index) {
                  Donation donation = Donation.fromJson(
                      snapshot.data?.docs[index].data()
                          as Map<String, dynamic>);
                  donation.donationId = snapshot.data?.docs[index].id;
                  print("=========================$donation");
                  print(donation.status);
                  if (donation.status == "scheduled") {
                    return DonationCard(donationId: donation.donationId!);
                  } else {
                    return Container();
                  }
                });
          });
    }

    Widget _buildCompletedTab(BuildContext context) {
      return StreamBuilder(
          stream: donationsStream,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text("Error encountered! ${snapshot.error}"),
              );
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (!snapshot.hasData) {
              return const Center(
                child: Text2Widget(
                  text: "No Donations Found",
                  style: 'body3',
                ),
              );
            } else if (snapshot.data!.docs.isEmpty) {
              return const Center(
                  child: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Center(
                          child: Text2Widget(
                              text: "No donations yet", style: 'body2'))
                    ]),
              ));
            }
            print(snapshot.data);
            return ListView.builder(
                itemCount: snapshot.data?.docs.length,
                itemBuilder: (context, index) {
                  Donation donation = Donation.fromJson(
                      snapshot.data?.docs[index].data()
                          as Map<String, dynamic>);
                  donation.donationId = snapshot.data?.docs[index].id;
                  print("=========================$donation");
                  print(donation.status);
                  if (donation.status == "completed") {
                    return DonationCard(donationId: donation.donationId!);
                  } else {
                    return Container();
                  }
                });
          });
    }

    Widget _buildCanceledTab(BuildContext context) {
      return StreamBuilder(
          stream: donationsStream,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text("Error encountered! ${snapshot.error}"),
              );
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (!snapshot.hasData) {
              return const Center(
                child: Text2Widget(
                  text: "No Donations Found",
                  style: 'body3',
                ),
              );
            } else if (snapshot.data!.docs.isEmpty) {
              return const Center(
                  child: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Center(
                          child: Text2Widget(
                              text: "No donations yet", style: 'body2'))
                    ]),
              ));
            }
            print(snapshot.data);
            return ListView.builder(
                itemCount: snapshot.data?.docs.length,
                itemBuilder: (context, index) {
                  Donation donation = Donation.fromJson(
                      snapshot.data?.docs[index].data()
                          as Map<String, dynamic>);
                  donation.donationId = snapshot.data?.docs[index].id;
                  print("=========================$donation");
                  print(donation.status);
                  if (donation.status == "canceled") {
                    return DonationCard(donationId: donation.donationId!);
                  } else {
                    return Container();
                  }
                });
          });
    }

    return Scaffold(
      appBar: AppBar(
        title: const AppBarTitle(title: "Donations"),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: DefaultTabController(
        length: 5,
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            SliverToBoxAdapter(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    TabBar(
                      labelStyle: TextStyle(fontSize: 12.0),
                      indicatorPadding: EdgeInsets.zero,
                      indicatorSize: TabBarIndicatorSize.label,
                      unselectedLabelColor: Colors.grey,
                      tabs: const [
                        Tab(text: "Pending"),
                        Tab(text: "Confirmed"),
                        Tab(text: "Scheduled"),
                        Tab(text: "Completed"),
                        Tab(text: "Canceled"),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
          body: TabBarView(children: [
            _buildPendingTab(context),
            _buildConfirmedTab(context),
            _buildScheduledTab(context),
            _buildCompletedTab(context),
            _buildCanceledTab(context),
          ]),
        ),
      ),
    );
  }
}
