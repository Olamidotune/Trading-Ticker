import 'package:flutter/material.dart';

class WebNewsScreen extends StatelessWidget {
  const WebNewsScreen({super.key});

  static const String routeName = "/web/news";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [Text("THhis is the web Home Screen")]),
      ),
    );
  }
}
