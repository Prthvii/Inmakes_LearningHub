import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:learninghub/API/SingleChapterApi.dart';
import 'package:learninghub/Const/Constants.dart';
import 'package:learninghub/Helper/snackbar_toast_helper.dart';
import 'package:learninghub/Screens/SingleChapterScreen.dart';

class SingleSubjectsList extends StatefulWidget {
  final id;
  final name;
  SingleSubjectsList({this.id, this.name});

  @override
  _SingleSubjectsListState createState() => _SingleSubjectsListState();
}

class _SingleSubjectsListState extends State<SingleSubjectsList> {
  var arrChapters = [];
  var status = '';
  var isLoading = true;

  void initState() {
    super.initState();

    print("xoxoxo");
    this.getSubject();
    setState(() {});
  }

  Future<String> getSubject() async {
    var rsp = await SingleChapterApi(widget.id);
    print(rsp);
    print("single chapter");

    status = rsp["attributes"]["status"];

    if (rsp['attributes']['status'].toString() == "Success") {
      setState(() {
        arrChapters = rsp["attributes"]["chapters"];
        print("arrChapters");
        print(rsp["attributes"]["status"]);
      });
    } else {
      showToastSuccess(
          "No chapters are available right now. Please check later");
    }
    setState(() {
      isLoading = false;
    });
    return "0";
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(0.01),
          child: AppBar(
            brightness: Brightness.dark,
            backgroundColor: BlckColor,
          ),
        ),
        body: isLoading == true
            ? Center(
                child: SpinKitFadingCube(
                color: buttonGreen,
                size: 20,
              ))
            : status == "Error"
                ? Container(
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/images/no.png",
                            width: MediaQuery.of(context).size.width * 0.6,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Oops! No chapters are available right now",
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
                      ),
                    ),
                  )
                : NestedScrollView(
                    headerSliverBuilder:
                        (BuildContext context, bool innerBoxIsScrolled) {
                      return <Widget>[
                        SliverAppBar(
                          backgroundColor: BlckColor,
                          expandedHeight:
                              MediaQuery.of(context).size.height * 0.35,
                          leading: Padding(
                            padding: const EdgeInsets.only(
                                left: 20, top: 10, bottom: 10),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
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
                          floating: false,
                          automaticallyImplyLeading: false,
                          pinned: true,
                          flexibleSpace: FlexibleSpaceBar(
                            title: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.name,
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                                // SizedBox(
                                //   height: 10,
                                // ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.radio_button_checked,
                                      color: buttonGreen,
                                      size: 10,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      arrChapters.length.toString() +
                                          " Chapters",
                                      style: TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.w500,
                                          color: buttonGreen),
                                    ),
                                    SizedBox(
                                      width: 15,
                                    ),
                                    Icon(
                                      Icons.timer,
                                      color: buttonGreen,
                                      size: 10,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      "124 hours",
                                      style: TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.w500,
                                          color: buttonGreen),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            background: Container(
                              height: MediaQuery.of(context).size.height * 0.35,
                              width: double.infinity,
                              color: BlckColor,
                              // child: Stack(
                              //   children: [
                              //     Padding(
                              //       padding: EdgeInsets.symmetric(
                              //           horizontal: screenSize.height * 0.05,
                              //           vertical: screenSize.height * 0.07),
                              //       child: Column(
                              //         mainAxisAlignment: MainAxisAlignment.end,
                              //         crossAxisAlignment: CrossAxisAlignment.start,
                              //         children: [
                              //           Text(
                              //             "Biology",
                              //             style: TextStyle(
                              //                 fontSize: 26,
                              //                 fontWeight: FontWeight.bold,
                              //                 color: Colors.white),
                              //           ),
                              //           SizedBox(
                              //             height: 10,
                              //           ),
                              //           Row(
                              //             children: [
                              //               Icon(
                              //                 Icons.radio_button_checked,
                              //                 color: buttonGreen,
                              //                 size: 15,
                              //               ),
                              //               SizedBox(
                              //                 width: 5,
                              //               ),
                              //               Text(
                              //                 "12 Chapters",
                              //                 style: TextStyle(
                              //                     fontSize: 12,
                              //                     fontWeight: FontWeight.w500,
                              //                     color: buttonGreen),
                              //               ),
                              //               SizedBox(
                              //                 width: 15,
                              //               ),
                              //               Icon(
                              //                 Icons.radio_button_checked,
                              //                 color: buttonGreen,
                              //                 size: 15,
                              //               ),
                              //               SizedBox(
                              //                 width: 5,
                              //               ),
                              //               Text(
                              //                 "124 hours",
                              //                 style: TextStyle(
                              //                     fontSize: 12,
                              //                     fontWeight: FontWeight.w500,
                              //                     color: buttonGreen),
                              //               ),
                              //             ],
                              //           )
                              //         ],
                              //       ),
                              //     ),
                              //   ],
                              // ),
                            ),
                          ),
                        ),
                      ];
                    },
                    body: Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Scrollbar(
                        child: ListView.separated(
                          scrollDirection: Axis.vertical,
                          // physics: BouncingScrollPhysics(),
                          separatorBuilder: (context, index) => SizedBox(
                            height: 15,
                          ),
                          shrinkWrap: true,
                          itemCount:
                              arrChapters != null ? arrChapters.length : 0,
                          itemBuilder: (context, index) {
                            final item =
                                arrChapters != null ? arrChapters[index] : null;

                            return CardsList(item, index);
                          },
                        ),
                      ),
                    ),
                  ));
  }

  // Widget Crads() {
  //   return ListView.separated(
  //     scrollDirection: Axis.vertical,
  //     physics: BouncingScrollPhysics(),
  //     separatorBuilder: (context, index) => SizedBox(
  //       height: 10,
  //     ),
  //     shrinkWrap: true,
  //     itemCount: arrChapters != null ? arrChapters.length : 0,
  //     itemBuilder: (context, index) {
  //       final item = arrChapters != null ? arrChapters[index] : null;
  //       return CardsList(item, index);
  //     },
  //   );
  // }

  CardsList(var item, int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => SingleChapterScreen(
                    subId: item["subjectId"].toString(),
                    ChptrNo: item["chapterNo"].toString())),
          );
        },
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  spreadRadius: 1,
                  blurRadius: 1,
                  offset: Offset(0, 0),
                )
              ]),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item["chapterName"].toString(),
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.radio_button_checked,
                      color: GreyTxtClr,
                      size: 15,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      item["totalParts"].toString() + " Chapters",
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: GreyTxtClr),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Icon(
                      Icons.timer,
                      color: GreyTxtClr,
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
                          color: GreyTxtClr),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
