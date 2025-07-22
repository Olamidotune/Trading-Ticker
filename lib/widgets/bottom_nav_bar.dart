import 'package:cointicker/screens/about_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../screens/price_screen.dart';
import '../screens/news_screen.dart';

class BottomNavBar extends StatefulWidget {
  static const String routeName = 'BottomNavigationWidget';

  const BottomNavBar({
    Key? key,
  }) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _currentIndex = 0;

  final screens = [
    const PriceScreen(),
    const NewsScreen(),
    const AboutScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[_currentIndex],
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(canvasColor: Colors.white),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.shifting,
          selectedLabelStyle: const TextStyle(fontSize: 12),
          onTap: (index) => setState(() {
            _currentIndex = index;
          }),
          currentIndex: _currentIndex,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.grey,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.houseChimney),
              label: 'Home',
            ),
            BottomNavigationBarItem(
                icon: Icon(FontAwesomeIcons.newspaper), label: 'News'),
            BottomNavigationBarItem(
                icon: Icon(FontAwesomeIcons.bars), label: 'About'),
          ],
        ),
      ),
    );
  }
}
