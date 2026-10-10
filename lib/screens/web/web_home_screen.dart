import 'package:flutter/material.dart';

class WebHomeScreen extends StatelessWidget {
  const WebHomeScreen({super.key});

  static const String routeName = "/web/home";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [],
        ),
      ),
    );
  }
}

//  Container(
//                   height: 82,
//                   padding: const EdgeInsets.symmetric(
//                     horizontal: 32,
//                   ),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.end,
//                     children: [
//                       GestureDetector(
//                         onTap: () {
//                           ThemeService.toggleTheme();
//                         },
//                         child: SvgPicture.asset(
//                           isDark
//                               ? 'assets/svg/dark_mode.svg'
//                               : 'assets/svg/light_mode.svg',
//                           colorFilter: ColorFilter.mode(
//                             Theme.of(context).iconTheme.color ??
//                                 (isDark
//                                     ? AppColors.whiteColor
//                                     : AppColors.textColor),
//                             BlendMode.srcIn,
//                           ),
//                         ),
//                       ),
//                       const SizedBox(width: 12),
//                       IconButton(
//                         onPressed: () {},
//                         tooltip: 'Settings',
//                         icon: const Icon(
//                           Icons.settings_outlined,
//                           size: 23,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
