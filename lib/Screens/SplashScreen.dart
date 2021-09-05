import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:learninghub/Const/Constants.dart';
import 'package:learninghub/Helper/sharedPref.dart';
import 'package:learninghub/MainScreens/HomePage.dart';

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
        SystemUiOverlayStyle(statusBarColor: Colors.white));
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 50),
          child: Center(
            child: SvgPicture.asset(
              "assets/images/logo.svg",
            ),
          ),
        ),
        Positioned(
          bottom: 100,
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
        // Duration(seconds: 4), token != null ? navigationHome : navigationLogin);
        Duration(seconds: 4),
        navigationLogin);
  }

  void navigationHome() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => HomePage()));
  }

  void navigationLogin() {
    print("login");
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (BuildContext context) => EnterNum()));
  }
}
