import 'package:flutter/material.dart';
import 'package:learninghub/Const/Constants.dart';
import 'package:learninghub/Screens/LiveClassTab.dart';

class LiveClasses extends StatefulWidget {
  @override
  _LiveClassesState createState() => _LiveClassesState();
}

class _LiveClassesState extends State<LiveClasses> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: BlckColor,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(80.0),
          child: AppBar(
            brightness: Brightness.dark,
            bottom: TabBar(
              labelPadding: EdgeInsets.symmetric(vertical: 5),
              indicatorColor: buttonGreen,
              unselectedLabelStyle: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: Colors.white54),
              labelStyle: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Colors.white),
              tabs: [
                Text(
                  "Ongoing Live Classes",
                ),
                Text(
                  "Upcoming Live Classes ",
                ),
              ],
            ),
            title: Text(
              "Live Classes",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            backgroundColor: BlckColor,
            elevation: 0,
            leading: GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  // height: 35,
                  // width: 35,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: GreyTxtClr)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 6),
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: buttonGreen,
                      size: 13,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        body: TabBarView(
          children: [Live(), Text("22")],
        ),
      ),
    );
  }
}
