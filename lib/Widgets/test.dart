import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learninghub/Const/Constants.dart';
import 'package:learninghub/Screens/SingleChapterScreen.dart';

class test extends StatefulWidget {
  // const test({Key? key}) : super(key: key);

  @override
  _testState createState() => _testState();
}

class _testState extends State<test> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0.1),
        child: AppBar(
          brightness: Brightness.dark,
          backgroundColor: BlckColor,
        ),
      ),
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              backgroundColor: BlckColor,
              expandedHeight: MediaQuery.of(context).size.height * 0.35,
              leading: Padding(
                padding: const EdgeInsets.only(left: 20, top: 10, bottom: 10),
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
              floating: false,
              automaticallyImplyLeading: false,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                // centerTitle: true,
                title: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Biology",
                      style: TextStyle(
                          fontSize: 20,
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
                          size: 10,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "12 Chapters",
                          style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w500,
                              color: buttonGreen),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Icon(
                          Icons.radio_button_checked,
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
          child: CupertinoScrollbar(
            child: ListView.separated(
              scrollDirection: Axis.vertical,
              // physics: BouncingScrollPhysics(),
              separatorBuilder: (context, index) => SizedBox(
                height: 10,
              ),
              shrinkWrap: true,
              itemCount: 5,
              itemBuilder: (context, index) {
                return CardsList(index);
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget Crads() {
    return ListView.separated(
      scrollDirection: Axis.vertical,
      physics: BouncingScrollPhysics(),
      separatorBuilder: (context, index) => SizedBox(
        height: 10,
      ),
      shrinkWrap: true,
      itemCount: 5,
      itemBuilder: (context, index) {
        return CardsList(index);
      },
    );
  }

  CardsList(int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SingleChapterScreen()),
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
              children: [
                Text(
                  "Long chapter name can be shown here.",
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
                      "12 Chapters",
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: GreyTxtClr),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Icon(
                      Icons.radio_button_checked,
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
