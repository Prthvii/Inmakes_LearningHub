import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:learninghub/Const/Constants.dart';
import 'package:learninghub/Screens/SingleChapterScreen.dart';

class SingleSub extends StatefulWidget {
  @override
  _SingleSubState createState() => _SingleSubState();
}

class _SingleSubState extends State<SingleSub> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    // SystemChrome.setSystemUIOverlayStyle(
    //     SystemUiOverlayStyle(statusBarColor: Colors.black));
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0.1),
        child: AppBar(
          brightness: Brightness.dark,
          backgroundColor: BlckColor,
        ),
      ),
      body: SafeArea(
        child: Container(
          child: SingleChildScrollView(
            child: Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.35,
                  width: double.infinity,
                  color: BlckColor,
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 30, top: 20),
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
                        padding: EdgeInsets.symmetric(
                            horizontal: screenSize.height * 0.05,
                            vertical: screenSize.height * 0.07),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Biology",
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
                Padding(
                  padding: EdgeInsets.only(top: screenSize.height * 0.3),
                  child: Align(
                    alignment: Alignment.center,
                    child: Container(
                      child: ListView.separated(
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
                      ),
                    ),
                  ),
                )
              ],
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

// class CustomSliverDelegate extends SliverPersistentHeaderDelegate {
//   final double expandedHeight;
//   final bool hideTitleWhenExpanded;
//
//   CustomSliverDelegate({
//     @required this.expandedHeight,
//     this.hideTitleWhenExpanded = true,
//   });
//
//   @override
//   Widget build(
//       BuildContext context, double shrinkOffset, bool overlapsContent) {
//     final appBarSize = expandedHeight - shrinkOffset;
//     final cardTopPosition = expandedHeight / 2 - shrinkOffset;
//     final proportion = 2 - (expandedHeight / appBarSize);
//     final percent = proportion < 0 || proportion > 1 ? 0.0 : proportion;
//     return SizedBox(
//       height: expandedHeight + expandedHeight / 2,
//       child: SizedBox(
//         height: appBarSize < kToolbarHeight ? kToolbarHeight : appBarSize,
//         child: AppBar(
//           automaticallyImplyLeading: false,
//           brightness: Brightness.light,
//           centerTitle: false,
//           elevation: 0.0,
//           backgroundColor: BlckColor,
//           title: Opacity(
//             opacity: hideTitleWhenExpanded ? 1.0 - percent : 1.0,
//             child: Container(
//               child: Column(
//                 children: [
//                   Container(
//                     width: double.infinity,
//                     color: BlckColor,
//                     child: Stack(
//                       children: [
//                         Padding(
//                           padding: const EdgeInsets.only(left: 30, top: 30),
//                           child: Align(
//                             alignment: Alignment.topLeft,
//                             child: GestureDetector(
//                               onTap: () {
//                                 Navigator.of(context).pop();
//                               },
//                               child: Container(
//                                 height: 35,
//                                 width: 35,
//                                 decoration: BoxDecoration(
//                                     borderRadius: BorderRadius.circular(5),
//                                     border: Border.all(color: GreyTxtClr)),
//                                 child: Padding(
//                                   padding: const EdgeInsets.only(left: 6),
//                                   child: Icon(
//                                     Icons.arrow_back_ios,
//                                     color: buttonGreen,
//                                     size: 13,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.symmetric(
//                               horizontal: 30, vertical: 45),
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.end,
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 "Biology",
//                                 style: TextStyle(
//                                     fontSize: 26,
//                                     fontWeight: FontWeight.bold,
//                                     color: Colors.white),
//                               ),
//                               SizedBox(
//                                 height: 10,
//                               ),
//                               Row(
//                                 children: [
//                                   Icon(
//                                     Icons.radio_button_checked,
//                                     color: buttonGreen,
//                                     size: 15,
//                                   ),
//                                   SizedBox(
//                                     width: 5,
//                                   ),
//                                   Text(
//                                     "12 Chapters",
//                                     style: TextStyle(
//                                         fontSize: 12,
//                                         fontWeight: FontWeight.w500,
//                                         color: buttonGreen),
//                                   ),
//                                   SizedBox(
//                                     width: 15,
//                                   ),
//                                   Icon(
//                                     Icons.radio_button_checked,
//                                     color: buttonGreen,
//                                     size: 15,
//                                   ),
//                                   SizedBox(
//                                     width: 5,
//                                   ),
//                                   Text(
//                                     "124 hours",
//                                     style: TextStyle(
//                                         fontSize: 12,
//                                         fontWeight: FontWeight.w500,
//                                         color: buttonGreen),
//                                   ),
//                                 ],
//                               )
//                             ],
//                           ),
//                         )
//                       ],
//                     ),
//                   )
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   @override
//   double get maxExtent => expandedHeight + expandedHeight / 2;
//
//   @override
//   double get minExtent => kToolbarHeight;
//
//   @override
//   bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
//     return true;
//   }
// }
