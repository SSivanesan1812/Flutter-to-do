import 'package:flutter/material.dart';
import 'package:to_do_app/pages/home_page.dart';




void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Homepage(),
      theme: ThemeData(
        colorSchemeSeed: Colors.green,
        useMaterial3: true,
      )
    );
  }
}