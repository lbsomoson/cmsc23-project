import 'package:flutter/material.dart';
import 'package:project/providers/auth_provider.dart';
import 'package:project/widgets/button.dart';
import 'package:project/widgets/iconbutton.dart';
import 'package:project/widgets/text.dart';
import 'package:project/widgets/text2.dart';
import 'package:project/widgets/textfield.dart';
import 'package:project/widgets/textlink.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  static int indexCounter = 1;
  String? username, name, password, contactNumber, address, email;
  List<Map<String, dynamic>> textFields = [];
  String? errorMessage;
  bool showSignUpErrorMessage = false;

  void _addNewTextField() {
    setState(() {
      textFields.add({
        'widget': _buildTextField(indexCounter),
        'index': indexCounter,
        'value': ''
      });
      indexCounter++;
    });
  }

  void _deleteTextField(int index) {
    setState(() {
      int textFieldIndex =
          textFields.indexWhere((field) => field['index'] == index);
      if (textFieldIndex != -1) {
        textFields.removeAt(textFieldIndex);
      }
    });
  }

  Widget _buildTextField(int index) {
    return Center(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 6,
            child: TextFieldWidget(
              callback: (String val) => textFields[index - 1]['value'] = val,
              label: "Address/es",
              hintText: "Enter your address",
              type: "String",
            ),
          ),
          InkWell(
            onTap: () => {_deleteTextField(index)},
            child: Ink(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.transparent,
              ),
              child: Icon(
                Icons.remove_circle_outline,
                size: 20,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }

  Widget get signUpErrorMessage => Padding(
        padding: const EdgeInsets.only(bottom: 30),
        child: Text(
          errorMessage!,
          style: const TextStyle(
              color: Colors.red, fontSize: 14, fontWeight: FontWeight.w400),
        ),
      );

  @override
  Widget build(BuildContext context) {
    const double sizedBoxHeight = 10;

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
                          text: "Lorem ipsum dolor sit amet",
                          style: "bodySmall"),
                      const SizedBox(
                        height: sizedBoxHeight,
                      ),
                      TextFieldWidget(
                          callback: (String val) => email = val,
                          label: "Email",
                          hintText: "Enter your email",
                          type: "Email"),
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
                          callback: (String val) => name = val,
                          label: "Name",
                          hintText: "Enter your name",
                          type: "String"),
                      const SizedBox(
                        height: sizedBoxHeight,
                      ),
                      TextFieldWidget(
                        callback: (String val) => address = val,
                        label: "Address/es",
                        hintText: "Enter your address",
                        type: "String",
                      ),
                      // iterate over textFields and cast the widgets to Widget type
                      Column(
                        children: textFields
                            .map((field) => field['widget'] as Widget)
                            .toList(),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: InkWell(
                          onTap: () => _addNewTextField(),
                          child: Ink(
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.transparent,
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.add_circle_outline,
                                  size: 20,
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                const Text2Widget(
                                    text: "Add address", style: "body2"),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: sizedBoxHeight,
                      ),
                      TextFieldWidget(
                        callback: (String val) => contactNumber = val,
                        type: "Phone",
                        label: "Contact no.",
                        hintText: "Enter your contact details",
                      ),
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
                      showSignUpErrorMessage
                          ? Column(
                              children: [
                                const SizedBox(
                                  height: 5,
                                ),
                                signUpErrorMessage,
                              ],
                            )
                          : Container(),
                      ButtonWidget(
                          handleClick: () async {
                            _formKey.currentState!.save();
                            if (_formKey.currentState!.validate()) {
                              List<String> addresses = textFields
                                  .map((item) => item['value'] as String)
                                  .toList();
                              addresses.insert(0, address!);
                              String? message = await context
                                  .read<UserAuthProvider>()
                                  .authService
                                  .donorSignUp(
                                      email!,
                                      username!,
                                      password!,
                                      name!,
                                      addresses,
                                      contactNumber!,
                                      'donor');

                              setState(() {
                                if (message != null && message.isNotEmpty) {
                                  errorMessage = message;
                                  showSignUpErrorMessage = true;
                                } else {
                                  showSignUpErrorMessage = false;
                                }
                              });
                            }
                            // check if no error and the widget hasn't been disposed of after an asynchronous action
                            if (context.mounted &&
                                showSignUpErrorMessage == false) {
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
                            Navigator.pushNamed(
                                context, '/organization-signup');
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
