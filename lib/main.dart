import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:smit_project/view/29-1-2025/login_screen.dart';

import 'view/21-1-2025/login_screen.dart';

void main() async {
  // Initialize Hive
  await Hive.initFlutter();
  var box = await Hive.openBox('testBox');
  runApp( MyApp());
}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {

   MyApp({super.key});

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
      home: const LoginScreenPOSTAPI(),
    );
  }
}
