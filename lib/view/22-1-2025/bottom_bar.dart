

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smit_project/view/21-1-2025/profile_screen.dart';
import 'package:smit_project/view/21-1-2025/setting_screen.dart';
import 'package:smit_project/view/22-1-2025/home_screen.dart';

class BottomBar2 extends StatefulWidget {
  const BottomBar2({super.key});


  @override
  State<BottomBar2> createState() => _BottomBar2State();
}

class _BottomBar2State extends State<BottomBar2> {

  int currentIndex = 0;

  List<Widget> screens = [
    HomeScreen(),
    SettingScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (int index){
          setState(() {
            currentIndex = index;
          });
        },
        currentIndex: currentIndex,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Setting',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
