import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learnify_client/const/kcolor.dart';
import 'package:learnify_client/screens/setting_screen/setting_screen.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int selectIndex = 0;

  List<Widget> screens = [
    Center(
        child: Text(
      'Home',
      style: TextStyle(fontSize: 50),
    )),
    Center(
        child: Text(
      'Courses',
      style: TextStyle(fontSize: 50),
    )),
    Center(
        child: Text(
      'Favourite',
      style: TextStyle(fontSize: 50),
    )),
    SettingScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SizedBox(
        height: 90,
        child: BottomNavigationBar(
            selectedItemColor: Kcolor.mainColor,
            unselectedItemColor: Color(0xFF92929D),
            showSelectedLabels: true,
            showUnselectedLabels: true,
            currentIndex: selectIndex,
            type: BottomNavigationBarType.fixed,
            onTap: (index) {
              selectIndex = index;
              setState(() {});
            },
            selectedIconTheme: IconThemeData(size: 28),
            unselectedIconTheme: IconThemeData(size: 28),
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home_outlined), label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.article_outlined), label: 'Courses'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.people), label: 'Favourite'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.settings_outlined), label: 'Account')
            ]),
      ),
      body: screens[selectIndex],
    );
  }
}
