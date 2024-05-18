import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:page_transition/page_transition.dart';
import 'package:project/screens/signin.dart';
import 'package:animate_gradient/animate_gradient.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool isChanged = false;

  Color primaryColor = const Color.fromARGB(255, 51, 188, 83);
  Color secondaryColor = const Color.fromARGB(255, 51, 188, 83);

  List<Color> generatePrimaryColors(Color baseColor) {
    return [
      baseColor,
      baseColor.withOpacity(0.8),
      baseColor.withOpacity(0.6),
    ];
  }

  List<Color> generateSecondaryColors(Color baseColor) {
    return [
      baseColor.withOpacity(0.7),
      baseColor.withOpacity(0.4),
      baseColor,
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned.fill(
              child: Container(
                width: double.infinity,
                height: double.infinity,
                child: AnimateGradient(
                  primaryBeginGeometry: const AlignmentDirectional(0, 1),
                  primaryEndGeometry: const AlignmentDirectional(0, 2),
                  secondaryBeginGeometry: const AlignmentDirectional(2, 0),
                  secondaryEndGeometry: const AlignmentDirectional(0, -0.8),
                  textDirectionForGeometry: TextDirection.ltr,
                  primaryColors: generatePrimaryColors(primaryColor),
                  secondaryColors: generateSecondaryColors(secondaryColor),
                ),
              ),
            ),
            SizedBox(
              child: AnimatedSplashScreen(
                curve: Curves.easeInOut,
                splash: 'assets/images/splash.gif',
                nextScreen: const SignInScreen(),
                splashTransition: SplashTransition.fadeTransition,
                pageTransitionType: PageTransitionType.fade,
                splashIconSize: 500,
                duration: 4000,
                backgroundColor: Colors.transparent,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
