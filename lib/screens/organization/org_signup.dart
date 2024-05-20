import 'package:flutter/material.dart';
import 'package:project/models/user_model.dart';
import 'package:project/widgets/button.dart';
import 'package:project/widgets/iconbutton.dart';
import 'package:project/widgets/image_upload.dart';
import 'package:project/widgets/text.dart';
import 'package:project/widgets/textfield.dart';
import 'package:project/widgets/textlink.dart';
import 'package:project/providers/authenticator_provider.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';

class OrgSignUpScreen extends StatefulWidget {
  const OrgSignUpScreen({super.key});

  @override
  State<OrgSignUpScreen> createState() => _OrgSignUpScreenState();
}

class _OrgSignUpScreenState extends State<OrgSignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  String? org_username;
  String? org_name;
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
                          text: "Sign up as organization", style: 'bodyMedium'),
                      const TextWidget(
                          text: "Lorem ipsum dolor sit amet", style: "bodySmall"),
                      const SizedBox(
                        height: sizedBoxHeight,
                      ),
                      TextFieldWidget(
                          callback: (String val) => org_name  = val,
                          label: "Organization Name",
                          hintText: "Enter organization name",
                          type: "String"),
                      const SizedBox(
                        height: sizedBoxHeight,
                      ),
                      TextFieldWidget(
                          callback: (String val) => org_username  = val,
                          label: "Organization Username",
                          hintText: "Enter organization username",
                          type: "String"),
                      const SizedBox(
                        height: sizedBoxHeight,
                      ),
                      TextFieldWidget(
                          callback: (String val) => password = val,
                          label: "Password",
                          hintText: "Enter password",
                          type: "Password"),
                      const SizedBox(
                        height: sizedBoxHeight,
                      ),
                      const ImageUploadWidget(
                          instruction: "Upload proof of legitimacy",
                          label: "Upload Document"),
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
                              .signUp(org_username!, password!);
                              newUser organization = newUser(name: org_name!, username: org_username!, type: 'Organization');
                              context.read<UserAuthProvider>().addUser(organization);
                              //if (mounted) Navigator.pop(context);
                            }
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
          ),
        ],
      ),
    );
  }
}
