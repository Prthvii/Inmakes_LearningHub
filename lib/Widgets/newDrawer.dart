// import 'package:flutter/material.dart';
// import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
// import 'package:learninghub/MainScreens/HomePage.dart';
//
// import 'menu.dart';
//
// class NewDrawer extends StatefulWidget {
//   // const NewDrawer({Key? key}) : super(key: key);
//
//   @override
//   _NewDrawerState createState() => _NewDrawerState();
// }
//
// class _NewDrawerState extends State<NewDrawer> {
//   String title;
//
//   GlobalKey<SliderMenuContainerState> _key =
//       new GlobalKey<SliderMenuContainerState>();
//   void initState() {
//     title = "Home";
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return SliderMenuContainer(
//         appBarColor: Colors.white,
//         key: _key,
//         sliderMenuOpenSize: 200,
//         title: Text(
//           "title",
//           style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
//         ),
//         sliderMenu: MenuWidget(
//           onItemClick: (title) {
//             _key.currentState.closeDrawer();
//             setState(() {
//               this.title = title;
//             });
//           },
//         ),
//         sliderMain: HomePage());
//   }
// }
