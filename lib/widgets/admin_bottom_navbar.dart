import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';
import 'package:project/screens/admin/admin_approval.dart';
import 'package:project/screens/admin/admin_dashboard.dart';
import 'package:project/screens/admin/admin_view_donors.dart';
import 'package:project/screens/admin/admin_view_orgs.dart';

class AdminBottomNavBar extends StatefulWidget {
  const AdminBottomNavBar({super.key});

  @override
  State<AdminBottomNavBar> createState() => _AdminBottomNavBarState();
}

class _AdminBottomNavBarState extends State<AdminBottomNavBar> {
  final controller = PersistentTabController(initialIndex: 0);

  List<PersistentTabConfig> _tabs() => [
        PersistentTabConfig(
          screen: const AdminDashboard(),
          item: ItemConfig(
              icon: const Icon(Icons.home),
              title: "Home",
              inactiveForegroundColor: Colors.grey[400]!,
              activeForegroundColor: Theme.of(context).colorScheme.primary),
        ),
        PersistentTabConfig(
          screen: const AdminViewOrgsScreen(),
          item: ItemConfig(
              icon: const FaIcon(FontAwesomeIcons.globe),
              title: "Organizations",
              inactiveForegroundColor: Colors.grey[400]!,
              activeForegroundColor: Theme.of(context).colorScheme.primary),
        ),
        PersistentTabConfig(
          screen: const AdminViewDonorsScreen(),
          item: ItemConfig(
              icon: const FaIcon(FontAwesomeIcons.handHoldingHeart),
              title: "Donors",
              inactiveForegroundColor: Colors.grey[400]!,
              activeForegroundColor: Theme.of(context).colorScheme.primary),
        ),
        PersistentTabConfig(
          screen: const AdminApprovalScreen(),
          item: ItemConfig(
              icon: const Icon(Icons.approval_rounded),
              title: "Approval",
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
