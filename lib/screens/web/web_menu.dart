import 'package:flutter/material.dart';

class WebMenuScreen extends StatelessWidget {
  const WebMenuScreen({super.key});

  static const String routeName = "/web/menu";

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [Text("THhis is the web Home Screen")]),
      ),
    );
  }
}
