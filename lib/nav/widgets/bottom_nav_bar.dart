import 'package:cart_creative/enums/enums.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  final NavItem? navItem;
  final Function(NavItem)? onitemSelected;

  const BottomNavBar({
    Key? key,
    @required this.navItem,
    @required this.onitemSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      elevation: 20.0,
      //landscapeLayout: BottomNavigationBarLandscapeLayout.centered,
      // type: BottomNavigationBarType.shifting,

      type: BottomNavigationBarType.fixed,
      backgroundColor: const Color(0xff00b55b),
      iconSize: 20,
      selectedFontSize: 12,
      unselectedFontSize: 13,
      selectedItemColor: Colors.white,
      //selectedItemColor: Colors.green,
      unselectedItemColor: Colors.white54,
      currentIndex: NavItem.values.indexOf(navItem!),
      onTap: (index) => onitemSelected!(NavItem.values[index]),
      items: NavItem.values.map((item) {
        return BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.all(6.0),
              child: _itemIcon(item),
            ),
            label: _label(item));
      }).toList(),
    );
  }
}

Widget _itemIcon(NavItem item) {
  if (item == NavItem.home) {
    return const Icon(Icons.dashboard);
  } else if (item == NavItem.offers) {
    return const Icon(Icons.image);
  } else if (item == NavItem.orders) {
    return const Icon(Icons.add_road_sharp);
  } else if (item == NavItem.cart) {
    return const Icon(
      Icons.shopping_bag,
      size: 24.0,
    );
  }

  return const Icon(Icons.person);
}

String _label(NavItem item) {
  if (item == NavItem.home) {
    return 'Home';
  } else if (item == NavItem.offers) {
    return 'Offers';
  } else if (item == NavItem.orders) {
    return 'Orders';
  } else if (item == NavItem.cart) {
    return 'Cart';
  }

  return '';
}
