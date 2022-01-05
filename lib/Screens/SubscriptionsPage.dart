import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:learninghub/API/mySubscriptionsApi.dart';
import 'package:learninghub/Const/Constants.dart';
import 'package:learninghub/Helper/snackbar_toast_helper.dart';
import 'package:learninghub/Screens/paymentGateway.dart';
import 'package:shimmer/shimmer.dart';

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
    return GestureDetector(
      onTap: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => paymentPage(
                    // amount: courseFee,
                    id: item["courseId"].toString(),
                  )),
        );
      },
      child: Stack(
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 12),
              child: Row(
                children: [
                  Image.asset(
                    "assets/images/AppIcon.png",
                    height: 65,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              "assets/images/book.gif",
                              height: 13,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              item["courseName"].toString(),
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Image.asset(
                              "assets/images/clock.gif",
                              height: 15,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            RichText(
                              text: TextSpan(
                                  text: 'Course Duration:  ',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12),
                                  children: [
                                    TextSpan(
                                      text: item["courseDetails"].toString(),
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12),
                                    )
                                  ]),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Image.asset(
                              "assets/images/calendar.gif",
                              height: 15,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            RichText(
                              text: TextSpan(
                                  text: 'Expiry Date:  ',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12),
                                  children: [
                                    TextSpan(
                                      text: item["expired_on"].toString(),
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12),
                                    )
                                  ]),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 4, top: 4),
            child: Align(
                alignment: Alignment.topRight,
                child: Card(
                  elevation: 2,
                  margin: EdgeInsets.all(0),
                  color: buttonGreen,
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.only(topRight: Radius.circular(3)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 6.0, vertical: 4),
                    child: Shimmer.fromColors(
                      baseColor: Colors.indigo[100],
                      period: Duration(milliseconds: 800),
                      highlightColor: Colors.white,
                      child: Text("PREMIUM",
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 11,
                              letterSpacing: 0.6,
                              wordSpacing: 1,
                              color: Colors.white,
                              fontWeight: FontWeight.w600)),
                    ),
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
