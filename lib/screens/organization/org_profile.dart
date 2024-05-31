import 'package:flutter/material.dart';
import 'package:project/models/organization_model.dart';
import 'package:project/widgets/appbar_title.dart';
import 'package:project/widgets/button.dart';
import 'package:project/widgets/divider.dart';
import 'package:project/widgets/text2.dart';
import 'package:project/widgets/textfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:project/providers/admin_provider.dart';
import 'package:project/providers/auth_provider.dart';
import 'package:provider/provider.dart';

class OrgProfileScreen extends StatefulWidget {
  const OrgProfileScreen({super.key});

  @override
  State<OrgProfileScreen> createState() => _OrgProfileScreenState();
}

class _OrgProfileScreenState extends State<OrgProfileScreen> {
  @override
  Widget build(BuildContext context) {
    User? user = context.read<UserAuthProvider>().user;
    String id = user!.uid;
    Future<Map<String, dynamic>> details =
        context.watch<AdminProvider>().getOrganization(id);
    // Get the width of the screen
    final screenWidth = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const AppBarTitle(title: "My Profile"),
        ),
        body: FutureBuilder(
          future: details,
          builder: (context, snapshot) {
            Map<String, dynamic> orgDetails = snapshot.data!;
            Organization o = Organization.fromJson(orgDetails);
            o.organizationId = id;
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return (Text("Error ${snapshot.error}"));
            }
            return SingleChildScrollView(
              child: Container(
                width: screenWidth,
                height: 926,
                decoration: const BoxDecoration(
                  color: Color.fromRGBO(255, 255, 255, 1),
                ),
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      child: Container(
                        width: screenWidth,
                        height: 165,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/images/orgHeader.jpeg'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 100,
                      left: (screenWidth - 168) / 2,
                      child: Container(
                        width: 168,
                        height: 168,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: const DecorationImage(
                            image: AssetImage('assets/images/org logo.jpg'),
                            fit: BoxFit.cover,
                          ),
                          border: Border.all(
                            color: Colors.white,
                            width: 5,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 280,
                      left: 0,
                      right: 0,
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Column(
                          children: [
                            Text(
                              o.name,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color.fromRGBO(62, 218, 134, 1),
                                fontFamily: 'Inter',
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                height: 1,
                              ),
                            ),
                            Text2Widget(
                              text: o.email,
                              style: 'body3',
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text2Widget(
                              maxLines: 10,
                              text:
                                  "Lorem ipsum dolor sit amet, consectetur  adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in",
                              style: 'body',
                            ),
                            const DividerWidget(),
                            // TextFieldWidget(
                            //     callback: () {},
                            //     hintText: "organization@gmail.com",
                            //     label: "Email",
                            //     type: 'Email'),
                            Positioned(
                              top: 400,
                              left: 36,
                              child: Text(
                                o.email,
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
                            const SizedBox(
                              height: 10,
                            ),
                            Positioned(
                              top: 480,
                              left: 36,
                              child: Column(
                                children: [
                                  for (var i in o.addresses)
                                    Text(
                                      i,
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        color: Color.fromRGBO(0, 0, 0, 1),
                                        fontFamily: 'Inter',
                                        fontSize: 24,
                                        letterSpacing: 0,
                                        fontWeight: FontWeight.normal,
                                        height: 1,
                                      ),
                                    )
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Positioned(
                              top: 400,
                              left: 36,
                              child: Text(
                                o.contactNumber,
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
                            // TextFieldWidget(
                            //     callback: () {},
                            //     hintText: "Address 1",
                            //     label: "Address",
                            //     type: 'String'),
                            // const SizedBox(
                            //   height: 5,
                            // ),
                            // TextFieldWidget(
                            //     callback: () {},
                            //     hintText: "Address 2",
                            //     type: 'Email'),
                            // const SizedBox(
                            //   height: 10,
                            // ),
                            // TextFieldWidget(
                            //     callback: () {},
                            //     hintText: "09954695022",
                            //     label: "Contact Number",
                            //     type: 'String'),
                            const SizedBox(
                              height: 20,
                            ),
                            ButtonWidget(
                              handleClick: () {},
                              block: true,
                              label: "Accept Donations",
                              style: "filled",
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
