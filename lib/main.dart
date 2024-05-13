import 'package:flutter/material.dart';
import 'screens/admin/admin_approval.dart';
import 'screens/admin/admin_dashboard.dart';
import 'screens/admin/admin_view_donors.dart';
import 'screens/admin/admin_view_orgs.dart';
import 'screens/donor/donor_dashboard.dart';
import 'screens/donor/donor_profile.dart';
import 'screens/donor/donor_signup.dart';
import 'screens/signin.dart';
import 'screens/organization/org_dashboard.dart';
import 'screens/organization/org_donation.dart';
import 'screens/organization/org_drives.dart';
import 'screens/organization/org_profile.dart';
import 'screens/organization/org_signup.dart';
import 'widgets/admin_bottom_navbar.dart';
import 'widgets/donor_bottom_navbar.dart';
import 'widgets/org_bottom_navbar.dart';

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
      // initialRoute: "/admin-navbar",
      initialRoute: "/login",
      onGenerateRoute: (settings) {
        if (settings.name == "/login") {
          return MaterialPageRoute(builder: (context) => const SignInScreen());
        }
        if (settings.name == "/donor-signup") {
          return MaterialPageRoute(builder: (context) => const SignUpScreen());
        }
        if (settings.name == "/organization-signup") {
          return MaterialPageRoute(
              builder: (context) => const OrgSignUpScreen());
        }
        if (settings.name == "/donor-navbar") {
          return MaterialPageRoute(
              builder: (context) => const DonorBottomNavBar());
        }
        if (settings.name == "/organization-navbar") {
          return MaterialPageRoute(
              builder: (context) => const OrgBottomNavBar());
        }
        if (settings.name == "/admin-navbar") {
          return MaterialPageRoute(
              builder: (context) => const AdminBottomNavBar());
        }
        if (settings.name == "/donor-dashboard") {
          return MaterialPageRoute(
              builder: (context) => const DonorDashboardScreen());
        }
        if (settings.name == "/donor-profile") {
          return MaterialPageRoute(
              builder: (context) => const DonorProfileScreen());
        }
        if (settings.name == "/organization-dashboard") {
          return MaterialPageRoute(
              builder: (context) => const OrgDashboardScreen());
        }
        if (settings.name == "/organization-profile") {
          return MaterialPageRoute(
              builder: (context) => const OrgProfileScreen());
        }
        if (settings.name == "/organization-drives") {
          return MaterialPageRoute(
              builder: (context) => const OrgDonationDrivesScreen());
        }
        if (settings.name == "/organization-donations") {
          return MaterialPageRoute(
              builder: (context) => const OrgDonationScreen());
        }

        if (settings.name == "/admin-dashboard") {
          return MaterialPageRoute(
              builder: (context) => const AdminDashboard());
        }
        if (settings.name == "/admin-view-orgs") {
          return MaterialPageRoute(
              builder: (context) => const AdminViewOrgsScreen());
        }
        if (settings.name == "/admin-approval") {
          return MaterialPageRoute(
              builder: (context) => const AdminApprovalScreen());
        }
        if (settings.name == "/admin-view_donors") {
          return MaterialPageRoute(
              builder: (context) => const AdminViewDonorsScreen());
        }
        return null;
      },
    );
  }
}
