import 'package:cointicker/constants/app_colors.dart';
import 'package:cointicker/constants/app_spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SocialButton extends StatelessWidget {
  final String icon;
  final Function()? onTap;

  const SocialButton({
    super.key,
    required this.icon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(AppSpacing.horizontalSpacingSmall),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.blackColor.withValues(alpha: .1)),
          borderRadius: BorderRadius.circular(10),
          color: Theme.of(context).inputDecorationTheme.fillColor,
        ),
        child: SvgPicture.asset(
          'assets/svg/$icon.svg',
          height: 30,
        ),
      ),
    );
  }
}
