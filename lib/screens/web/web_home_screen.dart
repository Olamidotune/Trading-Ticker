import 'package:cointicker/constants/app_colors.dart';
import 'package:cointicker/services/theme_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class WebHomeScreen extends StatelessWidget {
  const WebHomeScreen({super.key});

  static const String routeName = "/web/home";

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            WebAppBar(),
          ],
        ),
      ),
    );
  }
}

class WebAppBar extends StatelessWidget {
  const WebAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = ThemeService.isDarkMode(context);
    return Container(
      height: 82,
      padding: const EdgeInsets.symmetric(
        horizontal: 32,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          GestureDetector(
            onTap: () {
              ThemeService.toggleTheme();
            },
            child: SvgPicture.asset(
              isDark ? 'assets/svg/dark_mode.svg' : 'assets/svg/light_mode.svg',
              colorFilter: ColorFilter.mode(
                Theme.of(context).iconTheme.color ??
                    (isDark ? AppColors.whiteColor : AppColors.textColor),
                BlendMode.srcIn,
              ),
            ),
          ),
          const SizedBox(width: 12),
          IconButton(
            onPressed: () {},
            tooltip: 'Settings',
            icon: const Icon(
              Icons.settings_outlined,
              size: 23,
            ),
          ),
        ],
      ),
    );
  }
}
