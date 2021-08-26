import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learninghub/Const/Constants.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import 'MainScreens/Contacts.dart';
import 'MainScreens/ExamsPage.dart';
import 'MainScreens/HomePage.dart';
import 'MainScreens/ProfilePage.dart';
import 'MainScreens/RecentPage.dart';

class BottomNav extends StatefulWidget {
  // const BottomNav({Key? key}) : super(key: key);

  @override
  _BottomNavState createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  List<Widget> _buildScreens() {
    return [
      // Home(),
      HomePage(),
      RecentPage(),
      ExamsPage(),
      ProfilePage(),
      Contacts(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
          icon: Icon(CupertinoIcons.house_alt_fill),
          title: ("Home"),
          activeColorPrimary: buttonGreen,
          inactiveColorPrimary: Color(0xffC2C2C2),
          iconSize: 25),
      PersistentBottomNavBarItem(
          icon: Icon(CupertinoIcons.play_arrow_solid),
          inactiveIcon: Icon(CupertinoIcons.play_arrow),
          // icon: Image(
          //   image: AssetImage("assets/images/play.png"),
          //   height: 15,
          // ),
          title: ("Recent"),
          activeColorPrimary: buttonGreen,
          inactiveColorPrimary: Color(0xffC2C2C2),
          iconSize: 25),
      PersistentBottomNavBarItem(
          activeColorPrimary: buttonGreen,
          inactiveColorPrimary: Color(0xffC2C2C2),
          icon: Icon(Icons.article),
          inactiveIcon: Icon(Icons.article_outlined),

          // icon: Image(
          //   image: AssetImage("assets/images/exam.png"),
          //   height: 15,
          // ),
          iconSize: 25,
          title: ("Exams"),
          textStyle: TextStyle(color: Colors.grey[600], fontSize: 13)),
      PersistentBottomNavBarItem(
          icon: Icon(
            CupertinoIcons.person_alt,
            color: Colors.green,
          ),
          inactiveIcon: Icon(CupertinoIcons.person),

          // icon: Image(
          //   image: AssetImage("assets/images/profile.png"),
          //   height: 15,
          // ),
          title: ("Profile"),
          textStyle: TextStyle(color: Colors.black, fontSize: 18),
          activeColorPrimary: buttonGreen,
          inactiveColorPrimary: Color(0xffC2C2C2),
          iconSize: 25),
      PersistentBottomNavBarItem(
          icon: Image(
            image: AssetImage("assets/images/contact.png"),
            height: 15,
          ),
          title: ("Contact"),
          activeColorPrimary: buttonGreen,
          inactiveColorPrimary: Color(0xffC2C2C2),
          iconSize: 20),
    ];
  }

  PersistentTabController _controller;
  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: Colors.white,
      handleAndroidBackButtonPress: true,
      hideNavigationBarWhenKeyboardShows: true,
      // hideNavigationBar: true,
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: Colors.white,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      margin: EdgeInsets.all(30),
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: ItemAnimationProperties(
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: ScreenTransitionAnimation(
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle: NavBarStyle.style1,
      bottomScreenMargin: 1,
      navBarHeight: 65,
    );
  }
}
