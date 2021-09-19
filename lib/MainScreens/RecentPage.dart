import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:learninghub/API/RecentVideosPageApi.dart';
import 'package:learninghub/Const/Constants.dart';
import 'package:learninghub/Screens/PlayerScreen.dart';

class RecentPage extends StatefulWidget {
  // const RecentPage({Key? key}) : super(key: key);

  @override
  _RecentPageState createState() => _RecentPageState();
}

class _RecentPageState extends State<RecentPage> {
  var isLoading = true;
  var arrayRecent = [];
  Future<String> getHome() async {
    var rsp = await RecentVidPageAPI();
    print("recentt");
    if (rsp['attributes']['status'].toString() == "Success") {
      setState(() {
        arrayRecent = rsp["attributes"]["recentVideos"];
        print(arrayRecent);
      });
    }

    setState(() {
      isLoading = false;
    });
    return "0";
  }

  void initState() {
    super.initState();

    print("recentt");
    this.getHome();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          "Recently Watched",
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.w400),
        ),
      ),
      body: isLoading == true
          ? Center(
              child: SpinKitFadingCube(
              color: buttonGreen,
              size: 20,
            ))
          : arrayRecent == null
              ? Center(
                  child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/images/no.png"),
                      Text(
                        "No recent videos",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    ],
                  ),
                ))
              : Scrollbar(
                  child: ListView.separated(
                    scrollDirection: Axis.vertical,
                    separatorBuilder: (context, index) => SizedBox(
                      height: 10,
                    ),
                    shrinkWrap: true,
                    itemCount: arrayRecent != null ? arrayRecent.length : 0,
                    itemBuilder: (context, index) {
                      final item =
                          arrayRecent != null ? arrayRecent[index] : null;

                      return VideosList(item, index);
                    },
                  ),
                ),
    );
  }

  VideosList(var item, int index) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => PlayerScreen(ContentID: item["id"])),
        );
      },
      child: Container(
        margin: EdgeInsets.only(left: 15, right: 15, top: 15),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                spreadRadius: 1,
                blurRadius: 1,
                offset: Offset(0, 0),
              )
            ]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(item["coverImage"].toString()),
                          fit: BoxFit.cover)),
                  height: 160,
                  width: double.infinity,
                ),
                Positioned(
                  bottom: 15,
                  right: 15,
                  child: Container(
                    decoration: BoxDecoration(
                      color: buttonGreen,
                      borderRadius: BorderRadius.circular(2),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 8),
                      child: Text(
                        item["subjectName"].toString(),
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 10),
                      ),
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Text(
                item["videoTitle"].toString(),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: BlckColor),
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.only(left: 15, right: 15, bottom: 20),
            //   child: Row(
            //     children: [
            //       Icon(
            //         Icons.radio_button_checked,
            //         color: GreyTxtClr,
            //         size: 15,
            //       ),
            //       SizedBox(
            //         width: 5,
            //       ),
            //       Text(
            //         "12 Chapters",
            //         style: TextStyle(
            //             fontSize: 12,
            //             fontWeight: FontWeight.w500,
            //             color: GreyTxtClr),
            //       ),
            //       SizedBox(
            //         width: 15,
            //       ),
            //       Icon(
            //         Icons.radio_button_checked,
            //         color: GreyTxtClr,
            //         size: 15,
            //       ),
            //       SizedBox(
            //         width: 5,
            //       ),
            //       Text(
            //         "124 hours",
            //         style: TextStyle(
            //             fontSize: 12,
            //             fontWeight: FontWeight.w500,
            //             color: GreyTxtClr),
            //       ),
            //     ],
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
