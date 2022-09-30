import 'package:cointicker/screens/price_screen.dart';
import 'package:cointicker/screens/seach_screen.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const PriceScreen(),
        initialRoute: PriceScreen.routeName,
        routes: {
          PriceScreen.routeName: (context) => const PriceScreen(),
          SearchScreen.routeName: (context) => SearchScreen(),
        },
      );
    },
    );
  }
}
