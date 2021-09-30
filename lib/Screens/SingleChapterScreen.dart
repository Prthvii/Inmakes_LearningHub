import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:learninghub/API/ChapterVideosList.dart';
import 'package:learninghub/Const/Constants.dart';
import 'package:learninghub/Helper/snackbar_toast_helper.dart';
import 'package:learninghub/SingleChapterTabs/ChapterTestTab.dart';
import 'package:learninghub/SingleChapterTabs/QNTab.dart';
import 'package:learninghub/SingleChapterTabs/ResourcesTab.dart';
import 'package:learninghub/SingleChapterTabs/VideosTab.dart';
import 'package:lottie/lottie.dart';

class SingleChapterScreen extends StatefulWidget {
  final subId;

  final ChptrNo;
  SingleChapterScreen({this.subId, this.ChptrNo});

  @override
  _SingleChapterScreenState createState() => _SingleChapterScreenState();
}

class _SingleChapterScreenState extends State<SingleChapterScreen> {
  var isLoading = true;
  var isLottieLoading = false;
  var arrVideos = [];
  void initState() {
    super.initState();

    print("xoxoxo");
    this.getChapters();
    setState(() {});
  }

  Future<String> getChapters() async {
    var rsp = await ChapterVideosListApi(widget.subId, widget.ChptrNo);
    print(rsp);
    if (rsp['attributes']['status'].toString() == "Success") {
      setState(() {
        arrVideos = rsp["attributes"]["videos"];
        print("arrVideos");
        print(arrVideos);
      });
    } else {
      showToastSuccess("No Videos are available right now. Please check later");
    }
    setState(() {
      isLoading = false;
    });
    return "0";
  }

  @override
  Widget build(BuildContext context) {
    // SystemChrome.setSystemUIOverlayStyle(
    //     SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return Scaffold(
      // appBar: PreferredSize(
      //   preferredSize: Size.fromHeight(1.0),
      //   child: AppBar(
      //     elevation: 0,
      //     backgroundColor: BlckColor,
      //     brightness: Brightness.dark,
      //   ),
      // ),
      backgroundColor: BlckColor,
      body: isLoading == true
          ? Container(
              color: Colors.white,
              child: Center(
                  child: SpinKitFadingCube(
                color: buttonGreen,
                size: 20,
              )),
            )
          : arrVideos.length == 0
              ? Container(
                  color: Colors.white,
                  child: Center(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Lottie.asset(
                        "assets/lottie/nodata.json",
                        repeat: false,
                      ),
                      Text(
                        "No videos available right now!",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 18),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      InkWell(
                        splashColor: Colors.green[900],
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: buttonGreen),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            child: Text(
                              "Go Back",
                              style: Txt12Semi,
                            ),
                          ),
                        ),
                      )
                    ],
                  )),
                )
              : Column(
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
                                  Positioned(
                                      right: 0,
                                      top: 0,
                                      child: Image.asset(
                                        "assets/images/Art 10.png",
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.35,
                                      )),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 35),
                                    child: Align(
                                      alignment: Alignment.topCenter,
                                      child: Text(
                                        arrVideos[0]["subjectName"].toString(),
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20, top: 40),
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
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              border: Border.all(
                                                  color: GreyTxtClr)),
                                          child: Padding(
                                            padding:
                                                const EdgeInsets.only(left: 6),
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          arrVideos[0]["chapterName"]
                                              .toString(),
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
                                              arrVideos.length == 1
                                                  ? arrVideos.length
                                                          .toString() +
                                                      " Video"
                                                  : arrVideos.length
                                                          .toString() +
                                                      " Videos",
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w500,
                                                  color: buttonGreen),
                                            ),
                                            SizedBox(
                                              width: 15,
                                            ),
                                            Icon(
                                              Icons.timer,
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
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.06,
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
                                          indicatorColor: buttonGreen,
                                          indicatorWeight: 4,
                                          unselectedLabelColor: GreyTxtClr,
                                          unselectedLabelStyle: TextStyle(
                                              fontWeight: FontWeight.w300,
                                              fontSize: 14),
                                          automaticIndicatorColorAdjustment:
                                              true,
                                          // labelStyle: bold14,
                                        ),
                                      ),
                                      Container(
                                        color: Colors.white,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.58,
                                        child: TabBarView(
                                          children: [
                                            Videostab(array: arrVideos),
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
