import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:smit_project/view/31-1-2025/hive_screen.dart';

import 'package:smit_project/view/5-2-2025/cache_screen.dart';
import 'package:smit_project/view/5-2-2025/hive_model.dart';



final Uri _url = Uri.parse('https://flutter.dev');


void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Hive
  await Hive.initFlutter();
  //var box = await Hive.openBox('testBox');

  Hive.registerAdapter(HiveModelAdapter());
  await Hive.openBox<HiveModel>('hiveBox');

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
        home: const HiveDataScreen(),
      ),
    );
  }
}
