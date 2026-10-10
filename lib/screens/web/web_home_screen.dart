import 'package:flutter/material.dart';

class WebHomeScreen extends StatelessWidget {
  const WebHomeScreen({super.key});

  static const String routeName = "/web/home";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [Text("THhis is the web Home Screen")]),
      ),
    );
  }
}
