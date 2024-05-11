import 'package:flutter/material.dart';
import 'package:project/widgets/button.dart';

class SignInAsScreen extends StatefulWidget {
  const SignInAsScreen({super.key});

  @override
  State<SignInAsScreen> createState() => _SignInAsScreenState();
}

class _SignInAsScreenState extends State<SignInAsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ButtonWidget(
              handleClick: () {},
              block: true,
              label: "Donor",
              style: "labelLarge"),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent),
              child: Text(
                "Organization",
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 18),
              ),
            ),
          ),
        ],
      )),
    );
  }
}
