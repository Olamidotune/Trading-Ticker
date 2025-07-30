import 'package:cointicker/bloc/auth/auth_bloc.dart';
import 'package:cointicker/bloc/coin/coin_bloc.dart';
import 'package:cointicker/bloc/news/news_bloc.dart';
import 'package:cointicker/constants/theme_data.dart';
import 'package:cointicker/firebase_options.dart';
import 'package:cointicker/screens/about_screen.dart';
import 'package:cointicker/screens/auth/sign_in_screen.dart';
import 'package:cointicker/screens/auth/sign_up_screen.dart';
import 'package:cointicker/screens/price_screen.dart';
import 'package:cointicker/screens/news_screen.dart';
import 'package:cointicker/services/service_locator.dart';
import 'package:cointicker/widgets/bottom_nav_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toastification/toastification.dart';

final themeModeNotifier = ValueNotifier(ThemeMode.system);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await dotenv.load();
  await setupLocator();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CoinBloc>(
          create: (context) => CoinBloc(),
        ),
        BlocProvider<NewsBloc>(
          create: (context) => NewsBloc(),
        ),
        BlocProvider<AuthBloc>(
          create: (context) => AuthBloc(FirebaseAuth.instance),
        ),
      ],
      child: ToastificationWrapper(
        child: Sizer(
          builder: (context, orientation, deviceType) {
            return ValueListenableBuilder<ThemeMode>(
              valueListenable: themeModeNotifier,
              builder: (_, ThemeMode currentMode, __) => MaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'Flutter Demo',
                theme: lightTheme,
                darkTheme: darkTheme,
                themeMode: currentMode,
                initialRoute: SignUpScreen.routeName,
                routes: {
                  BottomNavBar.routeName: (context) => const BottomNavBar(),
                  PriceScreen.routeName: (context) => const PriceScreen(),
                  NewsScreen.routeName: (context) => const NewsScreen(),
                  AboutScreen.routeName: (context) => const AboutScreen(),
                  SignUpScreen.routeName: (context) => const SignUpScreen(),
                  SignInScreen.routeName: (context) => const SignInScreen(),
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
