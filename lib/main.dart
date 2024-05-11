import 'package:flutter/material.dart';
import 'package:project/screens/donor/donor_signup.dart';
import 'package:project/screens/donor_signin.dart';

void main() {
  runApp(const RootWidget());
}

class RootWidget extends StatefulWidget {
  const RootWidget({super.key});

  @override
  State<RootWidget> createState() => _RootWidgetState();
}

class _RootWidgetState extends State<RootWidget> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: const ColorScheme.light(
          primary: Color.fromRGBO(71, 187, 98, 1),
          secondary: Color.fromRGBO(142, 229, 0, 1),
        ),
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all(Colors.white),
            backgroundColor:
                MaterialStateProperty.all(const Color.fromRGBO(71, 187, 98, 1)),
          ),
        ),
        textTheme: TextTheme(
          // screen title
          bodyLarge: const TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w700,
            color: Color.fromRGBO(71, 187, 98, 1),
            fontFamily: 'Inter',
          ),
          // title
          bodyMedium: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Color.fromRGBO(22, 57, 30, 1),
            fontFamily: 'Inter',
          ),
          // caption
          bodySmall: TextStyle(
            color: Colors.grey[500],
            fontSize: 16,
            fontFamily: 'Inter',
          ),
          // text field helper
          labelMedium: TextStyle(
            color: Colors.grey[500],
            fontSize: 15,
            fontWeight: FontWeight.w500,
            fontFamily: 'Inter',
          ),
          //
          titleSmall: TextStyle(
            color: Colors.grey[500],
            fontSize: 16,
            fontWeight: FontWeight.w600,
            fontFamily: 'Inter',
          ),
          // button
          labelLarge: const TextStyle(
            color: Colors.white,
            fontSize: 17,
            fontWeight: FontWeight.w600,
            fontFamily: 'Roboto',
          ),
        ),
      ),
      initialRoute: "/donor-signup",
      onGenerateRoute: (settings) {
        if (settings.name == "/login") {
          return MaterialPageRoute(builder: (context) => const SignInScreen());
        }
        if (settings.name == "/donor-signup") {
          return MaterialPageRoute(
              builder: (context) => const DonorSignUpScreen());
        }
        return null;
      },
    );
  }
}
