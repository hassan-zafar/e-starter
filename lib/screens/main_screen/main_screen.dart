import 'package:estartup/providers/entrepreneur_nav_bar_provider.dart';
import 'package:estartup/screens/pages/add_page/add_page.dart';
import 'package:estartup/screens/pages/feed_page/feed_page.dart';
import 'package:estartup/screens/pages/profile_page/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../nav_bars/entrepreneur_bottom_nav_bar.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);
  static const String rotueName = '/MainScreen';

  static const List<Widget> _pages = <Widget>[
    FeedPage(),
    AddPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    final int _currentIndex =
        Provider.of<EntrepreneurNavBarProvider>(context).currentTap;
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: const EntrepreneurBottomNavBar(),
    );
  }
}
