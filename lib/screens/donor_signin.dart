import 'package:flutter/material.dart';
import 'package:project/widgets/button.dart';
import 'package:project/widgets/iconbutton.dart';
import 'package:project/widgets/text.dart';
import 'package:project/widgets/textfield.dart';
import 'package:project/widgets/textlink.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
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
                        text: "Sign in to your account", style: 'bodyMedium'),
                    const TextWidget(
                        text: "Lorem ipsum dolor sit amet", style: "bodySmall"),
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
                        handleClick: () {},
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
                      height: 5,
                    ),
                    IconButtonWidget(
                        block: true,
                        callback: () {},
                        icon: './assets/images/google logo.png',
                        label: "Continue with Google"),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            margin: const EdgeInsets.symmetric(
                                vertical: 20, horizontal: 0),
                            child: const TextWidget(
                              text: 'Don\'t have an account yet?',
                              style: 'bodySmall',
                            )),
                        TextLink(
                            label: "Register",
                            callback: () {
                              Navigator.pushNamed(context, '/signup');
                            })
                      ],
                    ),
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
