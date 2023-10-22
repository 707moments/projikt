import 'package:appdevproject/loginscreen.dart';
import 'package:appdevproject/schedule_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:appdevproject/main.dart';
import 'package:appdevproject/profile_screen.dart';

class CustomNavBar extends StatefulWidget {
  @override
  _CustomNavBarState createState() => _CustomNavBarState();
  
}

class _CustomNavBarState extends State<CustomNavBar> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    if (ModalRoute.of(context)?.settings.name == '/home') {
      _selectedIndex = 0;
    } else if (ModalRoute.of(context)?.settings.name == '/schedule') {
      _selectedIndex = 2;
    } else if (ModalRoute.of(context)?.settings.name == '/payment') {
      _selectedIndex = 3;
    } else if (ModalRoute.of(context)?.settings.name == '/profile') {
      _selectedIndex = 4;
    }

    return GNav(
      rippleColor: Colors.grey[300]!,
      hoverColor: const Color.fromARGB(255, 34, 16, 16)!,
      tabActiveBorder: Border.all(color: Color(0xff4cc55c), width: 1),
      gap: 8,
      iconSize: 24,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      duration: Duration(milliseconds: 400),
      tabs: [
        GButton(
          icon: LineIcons.home,
          text: 'Home',
          iconColor: Color.fromRGBO(16, 48, 89, 1),
          onPressed: () {
            Navigator.pushNamed(context, '/home');
          },
        ),
        GButton(
          icon: LineIcons.commentAlt,
          text: 'Chat',
        ),
        GButton(
          icon: LineIcons.calendar,
          text: 'Schedule',
          onPressed: () {
            Navigator.pushNamed(context, '/schedule');
          },
        ),
        GButton(
          icon: LineIcons.receipt,
          text: 'Pay',
          onPressed: () {
            Navigator.pushNamed(context, '/payment');
          },
        ),
        GButton(
          icon: LineIcons.user,
          text: 'Profile',
          onPressed: () {
            Navigator.pushNamed(context, '/profile');
          },
        ),
      ],
      selectedIndex: _selectedIndex,
      onTabChange: (index) {
        setState(() {
          _selectedIndex = index;
        });
      },
    );
  }
}
