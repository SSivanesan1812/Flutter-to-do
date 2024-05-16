import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:to_do_app/pages/home_page.dart';




void main()async {
  await Hive.initFlutter();
  final box=await Hive.openBox("ToDoDb");

  runApp( MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({super.key});
   

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