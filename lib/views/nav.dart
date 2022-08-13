import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:health_remit/views/remiders.dart';

import '../controller/constants.dart';
import 'home.dart';
import 'profile.dart';

class ButtomNavScreen extends StatefulWidget {
  ButtomNavScreen({Key? key}) : super(key: key);

  @override
  State<ButtomNavScreen> createState() => _ButtomNavScreenState();
}

class _ButtomNavScreenState extends State<ButtomNavScreen> {
  final screens = [
    const HomePage(),
    const Profile(),
    Reminders(),
  ];
  int _currnetIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false, // <-- HERE
        showUnselectedLabels: false, // <
        // type: BottomNavigationBarType.fixed,
        selectedItemColor: buttomColor,
        unselectedItemColor: Colors.black,
        currentIndex: _currnetIndex,
        selectedFontSize: 14,
        unselectedFontSize: 14,
        onTap: (value) {
          setState(() {
            if (value == 3) {
              Navigator.maybePop(context);
            }
            _currnetIndex = value;
          });
          // print(value);
        },

        // onTap: (index) {
        //   setState(() => currnetIndex = index);
        // },
        items: const [
          BottomNavigationBarItem(
            label: 'Home',
            icon: Icon(Icons.home_outlined),
          ),
          BottomNavigationBarItem(
            label: 'Profile',
            icon: Icon(Icons.group_outlined),
          ),
          BottomNavigationBarItem(
            label: 'Reminder',
            icon: Icon(Icons.notifications_outlined),
          ),
          // BottomNavigationBarItem(
          //   label: 'Back',
          //   icon: Icon(Icons.arrow_back_ios_outlined),
          // ),
        ],
      ),
      body: screens[_currnetIndex],
    );
  }
}
