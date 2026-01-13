import 'package:cointicker/screens/auth/sign_in_screen.dart';
import 'package:cointicker/screens/onboarding/onboarding.dart';
import 'package:cointicker/services/persistence_service.dart';
import 'package:cointicker/widgets/bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends HookWidget {
  const SplashScreen({super.key});

  static const String routeName = 'splash-screen';

  @override
  Widget build(BuildContext context) {
    final controller = useAnimationController();

    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: Lottie.asset(
                  height: 400,
                  width: double.infinity,
                  'assets/lottie/finance.json',
                  controller: controller,
                  repeat: false, onLoaded: (composition) async {
                controller.duration = composition.duration;
                await controller.forward();
                final isSignedIn = await PersistenceService().getSignInStatus();
                final hasAuthenticatedBefore =
                    await PersistenceService().getHasAuthenticatedBefore();
                if (!context.mounted) return;
                if (isSignedIn) {
                  Navigator.of(context).pushNamedAndRemoveUntil(
                    BottomNavBar.routeName,
                    (_) => false,
                  );
                } else if (hasAuthenticatedBefore) {
                  Navigator.of(context).pushNamedAndRemoveUntil(
                    SignInScreen.routeName,
                    (_) => false,
                  );
                } else {
                  Navigator.of(context).pushNamedAndRemoveUntil(
                    OnboardingScreen.routeName,
                    (_) => false,
                  );
                }
              }),
            ),
            Text(
              'CoinStalk',
              style: Theme.of(context).textTheme.headlineMedium,
            )
          ],
        ),
      ),
    );
  }
}
