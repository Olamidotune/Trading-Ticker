import 'package:cointicker/bloc/coin/coin_bloc.dart';
import 'package:cointicker/screens/about_screen.dart';
import 'package:cointicker/screens/price_screen.dart';
import 'package:cointicker/screens/news_screen.dart';
import 'package:cointicker/services/service_locator.dart';
import 'package:cointicker/widgets/bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();

//   await dotenv.load();
//   await setupLocator();

//   runApp(const MyApp());
// }

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

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
        )
      ],
      child: Sizer(
        builder: (context, orientation, deviceType) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: const BottomNavBar(),
            initialRoute: BottomNavBar.routeName,
            routes: {
              PriceScreen.routeName: (context) => const PriceScreen(),
              NewsScreen.routeName: (context) => const NewsScreen(),
              AboutScreen.routeName: (context) => const AboutScreen()
            },
          );
        },
      ),
    );
  }
}
