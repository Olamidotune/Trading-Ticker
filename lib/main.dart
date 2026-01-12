import 'package:cointicker/bloc/auth/auth_bloc.dart';
import 'package:cointicker/bloc/coin/crypto_bloc.dart';
import 'package:cointicker/bloc/news/news_bloc.dart';
import 'package:cointicker/constants/theme_data.dart';
import 'package:cointicker/firebase_options.dart';
import 'package:cointicker/screens/auth/forgot_password_screen.dart';
import 'package:cointicker/screens/tabs/menu_screen.dart';
import 'package:cointicker/screens/auth/sign_in_screen.dart';
import 'package:cointicker/screens/auth/sign_up_screen.dart';
import 'package:cointicker/screens/onboarding/onboarding.dart';
import 'package:cointicker/screens/onboarding/splash_screen.dart';
import 'package:cointicker/screens/tabs/home_screen.dart';
import 'package:cointicker/screens/tabs/news_screen.dart';
import 'package:cointicker/services/service_locator.dart';
import 'package:cointicker/services/theme_service.dart';
import 'package:cointicker/widgets/bottom_nav_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toastification/toastification.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await dotenv.load();
  await setupLocator();

  await ThemeService.initializeTheme();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (context) => AuthBloc(FirebaseAuth.instance),
        ),
        BlocProvider<CryptoBloc>(
          create: (context) =>
              CryptoBloc(context.read<AuthBloc>(), FirebaseAuth.instance),
        ),
        BlocProvider<NewsBloc>(
          create: (context) => NewsBloc(),
        ),
      ],
      child: ToastificationWrapper(
        child: Sizer(
          builder: (context, orientation, deviceType) {
            return ValueListenableBuilder<ThemeMode>(
              valueListenable: ThemeService.themeModeNotifier,
              builder: (_, ThemeMode currentMode, __) => MaterialApp(
                debugShowCheckedModeBanner: false,
                theme: lightTheme,
                darkTheme: darkTheme,
                themeMode: currentMode,
                initialRoute: SplashScreen.routeName,
                routes: {
                  SplashScreen.routeName: (context) => const SplashScreen(),
                  BottomNavBar.routeName: (context) => const BottomNavBar(),
                  HomeScreen.routeName: (context) => const HomeScreen(),
                  NewsScreen.routeName: (context) => const NewsScreen(),
                  MenuScreen.routeName: (context) => const MenuScreen(),
                  SignUpScreen.routeName: (context) => const SignUpScreen(),
                  SignInScreen.routeName: (context) => const SignInScreen(),
                  ForgotPasswordScreen.routeName: (context) =>
                      const ForgotPasswordScreen(),
                  OnboardingScreen.routeName: (context) =>
                      const OnboardingScreen()
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
