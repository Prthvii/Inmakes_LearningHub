import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learninghub/Const/Constants.dart';

class ProfilePage extends StatefulWidget {
  // const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0.1),
        child: AppBar(
          brightness: Brightness.dark,
          backgroundColor: BlckColor,
        ),
      ),
      body: Container(
        child: Stack(
          children: [
            Container(
              color: BlckColor,
              height: MediaQuery.of(context).size.height * 0.4,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40),
              child: Align(
                alignment: Alignment.topCenter,
                child: Text(
                  "Profile",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20, top: 40),
              child: Align(
                alignment: Alignment.topRight,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image(
                      image: AssetImage("assets/images/noti.png"),
                      height: 19,
                      width: 14,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Image(
                      image: AssetImage("assets/images/Menu.png"),
                      height: 32,
                      width: 32,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 100),
              child: Positioned(
                top: 0,
                left: 10,
                right: 10,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 100),
                    child: Column(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 1,
                          margin: EdgeInsets.symmetric(horizontal: 20),
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        height: 45,
                                        width: 45,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: buttonGreen, width: 2),
                                            image: DecorationImage(
                                                image: NetworkImage(
                                                    "https://assets.publishing.service.gov.uk/government/uploads/system/uploads/image_data/file/103058/s960_Minister_Donelan.jpeg"),
                                                fit: BoxFit.cover),
                                            shape: BoxShape.circle),
                                      ),
                                      SizedBox(
                                        width: 15,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text(
                                            "Aaron Taylor",
                                            style: TextStyle(
                                                color: Color(0xff4D4D4D),
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            "ID: 1234",
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w300),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  head("Personal Info"),
                                  Divider(),
                                  _items("Account Settings", "Aaron Taylor"),
                                  Divider(),
                                  _items("Email", "emaidid123@server.com"),
                                  Divider(),
                                  head("Course Info"),
                                  Divider(),
                                  _items("Course Info", "Inmakes edu"),
                                  Divider(),
                                  _items("Course", "Plus Two Science"),
                                  Divider(),
                                  _items("Payment Status", "Free"),
                                  Divider(),
                                  _items("Expiry Date", "Not Applicable"),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 20),
                          child: Container(
                            // margin: EdgeInsets.symmetric(horizontal: 20),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: buttonGreen,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 20, horizontal: 20),
                              child: Row(
                                children: [
                                  Container(
                                    height: 30,
                                    width: 30,
                                    color: Colors.white54,
                                    child: Icon(
                                      Icons.credit_card,
                                      color: Colors.white,
                                      size: 18,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "Custom Payment",
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Spacer(),
                                  Icon(
                                    Icons.arrow_forward_ios,
                                    color: Colors.white,
                                    size: 15,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 20),
                          child: Container(
                            // margin: EdgeInsets.symmetric(horizontal: 20),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: buttonGreen,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 20, horizontal: 20),
                              child: Row(
                                children: [
                                  Container(
                                    height: 30,
                                    width: 30,
                                    color: Colors.white54,
                                    child: Icon(
                                      Icons.screen_share_rounded,
                                      color: Colors.white,
                                      size: 18,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "Referals",
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Spacer(),
                                  Icon(
                                    Icons.arrow_forward_ios,
                                    color: Colors.white,
                                    size: 15,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget head(String txt) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      child: Text(
        txt,
        style: TextStyle(
            color: Color(0xff4D4D4D),
            fontSize: 16,
            fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _items(String frstTxt, String nxtTxt) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Container(
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  frstTxt,
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: profileclr),
                ),
              ],
            ),
            // SizedBox(
            //   width: 30,
            // ),
            Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisAlignment: MainAxisAlignment.,
              children: [
                Text(
                  nxtTxt,
                  style: TextStyle(
                      color: profileclr,
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
