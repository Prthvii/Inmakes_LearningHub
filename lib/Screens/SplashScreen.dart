import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:learninghub/Const/Constants.dart';
import 'package:learninghub/Helper/sharedPref.dart';
import 'package:learninghub/Widgets/newBottomNav.dart';

import 'EnterNum.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    this._loadWidget();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(children: [
        Container(
          height: MediaQuery.of(context).size.height * 1,
          width: MediaQuery.of(context).size.width * 1,
          child: Image.asset(
            "assets/images/Place Holder.jpg",
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          bottom: MediaQuery.of(context).size.height * 0.18,
          left: 0,
          right: 0,
          child: SpinKitFoldingCube(
            color: buttonGreen,
            size: 25,
          ),
        )
      ]),
    );
  }

  _loadWidget() async {
    var token = await getSharedPrefrence(TOKEN);
    print("tokennnn");
    print(token);
    return Timer(
        Duration(seconds: 4), token != null ? navigationHome : navigationLogin);
  }

  void navigationHome() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => newBottom()));
  }

  void navigationLogin() {
    print("login");
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (BuildContext context) => EnterNum()));
  }
}
