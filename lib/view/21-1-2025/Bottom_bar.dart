import 'package:flutter/material.dart';
import 'package:smit_project/view/21-1-2025/profile_screen.dart';
import 'package:smit_project/view/21-1-2025/setting_screen.dart';
import 'package:smit_project/view/home_screen2.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});
  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    final List<Widget> screens = [
      const HomeScreen2(),
      const SettingScreen(),
      const ProfileScreen(),
    ];
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        backgroundColor: Colors.grey.shade200,
        onTap: (int index) {
          setState(() {
            currentIndex = index;
            print('index changed -------> $currentIndex');
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home,
                color: currentIndex == 0 ? Colors.black : Colors.grey),
            label: 'Home',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings,
                  color: currentIndex == 1 ? Colors.black : Colors.grey),
              label: 'Setting'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person,
                  color: currentIndex == 2 ? Colors.black : Colors.grey),
              label: 'Profile'),
        ],
        selectedItemColor: const Color(0xff8338EC),
        unselectedItemColor: const Color(0xffB9B9B9),
        // selectedLabelStyle: GoogleFonts.poppins(fontSize: 11,fontWeight: FontWeight.w500),
        // unselectedLabelStyle: GoogleFonts.poppins(fontSize: 11,fontWeight: FontWeight.w500),
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
