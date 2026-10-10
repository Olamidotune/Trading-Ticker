import 'package:cointicker/constants/app_colors.dart';
import 'package:cointicker/constants/app_spacing.dart';
import 'package:cointicker/services/theme_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class WebLayout extends StatelessWidget {
  const WebLayout({
    super.key,
    required this.webNavigationShell,
  });

  final StatefulNavigationShell webNavigationShell;

  @override
  Widget build(BuildContext context) {
    final isDark = ThemeService.isDarkMode(context);
    return Scaffold(
      body: Row(
        children: [
          Container(
            width: 260,
            decoration: BoxDecoration(
              color: isDark
                  ? AppColors.mutedText
                  : AppColors.greyColor.withValues(alpha: .3),
              borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(30),
                  bottomRight: Radius.circular(30)),
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
                      Container(
                          width: 42,
                          height: 42,
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [
                                Color(0xFF4361EE),
                                Color(0xFF7B61FF),
                              ],
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Image.asset("assets/png/logo.jpeg")),
                      const SizedBox(width: 12),
                      const Text(
                        'CoinStalk',
                        style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.w800,
                          letterSpacing: -0.5,
                        ),
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
                    label: 'News',
                    asset: 'assets/svg/news.svg',
                    isDarkMode: isDark,
                    context: context),
                AppSpacing.verticalSpaceSmall,
                _buildDestination(
                    index: 2,
                    label: 'Menu',
                    asset: 'assets/svg/menu.svg',
                    isDarkMode: isDark,
                    context: context),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(
                        color: const Color(0xFFE9ECF4),
                      ),
                    ),
                    child: const Row(
                      children: [
                        CircleAvatar(
                          radius: 20,
                          backgroundColor: Color(0xFFE8ECFF),
                          child: Icon(
                            Icons.person_rounded,
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'My Profile',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                'View account',
                                style: TextStyle(
                                  fontSize: 11,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Icon(
                          Icons.chevron_right_rounded,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
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
                    color: isSelected ? AppColors.primaryColor : null,
                  )
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
}

// ListTile(
//           tileColor: isSelected ? AppColors.primaryColor : null,
//           onTap: () {
//             webNavigationShell.goBranch(
//               index,
//               initialLocation: index == webNavigationShell.currentIndex,
//             );
//           },
//           leading: SvgPicture.asset(
//             asset,
//             width: 21,
//             height: 21,
//             colorFilter: ColorFilter.mode(
//               isSelected
//                   ? AppColors.primaryColor
//                   : AppColors.primaryColor.withValues(alpha: .3),
//               BlendMode.srcIn,
//             ),
//           ),
//           title: Text(
//             label,
//             style: TextTheme.of(context).bodyLarge?.copyWith(
//                 fontWeight: isSelected ? FontWeight.w900 : FontWeight.normal),
//           ),
//         ),

// Container(
//         decoration: BoxDecoration(
// borderRadius: BorderRadius.circular(30),
// color: isSelected ? AppColors.primaryColor : null),
//         child: InkWell(
//           borderRadius: BorderRadius.circular(12),
//           onTap: () {
//             webNavigationShell.goBranch(
//               index,
//               initialLocation: index == webNavigationShell.currentIndex,
//             );
//           },
// child: Container(
//   height: 50,
//   padding: const EdgeInsets.symmetric(
//     horizontal: 16,
//   ),
//   decoration: BoxDecoration(
//     borderRadius: BorderRadius.circular(12),
//     border: isSelected
//         ? const Border(
//             left: BorderSide(
//               width: 3,
//             ),
//           )
//         : null,
//   ),
//             child: Row(
//               children: [
//                 SvgPicture.asset(
//                   asset,
//                   width: 21,
//                   height: 21,
//                   colorFilter: ColorFilter.mode(
//                     isSelected
//                         ? AppColors.primaryColor
//                         : AppColors.primaryColor.withValues(alpha: .3),
//                     BlendMode.srcIn,
//                   ),
//                 ),
//                 const SizedBox(width: 14),
//                 Text(
//                   label,
//                   style: TextStyle(
//                     fontSize: 14,
//                     fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
//                   ),
//                 ),
//                 const Spacer(),
//                 if (isSelected)
//                   Container(
//                     width: 6,
//                     height: 6,
//                     decoration: const BoxDecoration(
//                       shape: BoxShape.circle,
//                     ),
//                   ),
//               ],
//             ),
//           ),
//         ),
//       ),
