import 'package:estartup/providers/entrepreneur_nav_bar_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EntrepreneurBottomNavBar extends StatelessWidget {
  const EntrepreneurBottomNavBar({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    EntrepreneurNavBarProvider _navBar =
        Provider.of<EntrepreneurNavBarProvider>(context);
    return BottomNavigationBar(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      selectedLabelStyle: TextStyle(color: Theme.of(context).primaryColor),
      selectedItemColor: Theme.of(context).primaryColor,
      showUnselectedLabels: false,
      showSelectedLabels: true,
      unselectedItemColor: Colors.grey,
      currentIndex: _navBar.currentTap,
      onTap: (int index) => _navBar.onTabTapped(index),
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.feed_outlined),
          activeIcon: Icon(Icons.feed),
          label: 'Feed',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.add_box_outlined),
          activeIcon: Icon(Icons.add_box),
          label: 'New',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_pin_outlined),
          activeIcon: Icon(Icons.person_pin_rounded),
          label: 'Profile',
        ),
      ],
    );
  }
}
