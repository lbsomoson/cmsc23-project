import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project/models/donor_model.dart';
import 'package:project/providers/admin_provider.dart';
import 'package:project/providers/auth_provider.dart';
import 'package:project/widgets/text2.dart';
import 'package:provider/provider.dart';

import '../../widgets/appbar_title.dart';

class DonorProfileScreen extends StatefulWidget {
  const DonorProfileScreen({Key? key}) : super(key: key);

  @override
  State<DonorProfileScreen> createState() => _DonorProfileScreenState();
}

class _DonorProfileScreenState extends State<DonorProfileScreen> {
  @override
  Widget build(BuildContext context) {
    User? user = context.read<UserAuthProvider>().user;
    String id = user!.uid;

    Future<Map<String, dynamic>> details =
        context.watch<AdminProvider>().getDonor(id);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const AppBarTitle(title: 'My Profile'),
          backgroundColor: Colors.white,
        ),
        body: FutureBuilder(
            future: details,
            builder: (context, snapshot) {
              Map<String, dynamic> donorDetails = snapshot.data!;
              Donor d = Donor.fromJson(donorDetails);
              d.donorId = id;
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Text("Error ${snapshot.error}");
              }
              return SingleChildScrollView(
                child: Container(
                  width: 428,
                  height: 926,
                  decoration: const BoxDecoration(
                    color: Color.fromRGBO(255, 255, 255, 1),
                  ),
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        top: 300,
                        left: 130,
                        child: Text(
                          d.name,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Color.fromRGBO(62, 218, 134, 1),
                            fontFamily: 'Inter',
                            fontSize: 20,
                            letterSpacing: 0,
                            fontWeight: FontWeight.bold,
                            height: 1,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 325,
                        left: 150,
                        child: Text(
                          //" @" + context.read<UserAuthProvider>().getDetails(),
                          d.email,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color.fromRGBO(0, 0, 0, 1),
                            fontFamily: 'Inter',
                            fontSize: 14,
                            letterSpacing: 0,
                            fontWeight: FontWeight.normal,
                            height: 1,
                          ),
                        ),
                      ),
                      Positioned(
                        child: Container(
                          width: 428,
                          height: 165,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image:
                                  AssetImage('assets/images/Rectangle 58.png'),
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 100,
                        left: 120,
                        child: Container(
                          width: 168,
                          height: 168,
                          decoration: BoxDecoration(
                            boxShadow: const [
                              BoxShadow(
                                color: Color.fromRGBO(0, 0, 0, 0.25),
                                offset: Offset(1, 1),
                                blurRadius: 4,
                              )
                            ],
                            border: Border.all(
                              color: const Color.fromRGBO(255, 255, 255, 1),
                              width: 5,
                            ),
                            image: const DecorationImage(
                              image: AssetImage('assets/images/Ellipse 9.png'),
                              fit: BoxFit.fitWidth,
                            ),
                            borderRadius: const BorderRadius.all(
                                Radius.elliptical(168, 168)),
                          ),
                        ),
                      ),
                      // Positioned(
                      //   top: 650,
                      //   left: 130,
                      //   child: SizedBox(
                      //     width: 382,
                      //     height: 51,
                      //     child: Stack(
                      //       children: <Widget>[
                      //         Positioned(
                      //           top: 0,
                      //           left: 0,
                      //           child: Container(
                      //             decoration: const BoxDecoration(
                      //               borderRadius: BorderRadius.only(
                      //                 topLeft: Radius.circular(100),
                      //                 topRight: Radius.circular(100),
                      //                 bottomLeft: Radius.circular(100),
                      //                 bottomRight: Radius.circular(100),
                      //               ),
                      //               gradient: LinearGradient(
                      //                 begin: Alignment(1, 0),
                      //                 end: Alignment(0, 1),
                      //                 colors: [
                      //                   Color.fromRGBO(62, 218, 134, 1),
                      //                   Color.fromRGBO(142, 229, 0, 1)
                      //                 ],
                      //               ),
                      //             ),
                      //             padding: const EdgeInsets.symmetric(
                      //                 horizontal: 32, vertical: 16),
                      //             child: const Center(
                      //               child: Text(
                      //                 'Edit Profile',
                      //                 textAlign: TextAlign.center,
                      //                 style: TextStyle(
                      //                   color: Color.fromRGBO(255, 255, 255, 1),
                      //                   fontFamily: 'Inter',
                      //                   fontSize: 16,
                      //                   letterSpacing: 0,
                      //                   fontWeight: FontWeight.normal,
                      //                   height: 1,
                      //                 ),
                      //               ),
                      //             ),
                      //           ),
                      //         ),
                      //       ],
                      //     ),
                      //   ),
                      // ),
                      const Positioned(
                        top: 450,
                        left: 36,
                        child: Text(
                          'Address',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Color.fromRGBO(121, 121, 121, 1),
                            fontFamily: 'Inter',
                            fontSize: 15,
                            letterSpacing: 0,
                            fontWeight: FontWeight.normal,
                            height: 1,
                          ),
                        ),
                      ),
                      const Positioned(
                        top: 370,
                        left: 36,
                        child: Text(
                          'Name',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Color.fromRGBO(121, 121, 121, 1),
                            fontFamily: 'Inter',
                            fontSize: 15,
                            letterSpacing: 0,
                            fontWeight: FontWeight.normal,
                            height: 1,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 530,
                        left: 36,
                        child: Text(
                          "Contact number",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Color.fromRGBO(121, 121, 121, 1),
                            fontFamily: 'Inter',
                            fontSize: 15,
                            letterSpacing: 0,
                            fontWeight: FontWeight.normal,
                            height: 1,
                          ),
                        ),
                      ),
                      const Positioned(
                        top: 874,
                        left: 199,
                        child: SizedBox(
                          width: 30,
                          height: 30,
                        ),
                      ),
                      Positioned(
                        top: 400,
                        left: 36,
                        child: Text(
                          d.name,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Color.fromRGBO(0, 0, 0, 1),
                            fontFamily: 'Inter',
                            fontSize: 24,
                            letterSpacing: 0,
                            fontWeight: FontWeight.normal,
                            height: 1,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 480,
                        left: 36,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: d.addresses
                              .map(
                                (address) => Text2Widget(
                                  text: address,
                                  style: 'body3',
                                ),
                              )
                              .toList(),
                        ),
                        // for (var i in d.addresses)
                        //   Text(
                        //     i,
                        //     textAlign: TextAlign.left,
                        //     style: TextStyle(
                        //       color: Color.fromRGBO(0, 0, 0, 1),
                        //       fontFamily: 'Inter',
                        //       fontSize: 24,
                        //       letterSpacing: 0,
                        //       fontWeight: FontWeight.normal,
                        //       height: 1,
                        //     ),
                        //   )

                        // child: Text(
                        //   "Los banos",
                        // textAlign: TextAlign.left,
                        // style: TextStyle(
                        //   color: Color.fromRGBO(0, 0, 0, 1),
                        //   fontFamily: 'Inter',
                        //   fontSize: 24,
                        //   letterSpacing: 0,
                        //   fontWeight: FontWeight.normal,
                        //   height: 1,
                        // ),
                        // ),
                      ),
                      Positioned(
                        top: 560,
                        left: 36,
                        child: Text(
                          d.contactNumber,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Color.fromRGBO(0, 0, 0, 1),
                            fontFamily: 'Inter',
                            fontSize: 24,
                            letterSpacing: 0,
                            fontWeight: FontWeight.normal,
                            height: 1,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}
