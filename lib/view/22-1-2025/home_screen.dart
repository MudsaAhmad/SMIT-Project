import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smit_project/Constants/constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home Screen'),
      actions: [
        GestureDetector(
          onTap: () async {

            SharedPreferences sp = await SharedPreferences.getInstance();
           String getName = sp.getString('name').toString();
           print('get name ----$getName');
            sp.clear();
            print('name removed----');

          },
            child: Icon(Icons.logout)),
      ],
      ),
    );
  }



}
