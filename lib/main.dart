import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:smit_project/view/22-1-2025/login_screen.dart';
import 'package:smit_project/view/22-1-2025/hive_screen.dart';
import 'package:smit_project/view/23-1-2025/shared_prefrence_screen.dart';

void main() async {

  // Initialize Hive
  await Hive.initFlutter();
  var box = await Hive.openBox('testBox');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    //  debugShowCheckedModeBan ner: false,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HiveScreen(),
    );
  }
}
