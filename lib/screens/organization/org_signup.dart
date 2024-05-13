import 'package:flutter/material.dart';
import 'package:project/widgets/button.dart';
import 'package:project/widgets/iconbutton.dart';
import 'package:project/widgets/text.dart';
import 'package:project/widgets/textfield.dart';
import 'package:project/widgets/textlink.dart';

class OrgSignUpScreen extends StatefulWidget {
  const OrgSignUpScreen({super.key});

  @override
  State<OrgSignUpScreen> createState() => _OrgSignUpScreenState();
}

class _OrgSignUpScreenState extends State<OrgSignUpScreen> {
  @override
  Widget build(BuildContext context) {
    const double sizedBoxHeight = 20;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: const AssetImage('assets/images/annex 1.jpg'),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.5), BlendMode.darken),
              ),
            ),
          ),
          Center(
            child: SingleChildScrollView(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 18),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: sizedBoxHeight,
                    ),
                    const TextWidget(
                        text: "Sign up as organization", style: 'bodyMedium'),
                    const TextWidget(
                        text: "Lorem ipsum dolor sit amet", style: "bodySmall"),
                    const SizedBox(
                      height: sizedBoxHeight,
                    ),
                    TextFieldWidget(
                        callback: () {},
                        label: "Name",
                        hintText: "Enter your name",
                        type: "String"),
                    const SizedBox(
                      height: sizedBoxHeight,
                    ),
                    TextFieldWidget(
                        callback: () {},
                        label: "Username",
                        hintText: "Enter your username",
                        type: "String"),
                    const SizedBox(
                      height: sizedBoxHeight,
                    ),
                    TextFieldWidget(
                        callback: () {},
                        label: "Password",
                        hintText: "Enter your password",
                        type: "Password"),
                    const SizedBox(
                      height: sizedBoxHeight,
                    ),
                    ButtonWidget(
                        handleClick: () {
                          Navigator.pushNamed(context, '/organization-navbar');
                        },
                        block: true,
                        label: "Sign In",
                        style: "filled"),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                            child: Divider(
                          color: Colors.grey[500],
                        )),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          child: TextWidget(text: "or", style: 'bodySmall'),
                        ),
                        Expanded(
                            child: Divider(
                          color: Colors.grey[500],
                        )),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    IconButtonWidget(
                        block: true,
                        callback: () {
                          Navigator.pushNamed(context, '/organization-navbar');
                        },
                        icon: './assets/images/google logo.png',
                        label: "Continue with Google"),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            margin: const EdgeInsets.symmetric(
                                vertical: 20, horizontal: 0),
                            child: const TextWidget(
                              text: 'Already have an account?',
                              style: 'bodySmall',
                            )),
                        TextLink(
                            label: "Login",
                            callback: () {
                              Navigator.pushNamed(context, '/login');
                            })
                      ],
                    ),
                    // TextLink(
                    //     label: "Sign up as donor",
                    //     callback: () {
                    //       Navigator.pushNamed(context, '/donor-signup');
                    //     }),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
