import 'package:flutter/material.dart';
import 'package:smit_project/view/21-1-2025/login_screen.dart';
import 'package:smit_project/view/22-1-2025/login_screen.dart';
import 'package:smit_project/view/home_screen2.dart';

void main() {
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
      home: const LoginScreen2(),
    );
  }
}
