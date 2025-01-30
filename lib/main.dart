import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:smit_project/view/29-1-2025/login_screen.dart';
import 'package:smit_project/view/30-1-2025/get_api_screen.dart';
import 'package:smit_project/view/badge_achieve_screen.dart';

import 'view/21-1-2025/login_screen.dart';

void main() async {
  // Initialize Hive
  await Hive.initFlutter();
  var box = await Hive.openBox('testBox');
  runApp(MyApp());
}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        //  debugShowCheckedModeBan ner: false,
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const GetApiScreen(),
      ),
    );
  }
}
