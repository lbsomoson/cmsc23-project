import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';
import 'package:project/screens/organization/org_dashboard.dart';
import 'package:project/screens/organization/org_drives.dart';
import 'package:project/screens/organization/org_profile.dart';

class OrgBottomNavBar extends StatefulWidget {
  const OrgBottomNavBar({super.key});

  @override
  State<OrgBottomNavBar> createState() => _OrgBottomNavBarState();
}

class _OrgBottomNavBarState extends State<OrgBottomNavBar> {
  final controller = PersistentTabController(initialIndex: 0);

  List<PersistentTabConfig> _tabs() => [
        PersistentTabConfig(
          screen: const OrgDashboardScreen(),
          item: ItemConfig(
              icon: const Icon(Icons.home),
              title: "Home",
              inactiveForegroundColor: Colors.grey[400]!,
              activeForegroundColor: Theme.of(context).colorScheme.primary),
        ),
        PersistentTabConfig(
          screen: const OrgDonationDrivesScreen(),
          item: ItemConfig(
              icon: const Icon(Icons.folder_rounded),
              title: "Drives",
              inactiveForegroundColor: Colors.grey[400]!,
              activeForegroundColor: Theme.of(context).colorScheme.primary),
        ),
        PersistentTabConfig(
          screen: const OrgProfileScreen(),
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
