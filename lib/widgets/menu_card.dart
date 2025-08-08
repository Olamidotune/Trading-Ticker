import 'package:cointicker/constants/app_colors.dart';
import 'package:cointicker/services/theme_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MenuCard extends StatelessWidget {
  final Function() onTap;
  final String icon;
  final String name;

  const MenuCard({
    super.key,
    required this.onTap,
    required this.icon,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.blackColor.withValues(alpha: .1)),
        borderRadius: BorderRadius.circular(10),
        color: Theme.of(context).inputDecorationTheme.fillColor,
      ),
      child: ListTile(
        onTap: onTap,
        leading: SvgPicture.asset('assets/svg/$icon.svg',
            colorFilter: ColorFilter.mode(
                icon.contains('sign')
                    ? AppColors.errorColor
                    : Theme.of(context).iconTheme.color ??
                        (ThemeService.isDarkMode(context)
                            ? AppColors.whiteColor
                            : AppColors.textColor),
                BlendMode.srcIn)),
        title: Text(name),
      ),
    );
  }
}
