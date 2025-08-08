import 'package:cointicker/constants/app_colors.dart';
import 'package:cointicker/constants/app_spacing.dart';
import 'package:cointicker/screens/news_screen.dart';
import 'package:cointicker/services/logging_helper.dart';
import 'package:cointicker/services/persistence_service.dart';
import 'package:cointicker/services/theme_service.dart';
import 'package:cointicker/services/toast_service.dart';
import 'package:cointicker/widgets/profile_card.dart';
import 'package:cointicker/widgets/theme_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

class MenuScreen extends HookWidget {
  static const String routeName = 'menu_screen';
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final username = useState<String?>(null);
    final email = useState<String?>(null);
    final controller = useAnimationController();

    useEffect(() {
      Future.microtask(() async {
        final userName = await PersistenceService().getUserName();
        final mail = await PersistenceService().getUserEmail();

        username.value = userName;
        email.value = mail;
      });

      return null;
    }, []);

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(15),
            bottomRight: Radius.circular(15),
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 50),
            Text(
              'Menu',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: AppColors.whiteColor,
                  ),
            ),
          ],
        ),
        toolbarHeight: 140,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.all(AppSpacing.horizontalSpacing),
          child: Column(
            children: [
              ProfileCard(
                controller: controller,
                email: email.value,
                username: username.value,
              ),
              AppSpacing.verticalSpaceMedium,
              const ThemeModeCard(),
              AppSpacing.verticalSpaceMedium,
              MenuCard(
                onTap: () => _showEnhancedAboutDialog(context),
                icon: 'info',
                name: 'About the app',
              ),
              AppSpacing.verticalSpaceMassive,
              MenuCard(
                onTap: () {},
                icon: 'bug',
                name: 'Report a bug',
              ),
              AppSpacing.verticalSpaceMedium,
              MenuCard(
                onTap: () => openSuggestFeatureMail(context),
                icon: 'info',
                name: 'Suggest a feature',
              ),
              AppSpacing.verticalSpaceMassive,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SocialButton(
                      icon: 'gmail',
                      onTap: () => openEmailApp(context, username.value ?? '')),
                  SocialButton(
                    icon: 'github',
                    onTap: () {
                      openUrl('https://github.com/Olamidotune');
                    },
                  ),
                  SocialButton(
                    icon: 'linked_in',
                    onTap: () {
                      openUrl(
                          'https://www.linkedin.com/in/egundeyi-oladotun?utm_source=share&utm_campaign=share_via&utm_content=profile&utm_medium=ios_app');
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void _showEnhancedAboutDialog(BuildContext context) {
    aboutAppDialog(context);
  }
}

void openSuggestFeatureMail(BuildContext context) async {
  final Uri emailLaunchUri = Uri(
    scheme: 'mailto',
    path: 'Davidegundeyi@gmail.com', // Your email address
    queryParameters: {
      'subject': 'Feature Suggestion for Your App',
      'body': 'Hi, I would like to suggest a new feature for your app.',
    },
  );

  try {
    // Try to launch with mode specification
    bool launched = await launchUrl(
      emailLaunchUri,
      mode: LaunchMode.externalApplication,
    );

    if (!launched) {
      // If launching fails, try alternative methods
      await _showEmailFallback(context);
    }
  } catch (e) {
    logInfo('Error launching email: $e');
    await _showEmailFallback(context);
  }
}

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
          height: icon.contains('github') ? 28 : 25,
        ),
      ),
    );
  }
}

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
                Theme.of(context).iconTheme.color ??
                    (ThemeService.isDarkMode(context)
                        ? AppColors.whiteColor
                        : AppColors.textColor),
                BlendMode.srcIn)),
        title: Text(name),
      ),
    );
  }
}

