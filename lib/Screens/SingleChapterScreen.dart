import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learninghub/Const/Constants.dart';
import 'package:learninghub/SingleChapterTabs/ChapterTestTab.dart';
import 'package:learninghub/SingleChapterTabs/QNTab.dart';
import 'package:learninghub/SingleChapterTabs/ResourcesTab.dart';
import 'package:learninghub/SingleChapterTabs/VideosTab.dart';

class SingleChapterScreen extends StatefulWidget {
  // const SingleChapterScreen({Key? key}) : super(key: key);

  @override
  _SingleChapterScreenState createState() => _SingleChapterScreenState();
}

class _SingleChapterScreenState extends State<SingleChapterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BlckColor,
      body: Column(
        children: [
          Container(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.35,
                    width: double.infinity,
                    color: BlckColor,
                    child: Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 35),
                          child: Align(
                            alignment: Alignment.topCenter,
                            child: Text(
                              "Biology",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 30, top: 30),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: GestureDetector(
                              onTap: () {
                                Navigator.of(context).pop();
                              },
                              child: Container(
                                height: 35,
                                width: 35,
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
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30, vertical: 45),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Long chapter name can be shown here.",
                                style: TextStyle(
                                    fontSize: 26,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.radio_button_checked,
                                    color: buttonGreen,
                                    size: 15,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "12 Chapters",
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                        color: buttonGreen),
                                  ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Icon(
                                    Icons.radio_button_checked,
                                    color: buttonGreen,
                                    size: 15,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "124 hours",
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                        color: buttonGreen),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  DefaultTabController(
                      length: 4,
                      child: Container(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.height * 0.06,
                              color: BlckColor,
                              child: TabBar(
                                isScrollable: true,
                                tabs: [
                                  Tab(
                                    text: "Videos",
                                  ),
                                  Tab(text: "Chapter Test"),
                                  Tab(text: "Resources"),
                                  Tab(text: "QN Bank"),
                                ],
                                indicatorColor: buttonGreen, indicatorWeight: 4,
                                unselectedLabelColor: GreyTxtClr,
                                unselectedLabelStyle: TextStyle(
                                    fontWeight: FontWeight.w300, fontSize: 14),
                                automaticIndicatorColorAdjustment: true,
                                // labelStyle: bold14,
                              ),
                            ),
                            Container(
                              color: Colors.white,
                              height: MediaQuery.of(context).size.height * 0.58,
                              child: TabBarView(
                                children: [
                                  Videostab(),
                                  ChapterTestTab(),
                                  ResourcesTab(),
                                  QNTab(),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
