import 'package:flutter/material.dart';
import 'package:project/widgets/appbar_title.dart';
import 'package:project/widgets/button.dart';
import 'package:project/widgets/divider.dart';
import 'package:project/widgets/text2.dart';
import 'package:project/widgets/textfield.dart';

class OrgProfileScreen extends StatefulWidget {
  const OrgProfileScreen({super.key});

  @override
  State<OrgProfileScreen> createState() => _OrgProfileScreenState();
}

class _OrgProfileScreenState extends State<OrgProfileScreen> {
  @override
  Widget build(BuildContext context) {
    // Get the width of the screen
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const AppBarTitle(title: "My Profile"),
      ),
      body: SingleChildScrollView(
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
                      const Text(
                        'Organization Name',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color.fromRGBO(62, 218, 134, 1),
                          fontFamily: 'Inter',
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          height: 1,
                        ),
                      ),
                      const Text2Widget(
                        text: '@juandelacruz',
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
                      TextFieldWidget(
                          callback: () {},
                          hintText: "organization@gmail.com",
                          label: "Email",
                          type: 'Email'),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFieldWidget(
                          callback: () {},
                          hintText: "Address 1",
                          label: "Address",
                          type: 'String'),
                      const SizedBox(
                        height: 5,
                      ),
                      TextFieldWidget(
                          callback: () {},
                          hintText: "Address 2",
                          type: 'Email'),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFieldWidget(
                          callback: () {},
                          hintText: "09954695022",
                          label: "Contact Number",
                          type: 'String'),
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
      ),
    );
  }
}
