import 'package:cointicker/constants/app_colors.dart';
import 'package:cointicker/constants/app_spacing.dart';
import 'package:cointicker/services/theme_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

class WebLayout extends HookWidget {
  const WebLayout({
    super.key,
    required this.webNavigationShell,
  });

  final StatefulNavigationShell webNavigationShell;

  @override
  Widget build(BuildContext context) {
    final isDark = ThemeService.isDarkMode(context);
    final controller = useAnimationController();
    return Scaffold(
      body: Row(
        children: [
          Material(
            elevation: 30,
            child: Container(
              width: 260,
              decoration: BoxDecoration(
                color: isDark
                    ? AppColors.primaryColor.withValues(alpha: .2)
                    : AppColors.primaryColor.withValues(alpha: .95),
                borderRadius:
                    const BorderRadius.only(bottomRight: Radius.circular(30)),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(
                      24,
                      30,
                      24,
                      40,
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: SizedBox(
                            width: 80,
                            height: 80,
                            child: Lottie.asset(
                                width: double.infinity,
                                'assets/lottie/finance.json',
                                controller: controller,
                                repeat: false, onLoaded: (composition) {
                              controller
                                ..duration = composition.duration
                                ..repeat();
                            }),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Text(
                          'CoinStalk',
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.copyWith(
                                  fontSize: 28, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),

                  // Navigation
                  _buildDestination(
                      index: 0,
                      label: 'Home',
                      asset: 'assets/svg/home.svg',
                      isDarkMode: isDark,
                      context: context),
                  AppSpacing.verticalSpaceSmall,
                  _buildDestination(
                      index: 1,
                      label: 'Markets',
                      asset: 'assets/svg/markets.svg',
                      isDarkMode: isDark,
                      context: context),
                  _buildDestination(
                      index: 2,
                      label: 'News',
                      asset: 'assets/svg/news.svg',
                      isDarkMode: isDark,
                      context: context),
                  AppSpacing.verticalSpaceSmall,
                  _buildDestination(
                      index: 3,
                      label: 'Menu',
                      asset: 'assets/svg/menu.svg',
                      isDarkMode: isDark,
                      context: context),
                  const Spacer(),
                  InkWell(
                    onTap: () => ThemeService.toggleTheme(),
                    child: Align(
                      alignment: AlignmentGeometry.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: isDark
                                ? AppColors.primaryColor
                                : AppColors.whiteColor,
                            borderRadius: BorderRadius.circular(14),
                            border: Border.all(
                              color: Theme.of(context).iconTheme.color ??
                                  (isDark
                                      ? AppColors.whiteColor
                                      : AppColors.blackColor),
                            ),
                          ),
                          child: SvgPicture.asset(
                            isDark
                                ? 'assets/svg/dark_mode.svg'
                                : 'assets/svg/light_mode.svg',
                            colorFilter: ColorFilter.mode(
                              Theme.of(context).iconTheme.color ??
                                  (isDark
                                      ? AppColors.whiteColor
                                      : AppColors.textColor),
                              BlendMode.srcIn,
                            ),
                          ),

                          // GestureDetector(
                          //   onTap: () => context.go(WebSignInScreen.routeName),
                          //   child: const Row(
                          //     children: [
                          //       CircleAvatar(
                          //         radius: 20,
                          //         backgroundColor: Color(0xFFE8ECFF),
                          //         child: Icon(
                          //           Icons.person_rounded,
                          //         ),
                          //       ),
                          //       SizedBox(width: 10),
                          //       Expanded(
                          //         child: Column(
                          //           crossAxisAlignment: CrossAxisAlignment.start,
                          //           children: [
                          //             Text(
                          //               'My Profile',
                          //               maxLines: 1,
                          //               overflow: TextOverflow.ellipsis,
                          //               style: TextStyle(
                          //                 fontSize: 13,
                          //                 fontWeight: FontWeight.w700,
                          //               ),
                          //             ),
                          //             SizedBox(height: 4),
                          //             Text(
                          //               'View account',
                          //               style: TextStyle(
                          //                 fontSize: 11,
                          //               ),
                          //             ),
                          //           ],
                          //         ),
                          //       ),
                          //       Icon(
                          //         Icons.chevron_right_rounded,
                          //       ),
                          //     ],
                          //   ),
                          // ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Main content
          Expanded(
            child: webNavigationShell,
          ),
        ],
      ),
    );
  }

  Widget _buildDestination(
      {required int index,
      required String label,
      required String asset,
      required bool isDarkMode,
      required BuildContext context}) {
    final isSelected = webNavigationShell.currentIndex == index;

    return Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 4,
        ),
        child: InkWell(
          onTap: () {
            webNavigationShell.goBranch(
              index,
              initialLocation: index == webNavigationShell.currentIndex,
            );
          },
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: isSelected
                ? BoxDecoration(
                    border: Border.all(
                        color: AppColors.blackColor.withValues(alpha: .1)),
                    borderRadius: BorderRadius.circular(30),
                    color: isSelectedColor(isSelected, isDarkMode))
                : null,
            child: Row(
              spacing: 40,
              children: [
                SvgPicture.asset(
                  asset,
                  width: 21,
                  height: 21,
                  colorFilter: ColorFilter.mode(
                    isDarkMode ? AppColors.whiteColor : AppColors.blackColor,
                    BlendMode.srcIn,
                  ),
                ),
                Text(
                  label,
                  style: TextTheme.of(context).bodyLarge?.copyWith(
                      fontWeight:
                          isSelected ? FontWeight.w900 : FontWeight.normal),
                ),
              ],
            ),
          ),
        ));
  }

  Color isSelectedColor(bool isSelected, bool isDarkMode) {
    if (isSelected && isDarkMode) {
      return AppColors.primaryColor;
    } else if (isSelected && !isDarkMode) {
      return AppColors.whiteColor;
    }
    return AppColors.secondaryTexColor;
  }
}