void aboutAppDialog(BuildContext context) {
  return showAboutDialog(
    context: context,
    applicationName: 'CoinStalk',
    applicationVersion: 'Version 1.1',
    applicationIcon: ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Container(
        width: 64,
        height: 64,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [AppColors.primaryColor, AppColors.accentNeon],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: const Icon(
          Icons.currency_bitcoin,
          color: Colors.white,
          size: 32,
        ),
      ),
    ),
    applicationLegalese: '© 2025 CoinStalk. All rights reserved.',
    children: [
      const SizedBox(height: 16),

      // App Description
      Text(
        'Your ultimate cryptocurrency companion for staying ahead in the digital asset market.',
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w500,
              color: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.color
                  ?.withValues(alpha: 0.8),
            ),
        textAlign: TextAlign.center,
      ),

      const SizedBox(height: 20),

      // Features Section
      Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor.withValues(alpha: 0.3),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: Theme.of(context).dividerColor.withValues(alpha: 0.2),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '🚀 Key Features',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 12),
            _buildFeatureRow(
              context,
              '📊',
              'Top 100 Cryptocurrencies',
              'Real-time prices and market data',
            ),
            const SizedBox(height: 8),
            _buildFeatureRow(
              context,
              '📰',
              'Latest Crypto News',
              'Stay updated with breaking news',
            ),
            const SizedBox(height: 8),
            _buildFeatureRow(
              context,
              '📱',
              'Clean Interface',
              'Beautiful and intuitive design',
            ),
            const SizedBox(height: 8),
            _buildFeatureRow(
              context,
              '🌙',
              'Dark/Light Mode',
              'Customizable theme support',
            ),
          ],
        ),
      ),

      const SizedBox(height: 20),

      // Stats Section
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildStatCard(context, '100+', 'Coins'),
          _buildStatCard(context, 'Live', 'Data'),
          _buildStatCard(context, '24/7', 'Updates'),
        ],
      ),

      const SizedBox(height: 20),

      // Contact/Support Section
      Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: Theme.of(context).dividerColor.withValues(alpha: 0.3),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.support_agent,
              size: 18,
              color: Theme.of(context).textTheme.bodySmall?.color,
            ),
            const SizedBox(width: 8),
            Text(
              'Need help? Contact our support team',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      ),

      const SizedBox(height: 16),

      // Disclaimer
      Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: AppColors.redColor.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: AppColors.redColor.withValues(alpha: 0.3),
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Icon(
              Icons.warning_amber_rounded,
              size: 18,
              color: AppColors.redColor,
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                'Investment Disclaimer: Cryptocurrency investments carry risk. Always do your own research before making investment decisions.',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: AppColors.redColor,
                      fontSize: 11,
                    ),
              ),
            ),
          ],
        ),
      ),
    ],
  );
}

// Helper method for feature rows
Widget _buildFeatureRow(
    BuildContext context, String emoji, String title, String subtitle) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(emoji, style: const TextStyle(fontSize: 16)),
      const SizedBox(width: 12),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
            ),
            Text(
              subtitle,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Theme.of(context)
                        .textTheme
                        .bodySmall
                        ?.color
                        ?.withValues(alpha: 0.7),
                  ),
            ),
          ],
        ),
      ),
    ],
  );
}

// Helper method for stat cards
Widget _buildStatCard(BuildContext context, String value, String label) {
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
    decoration: BoxDecoration(
      color: AppColors.primaryColor.withValues(alpha: 0.1),
      borderRadius: BorderRadius.circular(8),
      border: Border.all(
        color: AppColors.primaryColor.withValues(alpha: 0.3),
      ),
    ),
    child: Column(
      children: [
        Text(
          value,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: AppColors.primaryColor,
              ),
        ),
        const SizedBox(height: 2),
        Text(
          label,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                fontSize: 10,
              ),
        ),
      ],
    ),
  );
}

// Solution 1: Improved email launcher with better error handling
void openEmailApp(BuildContext context, String userName) async {
  final Uri emailLaunchUri = Uri(
    scheme: 'mailto',
    path: 'Davidegundeyi@gmail.com',
    queryParameters: {
      'subject': 'Hello from CoinStalk',
      'body': 'Hi,I am $userName I would like to know more about your app.',
    },
  );

  try {
    // Try to launch with mode specification
    bool launched = await launchUrl(
      emailLaunchUri,
      mode: LaunchMode.externalApplication,
    );

    if (!launched) {
      // If launching fails, try alternative methods
      await _showEmailFallback(context);
    }
  } catch (e) {
    logInfo('Error launching email: $e');
    await _showEmailFallback(context);
  }
}

