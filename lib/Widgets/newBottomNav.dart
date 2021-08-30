import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:learninghub/Const/Constants.dart';
import 'package:learninghub/MainScreens/Contacts.dart';
import 'package:learninghub/MainScreens/ExamsPage.dart';
import 'package:learninghub/MainScreens/HomePage.dart';
import 'package:learninghub/MainScreens/ProfilePage.dart';
import 'package:learninghub/MainScreens/RecentPage.dart';

class newBottom extends StatefulWidget {
  @override
  _newBottomState createState() => _newBottomState();
}

class _newBottomState extends State<newBottom> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.w600);
  List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    RecentPage(),
    ExamsPage(),
    ProfilePage(),
    Contacts(),
  ];
  List<GButton> _navBarsItems() {
    return [
      GButton(
        icon: _selectedIndex == 0 ? Icons.home : Icons.home_outlined,
        text: 'Home',
      ),
      GButton(
        icon: _selectedIndex == 1
            ? Icons.play_arrow_rounded
            : CupertinoIcons.play_arrow,
        text: 'Recent',
      ),
      GButton(
        icon: _selectedIndex == 2 ? Icons.article : Icons.article_outlined,
        text: 'Exams',
      ),
      GButton(
        icon: _selectedIndex == 3
            ? CupertinoIcons.person_fill
            : CupertinoIcons.person,
        text: 'Profile',
      ),
      GButton(
        icon: _selectedIndex == 4
            ? CupertinoIcons.envelope_fill
            : CupertinoIcons.envelope,
        text: 'Contact',
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: Container(
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black.withOpacity(.1),
            )
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            child: GNav(
              rippleColor: Colors.grey[300],
              hoverColor: Colors.grey[100],
              gap: 5,
              activeColor: buttonGreen,
              iconSize: 24,
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 12),
              duration: Duration(milliseconds: 400),
              tabBackgroundColor: Colors.white,
              color: greyClr,
              tabs: _navBarsItems(),
              selectedIndex: _selectedIndex,
              onTabChange: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}
