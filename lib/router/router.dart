import 'package:cointicker/screens/auth/forgot_password_screen.dart';
import 'package:cointicker/screens/auth/sign_in_screen.dart';
import 'package:cointicker/screens/auth/sign_up_screen.dart';
import 'package:cointicker/screens/onboarding/onboarding.dart';
import 'package:cointicker/screens/onboarding/splash_screen.dart';
import 'package:cointicker/screens/tabs/home_screen.dart';
import 'package:cointicker/screens/tabs/layout.dart';
import 'package:cointicker/screens/tabs/markets_screen.dart';
import 'package:cointicker/screens/tabs/menu_screen.dart';
import 'package:cointicker/screens/tabs/news_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
    initialLocation: kIsWeb ? HomeScreen.routeName : SplashScreen.routeName,
    errorBuilder: (context, state) => Scaffold(
          body: Center(
            child: Text(state.error.toString()),
          ),
        ),
    routes: [
      StatefulShellRoute.indexedStack(
          builder: (context, state, navigationShell) => Layout(
                navigationShell: navigationShell,
              ),
          branches: [
            StatefulShellBranch(routes: [
              GoRoute(
                path: HomeScreen.routeName,
                builder: (context, state) => const HomeScreen(),
              )
            ]),
            StatefulShellBranch(routes: [
              GoRoute(
                path: MarketsScreen.routeName,
                builder: (context, state) => const MarketsScreen(),
              )
            ]),
            StatefulShellBranch(routes: [
              GoRoute(
                path: NewsScreen.routeName,
                builder: (context, state) => const NewsScreen(),
              )
            ]),
            StatefulShellBranch(routes: [
              GoRoute(
                path: MenuScreen.routeName,
                builder: (context, state) => const MenuScreen(),
              )
            ])
          ]),
      GoRoute(
        path: SplashScreen.routeName,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: OnboardingScreen.routeName,
        builder: (context, state) => const OnboardingScreen(),
      ),
      GoRoute(
        path: SignInScreen.routeName,
        builder: (context, state) => const SignInScreen(),
      ),
      GoRoute(
        path: SignUpScreen.routeName,
        builder: (context, state) => const SignUpScreen(),
      ),
      GoRoute(
        path: ForgotPasswordScreen.routeName,
        builder: (context, state) => const ForgotPasswordScreen(),
      )
    ]);
