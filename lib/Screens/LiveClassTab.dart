import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:learninghub/API/LiveApi.dart';
import 'package:learninghub/Const/Constants.dart';
import 'package:learninghub/Helper/snackbar_toast_helper.dart';
import 'package:url_launcher/url_launcher.dart';

class Live extends StatefulWidget {
  @override
  _LiveState createState() => _LiveState();
}

class _LiveState extends State<Live> {
  var isLoading = true;
  var arrLive = [];
  var weblink;

  Future<String> getLive() async {
    var rsp = await LiveApi();
    print(rsp);
    if (rsp['attributes']['status'].toString() == "Success") {
      arrLive = rsp["attributes"]["data"];

      setState(() {});
    } else {
      showToastSuccess("Something went wrong!");
    }
    setState(() {
      isLoading = false;
    });
    return "0";
  }

  @override
  void initState() {
    super.initState();
    this.getLive();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: isLoading == true
          ? Center(
              child: SpinKitFadingCube(
              color: buttonGreen,
              size: 20,
            ))
          : ListView.separated(
              scrollDirection: Axis.vertical,
              separatorBuilder: (context, index) => SizedBox(
                height: 10,
              ),
              shrinkWrap: true,
              itemCount: arrLive != null ? arrLive.length : 0,
              itemBuilder: (context, index) {
                final item = arrLive != null ? arrLive[index] : null;
                return Live(item, index);
              },
            ),
    );
  }

  Live(var item, int index) {
    return GestureDetector(
      onTap: () {
        weblink = item["liveUrl"].toString();
        print("`````````````````````````````````````");
        print(weblink);
        print("`````````````````````````````````````");
        _launchURL(weblink);
      },
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(left: 15, right: 15, top: 15),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: buttonGreen),
              boxShadow: [
                BoxShadow(
                  color: (Colors.grey[500]),
                  spreadRadius: 1,
                  blurRadius: 1,
                  offset: Offset(0, 1),
                ),
              ],
              borderRadius: BorderRadius.circular(5),
            ),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Icon(
                    FontAwesomeIcons.playCircle,
                    color: buttonGreen,
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item["sessionTitle"].toString(),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: BlckColor),
                            ),
                            Divider(
                              color: Colors.black54,
                              endIndent: 80,
                            ),
                            Row(
                              children: [
                                Icon(
                                  FontAwesomeIcons.bookOpen,
                                  size: 10,
                                  color: Colors.black,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  item["subjectName"].toString(),
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: BlckColor),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            Row(
                              children: [
                                Icon(
                                  FontAwesomeIcons.solidClock,
                                  size: 10,
                                  color: Colors.black,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "Starts at:  " +
                                      item["liveStartTime"].toString(),
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500,
                                      color: BlckColor),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20, top: 15),
            child: Align(
              alignment: Alignment.topRight,
              child: Image.asset(
                "assets/images/livenow.gif",
                height: MediaQuery.of(context).size.height * 0.05,
              ),
            ),
          )
        ],
      ),
    );
  }

  _launchURL(String weblink) async {
    if (await canLaunch(weblink)) {
      await launch(
        weblink,
        // forceWebView: false,
      );
    } else {
      showToastSuccess("Something went wrong! Please try again later");
      throw 'Could not launch $weblink';
    }
  }
}
