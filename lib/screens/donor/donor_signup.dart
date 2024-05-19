import 'package:flutter/material.dart';
import 'package:project/providers/authenticator_provider.dart';
import 'package:project/widgets/button.dart';
import 'package:project/widgets/iconbutton.dart';
import 'package:project/widgets/text.dart';
import 'package:project/widgets/textfield.dart';
import 'package:project/widgets/textlink.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project/models/donor_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  String? username;
  String? name;
  String? password;

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
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: sizedBoxHeight,
                      ),
                      const TextWidget(
                          text: "Sign up as donor", style: 'bodyMedium'),
                      const TextWidget(
                          text: "Lorem ipsum dolor sit amet", style: "bodySmall"),
                      const SizedBox(
                        height: sizedBoxHeight,
                      ),
                      TextFieldWidget(
                          callback: (String val) => name  = val,
                          label: "Name",
                          hintText: "Enter your name",
                          type: "String"),
                      const SizedBox(
                        height: sizedBoxHeight,
                      ),
                      TextFieldWidget(
                          callback: (String val) => username  = val,
                          label: "Username",
                          hintText: "Enter your username",
                          type: "String"),
                      const SizedBox(
                        height: sizedBoxHeight,
                      ),
                      TextFieldWidget(
                          callback: (String val) => password  = val,
                          label: "Password",
                          hintText: "Enter your password",
                          type: "Password"),
                      const SizedBox(
                        height: sizedBoxHeight,
                      ),
                      ButtonWidget(
                          handleClick: () async {
                            _formKey.currentState!.save();
                            if (_formKey.currentState!.validate()){
                              await context
                              .read<UserAuthProvider>()
                              .authService
                              .signUp(username!, password!);
                              if (mounted) Navigator.pop(context);
                            }
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
                            Navigator.pushNamed(context, '/donor-navbar');
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
                      TextLink(
                          label: "Sign up as organization",
                          callback: () {
                            Navigator.pushNamed(context, '/organization-signup');
                          }),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
