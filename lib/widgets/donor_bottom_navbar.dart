import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';
import 'package:project/models/donor_model.dart';
import 'package:project/models/user_model.dart';
import 'package:project/providers/auth_provider.dart';
import 'package:project/screens/donor/donor_dashboard.dart';
import 'package:project/screens/donor/donor_donation.dart';
import 'package:project/screens/donor/donor_profile.dart';

class DonorBottomNavBar extends StatefulWidget {
  const DonorBottomNavBar({super.key});

  @override
  State<DonorBottomNavBar> createState() => _DonorBottomNavBarState();
}

class _DonorBottomNavBarState extends State<DonorBottomNavBar> {
  final controller = PersistentTabController(initialIndex: 0);
  List<PersistentTabConfig> _tabs() => [
        PersistentTabConfig(
          screen: const DonorDashboardScreen(),
          item: ItemConfig(
              icon: const Icon(Icons.home),
              title: "Home",
              inactiveForegroundColor: Colors.grey[400]!,
              activeForegroundColor: Theme.of(context).colorScheme.primary),
        ),
        PersistentTabConfig(
          screen: const DonorDonation(),
          item: ItemConfig(
              icon: const FaIcon(FontAwesomeIcons.boxOpen),
              title: "Donations",
              inactiveForegroundColor: Colors.grey[400]!,
              activeForegroundColor: Theme.of(context).colorScheme.primary),
        ),
        PersistentTabConfig(
          screen: const DonorProfileScreen(),
          item: ItemConfig(
              icon: const Icon(Icons.person),
              title: "Profile",
              inactiveForegroundColor: Colors.grey[400]!,
              activeForegroundColor: Theme.of(context).colorScheme.primary),
        ),
      ];

  @override
  Widget build(BuildContext context) => PersistentTabView(
        tabs: _tabs(),
        controller: controller,
        navBarBuilder: (navBarConfig) => Style1BottomNavBar(
          navBarConfig: navBarConfig,
        ),
      );
}