// Fallback method when email client launch fails
Future<void> _showEmailFallback(BuildContext context) async {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Contact Us'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Email client could not be opened automatically.'),
            const SizedBox(height: 16),
            const Text('You can reach us at:'),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: Theme.of(context).dividerColor,
                      ),
                    ),
                    child: const Text(
                      'Davidegundeyi@gmail.com',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.copy),
                  onPressed: () {
                    Clipboard.setData(
                      const ClipboardData(text: 'Davidegundeyi@gmail.com'),
                    );
                    // ScaffoldMessenger.of(context).showSnackBar(
                    //   const SnackBar(
                    //     content: Text('Email copied to clipboard!'),
                    //     duration: Duration(seconds: 2),
                    //   ),
                    // );
                    ToastService.toast('Email copied to clipboard!');
                    Navigator.of(context).pop();
                  },
                  tooltip: 'Copy email',
                ),
              ],
            ),
          ],
        ),
        actions: [
          GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            child: const Text(
              'Close',
            ),
          ),
          AppSpacing.horizontalSpaceMedium,
          GestureDetector(
            onTap: () async {
              Navigator.of(context).pop();
              await _tryAlternativeEmailMethods(context);
            },
            child: const Text('Try Again'),
          ),
        ],
      );
    },
  );
}

// Alternative email launching methods
Future<void> _tryAlternativeEmailMethods(BuildContext context) async {
  final List<String> emailApps = [
    'mailto:Davidegundeyi@gmail.com?subject=Hello from CoinStalk&body=Hi, I would like to know more about your app.',
    'googlegmail://co?to=Davidegundeyi@gmail.com&subject=Hello from CoinStalk&body=Hi, I would like to know more about your app.',
    'ms-outlook://compose?to=Davidegundeyi@gmail.com&subject=Hello from CoinStalk&body=Hi, I would like to know more about your app.',
  ];

  for (String urlString in emailApps) {
    try {
      final Uri uri = Uri.parse(urlString);
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
        return; // Success, exit the loop
      }
    } catch (e) {
      logInfo('Failed to launch $urlString: $e');
      continue; // Try next option
    }
  }

  // If all methods fail, show the fallback dialog again
  await _showEmailFallback(context);
}

// Solution 2: Simple version with just copy-to-clipboard fallback
void openEmailAppSimple(BuildContext context) async {
  final Uri emailLaunchUri = Uri(
    scheme: 'mailto',
    path: 'Davidegundeyi@gmail.com',
    queryParameters: {
      'subject': 'Hello from CoinStalk',
      'body': 'Hi, I would like to know more about your app.',
    },
  );

  try {
    bool launched = await launchUrl(emailLaunchUri);
    if (!launched) {
      _copyEmailToClipboard(context);
    }
  } catch (e) {
    _copyEmailToClipboard(context);
  }
}

void _copyEmailToClipboard(BuildContext context) {
  Clipboard.setData(const ClipboardData(text: 'Davidegundeyi@gmail.com'));

  ToastService.toast('Email copied! Open your email app and paste it.');
}

// Solution 3: Check for specific email apps first
Future<bool> hasEmailApp() async {
  final List<String> emailSchemes = [
    'mailto:',
    'googlegmail://',
    'ms-outlook://',
  ];

  for (String scheme in emailSchemes) {
    try {
      if (await canLaunchUrl(Uri.parse(scheme))) {
        return true;
      }
    } catch (e) {
      continue;
    }
  }
  return false;
}

void openEmailAppWithCheck(BuildContext context) async {
  // First check if any email app is available
  if (!(await hasEmailApp())) {
    _showNoEmailAppDialog(context);
    return;
  }

  // Try to launch email
  final Uri emailLaunchUri = Uri(
    scheme: 'mailto',
    path: 'Davidegundeyi@gmail.com',
    queryParameters: {
      'subject': 'Hello from CoinStalk',
      'body': 'Hi, I would like to know more about your app.',
    },
  );

  try {
    await launchUrl(emailLaunchUri, mode: LaunchMode.externalApplication);
  } catch (e) {
    _copyEmailToClipboard(context);
  }
}

void _showNoEmailAppDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('No Email App Found'),
        content: const Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.email_outlined, size: 48, color: Colors.grey),
            SizedBox(height: 16),
            Text(
              'No email app is installed on your device. You can copy our email address and use it in your preferred method.',
              textAlign: TextAlign.center,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
              _copyEmailToClipboard(context);
            },
            child: const Text('Copy Email'),
          ),
        ],
      );
    },
  );
}
