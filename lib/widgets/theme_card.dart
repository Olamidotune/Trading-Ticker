import 'package:cointicker/constants/app_colors.dart';
import 'package:cointicker/services/theme_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ThemeModeCard extends StatelessWidget {
  const ThemeModeCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.blackColor.withValues(alpha: .1)),
        borderRadius: BorderRadius.circular(10),
        color: Theme.of(context).inputDecorationTheme.fillColor,
      ),
      child: ValueListenableBuilder<ThemeMode>(
        valueListenable: ThemeService.themeModeNotifier,
        builder: (context, themeMode, child) {
          final isDark = ThemeService.isDarkMode(context);
          return ListTile(
            leading: SvgPicture.asset(
              isDark ? 'assets/svg/dark_mode.svg' : 'assets/svg/light_mode.svg',
              colorFilter: ColorFilter.mode(
                Theme.of(context).iconTheme.color ??
                    (isDark ? AppColors.whiteColor : AppColors.textColor),
                BlendMode.srcIn,
              ),
            ),
            title: const Text('Theme Mode'),
            subtitle: Text(
              isDark ? 'Dark Mode' : 'Light Mode',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            trailing: Switch.adaptive(
              splashRadius: 30,
              value: isDark,
              onChanged: (value) {
                ThemeService.toggleTheme();
              },
              activeColor: AppColors.primaryColor,
            ),
          );
        },
      ),
    );
  }
}
