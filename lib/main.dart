import 'package:cointicker/screens/about_screen.dart';
import 'package:cointicker/screens/price_screen.dart';
import 'package:cointicker/screens/news_screen.dart';
import 'package:cointicker/widgets/bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const BottomNavBar(),
          initialRoute:  BottomNavBar.routeName,
          routes: {
            PriceScreen.routeName: (context) => const PriceScreen(),
            NewsScreen.routeName: (context) => const NewsScreen(),
            AboutScreen.routeName: (context) => const AboutScreen()
          },
        );
      },
    );
  }
}
