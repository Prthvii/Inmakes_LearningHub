import 'package:flutter/material.dart';

import 'Screens/schoolBoradSelect.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue, fontFamily: 'Gilory'),
      home: SelectSchoolBoard(),
      // home: SplashScreen(),
    );
  }
}
