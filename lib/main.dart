import 'package:cointicker/bloc/auth/auth_bloc.dart';
import 'package:cointicker/bloc/crypto/crypto_bloc.dart';
import 'package:cointicker/bloc/news/news_bloc.dart';
import 'package:cointicker/constants/theme_data.dart';
import 'package:cointicker/firebase_options.dart';
import 'package:cointicker/router/router.dart';
import 'package:cointicker/services/service_locator.dart';
import 'package:cointicker/services/theme_service.dart';
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
          create: (context) => CryptoBloc(
            context.read<AuthBloc>(),
          ),
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
              builder: (_, ThemeMode currentMode, __) => MaterialApp.router(
                debugShowCheckedModeBanner: false,
                theme: lightTheme,
                darkTheme: darkTheme,
                themeMode: currentMode,
                routerConfig: router,
              ),
            );
          },
        ),
      ),
    );
  }
}
