import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:learninghub/Widgets/Drawer.dart';

import '../BottomNav.dart';

class NewDrawer extends StatefulWidget {
  // const NewDrawer({Key? key}) : super(key: key);

  @override
  _NewDrawerState createState() => _NewDrawerState();
}

class _NewDrawerState extends State<NewDrawer> {
  final _drawerController = ZoomDrawerController();
  final List<MenuItem> options = [
    MenuItem(Icons.payment, 'Payments'),
    MenuItem(Icons.favorite, 'Discounts'),
    MenuItem(Icons.notifications, 'Notification'),
    MenuItem(Icons.format_list_bulleted, 'Orders'),
    MenuItem(Icons.help, 'Help'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ZoomDrawer(
        controller: _drawerController,
        style: DrawerStyle.Style1,
        menuScreen: DrawerWidget(),
        mainScreen: BottomNav(),
        borderRadius: 24.0,
        showShadow: true,
        angle: 0.0,
        backgroundColor: Colors.grey[300],
        slideWidth: MediaQuery.of(context).size.width * 0.65,
        openCurve: Curves.fastOutSlowIn,
        closeCurve: Curves.bounceIn,
      ),
    );
  }
}

class MenuItem {
  String title;
  IconData icon;
  MenuItem(this.icon, this.title);
}
