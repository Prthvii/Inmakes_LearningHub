import 'package:flutter/material.dart';
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
  var link;
  Future<String> getLive() async {
    var rsp = await LiveApi();
    print(rsp);
    if (rsp['attributes']['status'].toString() == "Success") {
      arrLive = rsp["attributes"]["data"];
      link = arrLive[0]["liveUrl"];
      print(link);
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
      child: ListView.separated(
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
        _launchURL(item["liveUrl"]);
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
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
                  SizedBox(
                    height: 3,
                  ),
                  Text(
                    item["subjectName"].toString(),
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: BlckColor),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Text(
                    "Starts at:  " + item["liveStartTime"].toString(),
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: BlckColor),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _launchURL(link) async {
    const url = link;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
