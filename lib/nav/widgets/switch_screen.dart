import '/screens/dashboard/dashboard.dart';
import 'package:flutter/material.dart';

import '/enums/nav_item.dart';

class SwitchScreen extends StatelessWidget {
  final NavItem navItem;

  const SwitchScreen({Key? key, required this.navItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (navItem) {
      case NavItem.home:
        return const DashBoard();
      // return const DashBoard();

      // case NavItem.gallery:
      //   return const GalleryScreen();

      // case NavItem.happenings:
      //   return const HappeningsScreen();

      // case NavItem.forms:
      //   // return ProfileScreen();
      //   return const FormScreen();

      default:
        return const Center(
          child: Text('Wrong'),
        );
    }
  }
}
