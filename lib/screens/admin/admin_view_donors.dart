import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:project/models/donor_model.dart';
import 'package:project/providers/admin_provider.dart';
import 'package:project/widgets/admin_donor_card.dart';
import 'package:project/widgets/appbar_title.dart';
import 'package:project/widgets/text2.dart';
import 'package:provider/provider.dart';

class AdminViewDonorsScreen extends StatefulWidget {
  const AdminViewDonorsScreen({super.key});

  @override
  State<AdminViewDonorsScreen> createState() => _AdminViewDonorsScreenState();
}

class _AdminViewDonorsScreenState extends State<AdminViewDonorsScreen> {
  @override
  Widget build(BuildContext context) {
    Stream<QuerySnapshot> donorsStream =
        context.watch<AdminProvider>().getDonors();
    return Scaffold(
        appBar: AppBar(
          title: const AppBarTitle(title: "Donors List"),
        ),
        body: SafeArea(
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: StreamBuilder(
                  stream: donorsStream,
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
                        child: Text("No Friends Found"),
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
                                      text: "No donors yet", style: 'body2'))
                            ]),
                      ));
                    }
                    return ListView.builder(
                        itemCount: snapshot.data?.docs.length,
                        itemBuilder: (context, index) {
                          Donor donor = Donor.fromJson(
                              snapshot.data?.docs[index].data()
                                  as Map<String, dynamic>);
                          donor.donorId = snapshot.data?.docs[index].id;
                          return AdminDonorCard(
                              name: donor.name, id: donor.donorId!);
                        });
                  })),
        ));
  }
}
