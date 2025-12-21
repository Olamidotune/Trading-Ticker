import 'package:cointicker/constants/app_colors.dart';
import 'package:cointicker/constants/app_spacing.dart';
import 'package:cointicker/helpers/email_helper/email_fall_back.dart';
import 'package:cointicker/screens/auth/sign_in_screen.dart';
import 'package:cointicker/screens/tabs/news_screen.dart';
import 'package:cointicker/services/logging_helper.dart';
import 'package:cointicker/services/persistence_service.dart';
import 'package:cointicker/services/toast_service.dart';
import 'package:cointicker/widgets/dialogs/about_app_dialog.dart';
import 'package:cointicker/widgets/menu_card.dart';
import 'package:cointicker/widgets/profile_card.dart';
import 'package:cointicker/widgets/socials_button.dart';
import 'package:cointicker/widgets/theme_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
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
            Text(
              'Manage your profile, preferences, and app info',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: AppColors.whiteColor,
                    fontWeight: FontWeight.w400,
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
                onTap: () => _showAttachScreenshotDialog(context),
                icon: 'bug',
                name: 'Report a bug',
              ),
              AppSpacing.verticalSpaceMedium,
              MenuCard(
                onTap: () => _openSuggestFeatureMail(context),
                icon: 'info',
                name: 'Suggest a feature',
              ),
              AppSpacing.verticalSpaceMassive,
              MenuCard(
                onTap: () => _signOut(context),
                icon: 'sign_out',
                name: 'Sign Out',
              ),
              AppSpacing.verticalSpaceMassive,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SocialButton(
                      icon: 'gmail',
                      onTap: () =>
                          _openEmailApp(context, username.value ?? '')),
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

void _signOut(BuildContext context) async {
  await PersistenceService().signOut();

  ToastService.toast('Signed Out Successful', ToastType.success);

  Navigator.of(context).pushNamedAndRemoveUntil(
    SignInScreen.routeName,
    (_) => false,
  );
}

void _openSuggestFeatureMail(BuildContext context) async {
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
      await showEmailFallback(context);
    }
  } catch (e) {
    logInfo('Error launching email: $e');
    await showEmailFallback(context);
  }
}

Future<void> _showAttachScreenshotDialog(BuildContext context) {
  return showDialog<void>(
    barrierDismissible: false,
    context: context,
    builder: (context) => AlertDialog(
      title: const Text('Report a Bug'),
      content: const Text(
        'To help us resolve the issue quickly, please include a screenshot and describe what you were doing when the bug occurred.',
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(
                'Close',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: AppColors.redColor,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
            TextButton(
              onPressed: () => _openReportBugMail(context),
              child: Text(
                'Report Bug',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

void _openReportBugMail(BuildContext context) async {
  final Uri emailLaunchUri = Uri(
    scheme: 'mailto',
    path: 'Davidegundeyi@gmail.com', // Your email address
    queryParameters: {
      'subject': 'Bug Report',
      'body': 'Hi, I would like to report a bug I encountered in your app.',
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
      await showEmailFallback(context);
    }
  } catch (e) {
    logInfo('Error launching email: $e');
    await showEmailFallback(context);
  }
}

// Solution 1: Improved email launcher with better error handling
void _openEmailApp(BuildContext context, String userName) async {
  final Uri emailLaunchUri = Uri(
    scheme: 'mailto',
    path: 'Davidegundeyi@gmail.com',
    queryParameters: {
      'subject': 'Hello from CoinStalk',
      'body': 'Hi,I am $userName, I would like to know more about your app.',
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
      await showEmailFallback(context);
    }
  } catch (e) {
    logInfo('Error launching email: $e');
    await showEmailFallback(context);
  }
}
