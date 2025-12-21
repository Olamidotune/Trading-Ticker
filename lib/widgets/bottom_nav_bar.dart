import 'package:cointicker/constants/app_colors.dart';
import 'package:cointicker/screens/tabs/markets_screen.dart';
import 'package:cointicker/screens/tabs/menu_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../screens/tabs/home_screen.dart';
import '../screens/tabs/news_screen.dart';

class BottomNavBar extends StatefulWidget {
  static const String routeName = 'BottomNavigationWidget';

  const BottomNavBar({
    super.key,
  });

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _currentIndex = 0;

  final screens = [
    const HomeScreen(),
    const MarketsScreen(),
    const NewsScreen(),
    const MenuScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[_currentIndex],
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Theme.of(context).colorScheme.primary,
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.shifting,
          onTap: (index) => setState(() {
            _currentIndex = index;
          }),
          currentIndex: _currentIndex,
          selectedItemColor: Theme.of(context).textTheme.bodyMedium?.color,
          unselectedItemColor: AppColors.goldColor,
          showSelectedLabels: true,
          items: [
            BottomNavigationBarItem(
              icon: _currentIndex == 0
                  ? SvgPicture.asset(
                      'assets/svg/home.svg',
                      colorFilter: const ColorFilter.mode(
                        AppColors.primaryColor,
                        BlendMode.srcIn,
                      ),
                    )
                  : SvgPicture.asset(
                      'assets/svg/home.svg',
                      colorFilter: ColorFilter.mode(
                          AppColors.greyColor.withValues(alpha: .5),
                          BlendMode.srcIn),
                    ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
                icon: _currentIndex == 1
                    ? SvgPicture.asset(
                        'assets/svg/trending_up.svg',
                        colorFilter: const ColorFilter.mode(
                          AppColors.primaryColor,
                          BlendMode.srcIn,
                        ),
                      )
                    : SvgPicture.asset(
                        'assets/svg/trending_up.svg',
                        colorFilter: ColorFilter.mode(
                            AppColors.greyColor.withValues(alpha: .5),
                            BlendMode.srcIn),
                      ),
                label: 'Markets'),
            BottomNavigationBarItem(
                icon: _currentIndex == 2
                    ? SvgPicture.asset(
                        'assets/svg/news.svg',
                        colorFilter: const ColorFilter.mode(
                          AppColors.primaryColor,
                          BlendMode.srcIn,
                        ),
                      )
                    : SvgPicture.asset(
                        'assets/svg/news.svg',
                        colorFilter: ColorFilter.mode(
                            AppColors.greyColor.withValues(alpha: .5),
                            BlendMode.srcIn),
                      ),
                label: 'News'),
            BottomNavigationBarItem(
                icon: _currentIndex == 3
                    ? SvgPicture.asset(
                        'assets/svg/menu.svg',
                        colorFilter: const ColorFilter.mode(
                          AppColors.primaryColor,
                          BlendMode.srcIn,
                        ),
                      )
                    : SvgPicture.asset(
                        'assets/svg/menu.svg',
                        colorFilter: ColorFilter.mode(
                            AppColors.greyColor.withValues(alpha: .5),
                            BlendMode.srcIn),
                      ),
                label: 'Menu'),
          ],
        ),
      ),
    );
  }
}
