import 'package:cointicker/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class Layout extends StatelessWidget {
  const Layout({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: navigationShell,
        bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(
            canvasColor: Theme.of(context).colorScheme.primary,
          ),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.shifting,
            currentIndex: navigationShell.currentIndex,
            onTap: navigationShell.goBranch,
            selectedItemColor: AppColors.primaryColor,
            unselectedItemColor: AppColors.greyColor.withValues(alpha: .5),
            items: [
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'assets/svg/home.svg',
                  colorFilter: const ColorFilter.mode(
                    AppColors.primaryColor,
                    BlendMode.srcIn,
                  ),
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    'assets/svg/trending_up.svg',
                    colorFilter: const ColorFilter.mode(
                      AppColors.primaryColor,
                      BlendMode.srcIn,
                    ),
                  ),
                  label: 'Markets'),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    'assets/svg/news.svg',
                    colorFilter: const ColorFilter.mode(
                      AppColors.primaryColor,
                      BlendMode.srcIn,
                    ),
                  ),
                  label: 'News'),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    'assets/svg/menu.svg',
                    colorFilter: const ColorFilter.mode(
                      AppColors.primaryColor,
                      BlendMode.srcIn,
                    ),
                  ),
                  label: 'Menu'),
            ],
          ),
        ));
  }
}
