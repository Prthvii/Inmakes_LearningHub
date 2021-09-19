import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:learninghub/API/mySubscriptionsApi.dart';
import 'package:learninghub/Const/Constants.dart';
import 'package:learninghub/Helper/snackbar_toast_helper.dart';

class SubscriptionsPage extends StatefulWidget {
  @override
  _SubscriptionsPageState createState() => _SubscriptionsPageState();
}

class _SubscriptionsPageState extends State<SubscriptionsPage> {
  var isLoading = true;
  var arrSubs = [];
  Future<String> notificationnn() async {
    var rsp = await SubscriptionApi();
    print(rsp);
    if (rsp['attributes']['status'].toString() == "Success") {
      arrSubs = rsp["attributes"]["subscription"];
      print(arrSubs);
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
    this.notificationnn();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: BlckColor,
        appBar: AppBar(
          brightness: Brightness.dark,
          title: Text(
            "My Subscriptions",
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          backgroundColor: BlckColor,
          elevation: 0,
          leading: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
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
        body: isLoading == true
            ? Center(
                child: SpinKitFadingCube(
                color: buttonGreen,
                size: 20,
              ))
            : arrSubs != null
                ? Container(
                    margin: EdgeInsets.all(12),
                    child: ListView.separated(
                      scrollDirection: Axis.vertical,
                      separatorBuilder: (context, index) => SizedBox(
                        height: 10,
                      ),
                      shrinkWrap: true,
                      itemCount: arrSubs != null ? arrSubs.length : 0,
                      itemBuilder: (context, index) {
                        final item = arrSubs != null ? arrSubs[index] : null;
                        return list(item, index);
                      },
                    ),
                  )
                : Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/images/no.png",
                          width: MediaQuery.of(context).size.width * 0.7,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "No Active Subscriptions",
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              color: Colors.white),
                        )
                      ],
                    ),
                  ));
  }

  list(var item, int index) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              item["courseName"].toString(),
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              "Course Duration: " + item["courseDetails"].toString(),
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              "Expiry Date: " + item["expired_on"].toString(),
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
