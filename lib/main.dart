import 'package:flutter/material.dart';
import 'package:project/screens/admin/admin_approval.dart';
import 'package:project/screens/admin/admin_dashboard.dart';
import 'package:project/screens/admin/admin_view_donors.dart';
import 'package:project/screens/admin/admin_view_orgs.dart';
import 'package:project/screens/admin/view_org_applications.dart';
import 'package:project/screens/donor/donor_dashboard.dart';
import 'package:project/screens/donor/donor_profile.dart';
import 'package:project/screens/donor/donor_signup.dart';
import 'package:project/screens/organization/org_add_donation_drive.dart';
import 'package:project/screens/organization/org_edit_donation_drive.dart';
import 'package:project/screens/signin.dart';
import 'package:project/screens/organization/org_dashboard.dart';
import 'package:project/screens/organization/org_drives.dart';
import 'package:project/screens/organization/org_profile.dart';
import 'package:project/screens/organization/org_signup.dart';
import 'package:project/screens/splash_screen.dart';
import 'package:project/screens/view_donation.dart';
import 'package:project/screens/view_donation_drive.dart';
import 'package:project/screens/view_organization.dart';
import 'package:project/widgets/admin_bottom_navbar.dart';
import 'package:project/widgets/donor_bottom_navbar.dart';
import 'package:project/widgets/org_bottom_navbar.dart';

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
          primary: Color.fromRGBO(62, 218, 134, 1),
          secondary: Color.fromRGBO(142, 229, 0, 1),
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
      initialRoute: "/admin-navbar",
      onGenerateRoute: (settings) {
        if (settings.name == "/") {
          return MaterialPageRoute(builder: (context) => const SplashScreen());
        }
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
        if (settings.name == "/view-donation-drive") {
          return MaterialPageRoute(
              builder: (context) => const ViewOrgDonationDrive());
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
        if (settings.name == "/view-donation") {
          return MaterialPageRoute(builder: (context) => const ViewDonation());
        }
        if (settings.name == "/organization-add-drive") {
          return MaterialPageRoute(
              builder: (context) => const OrgAddDonationDriveScreen());
        }
        if (settings.name == "/organization-edit-drive") {
          return MaterialPageRoute(
              builder: (context) => const OrgEditDonationDriveScreen());
        }
        if (settings.name == "/admin-dashboard") {
          return MaterialPageRoute(
              builder: (context) => const AdminDashboard());
        }
        if (settings.name == "/admin-approval") {
          return MaterialPageRoute(
              builder: (context) => const AdminApprovalScreen());
        }
        if (settings.name == "/admin-view-org-applications") {
          return MaterialPageRoute(
              builder: (context) => const ViewOrgApplications());
        }
        if (settings.name == "/admin-view-organizations") {
          return MaterialPageRoute(
              builder: (context) => const ViewOrganizationScreen());
        }
        if (settings.name == "/admin-view-orgs") {
          return MaterialPageRoute(
              builder: (context) => const AdminViewOrgsScreen());
        }
        if (settings.name == "/admin-view-donors") {
          return MaterialPageRoute(
              builder: (context) => const AdminViewDonorsScreen());
        }
        return null;
      },
    );
  }
}
