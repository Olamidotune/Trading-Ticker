import 'package:cointicker/constants/app_colors.dart';
import 'package:cointicker/constants/app_spacing.dart';
import 'package:cointicker/services/persistence_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';

class AboutScreen extends HookWidget {
  static const String routeName = 'AboutScreen';
  const AboutScreen({super.key});

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
              'About',
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
                email: email,
                username: username,
              ),
              AppSpacing.verticalSpaceMedium,
              Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: AppColors.blackColor.withValues(alpha: .1)),
                    borderRadius: BorderRadius.circular(10),
                    color: Theme.of(context).inputDecorationTheme.fillColor,
                  ),
                  child: ListTile(
                    leading: SvgPicture.asset('assets/svg/light_mode.svg'),
                    title: const Text('Theme Mode'),
                    trailing: Switch.adaptive(
                      splashRadius: 30,
                      value: true,
                      onChanged: (value) {},
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileCard extends StatelessWidget {
  const ProfileCard({
    super.key,
    required this.controller,
    required this.email,
    required this.username,
  });

  final AnimationController controller;
  final ValueNotifier<String?> email;
  final ValueNotifier<String?> username;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.blackColor.withValues(alpha: .1)),
        borderRadius: BorderRadius.circular(10),
        color: Theme.of(context).inputDecorationTheme.fillColor,
      ),
      child: ListTile(
        title: Lottie.asset(
            height: 180,
            'assets/lottie/profile.json',
            controller: controller,
            repeat: false, onLoaded: (composition) {
          controller
            ..duration = composition.duration
            ..repeat();
        }),
        subtitle: Column(
          children: [
            Text(capitalizeWords(email.value ?? ''),
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(fontWeight: FontWeight.bold)),
            Text(capitalizeWords(username.value ?? ''),
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}

String capitalizeWords(String text) {
  if (text.isEmpty) return text;
  return text.split(' ').map((word) {
    if (word.isEmpty) return word;
    return word[0].toUpperCase() + word.substring(1);
  }).join(' ');
}
