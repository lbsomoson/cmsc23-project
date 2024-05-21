import 'package:flutter/material.dart';
import 'package:project/providers/authenticator_provider.dart';
import 'package:project/widgets/button.dart';
import 'package:project/widgets/iconbutton.dart';
import 'package:project/widgets/text.dart';
import 'package:project/widgets/textfield.dart';
import 'package:project/widgets/textlink.dart';
import 'package:provider/provider.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();
  String? username;
  String? password;
  String? errorMessage;
  bool showSignInErrorMessage = false;

  Widget get signInErrorMessage => Padding(
        padding: const EdgeInsets.only(bottom: 30),
        child: Text(
          errorMessage!,
          style: const TextStyle(
              color: Colors.red, fontSize: 14, fontWeight: FontWeight.w400),
        ),
      );

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
                          text: "Sign in to your account", style: 'bodyMedium'),
                      const TextWidget(
                          text: "Lorem ipsum dolor sit amet",
                          style: "bodySmall"),
                      const SizedBox(
                        height: sizedBoxHeight,
                      ),
                      TextFieldWidget(
                          callback: (String val) => username = val,
                          label: "Username",
                          hintText: "Enter your username",
                          type: "String"),
                      const SizedBox(
                        height: sizedBoxHeight,
                      ),
                      TextFieldWidget(
                          callback: (String val) => password = val,
                          label: "Password",
                          hintText: "Enter your password",
                          type: "Password"),
                      const SizedBox(
                        height: sizedBoxHeight,
                      ),
                      showSignInErrorMessage
                          ? Column(
                              children: [
                                const SizedBox(
                                  height: 5,
                                ),
                                signInErrorMessage,
                              ],
                            )
                          : Container(),
                      // showSignInErrorMessage? Text("Wrong credentials"):Container(),
                      ButtonWidget(
                          handleClick: () async {
                            if (_formKey.currentState!.validate()) {
                              _formKey.currentState!.save();
                              String? message = await context
                                  .read<UserAuthProvider>()
                                  .authService
                                  .signIn(username!, password!);
                              setState(() {
                                if (message != null && message.isNotEmpty) {
                                  errorMessage = message;
                                  showSignInErrorMessage = true;
                                } else {
                                  showSignInErrorMessage = false;
                                }
                              });
                            }

                            // TODO: Check user type
                            if (context.mounted &&
                                showSignInErrorMessage == false) {
                              Navigator.pushNamed(context, '/donor-navbar');
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
                            // TODO: Check user type
                            Navigator.pushNamed(context, '/admin-navbar');
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
                                text: 'Don\'t have an account yet?',
                                style: 'bodySmall',
                              )),
                          TextLink(
                              label: "Register",
                              callback: () {
                                Navigator.pushNamed(context, '/donor-signup');
                              })
                        ],
                      ),
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
