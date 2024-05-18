import 'dart:async';

import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:page_transition/page_transition.dart';
import 'package:project/screens/signin.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: content(),
    );
  }

  Widget content() {
    return Center(
      child: SizedBox(
        child: AnimatedSplashScreen(
          curve: accelerateEasing,
          splash: 'assets/images/splash.gif',
          nextScreen: const SignInScreen(),
          splashTransition: SplashTransition.fadeTransition,
          pageTransitionType: PageTransitionType.fade,
          splashIconSize: 500,
          duration: 4000,
          backgroundColor: Theme.of(context).colorScheme.primary,
        ),
      ),
    );
  }
}
