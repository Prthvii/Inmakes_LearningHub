import 'package:flutter/material.dart';
import 'package:learninghub/Const/Constants.dart';
import 'package:learninghub/MainScreens/ProfilePage.dart';

class DrawerWidget extends StatefulWidget {
  @override
  _DrawerWidgetState createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.7,
      child: SafeArea(
        child: SizedBox(
          child: Drawer(
            elevation: 0,
            child: Container(
              decoration: BoxDecoration(color: BlckColor),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                child: Column(
                  children: [
                    _createHeader(),
                    Flexible(
                      child: ListView(
                        physics: BouncingScrollPhysics(),
                        children: [
                          _createDrawerItem(
                              text: "Subrscriptions", onTap: () {}),
                          Divider(
                            color: Colors.grey,
                          ),
                          _createDrawerItem(text: "Downloads", onTap: () {}),
                          Divider(
                            color: Colors.grey,
                          ),
                          _createDrawerItem(
                              text: "Notifications", onTap: () {}),
                          Divider(
                            color: Colors.grey,
                          ),
                          _createDrawerItem(text: "Referrals", onTap: () {}),
                          Divider(
                            color: Colors.grey,
                          ),
                          _createDrawerItem(text: "Share app", onTap: () {}),
                          Divider(
                            color: Colors.grey,
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(bottom: 10, top: 10),
                              child: Row(
                                // mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: buttonGreen,
                                      ),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    height: 30,
                                    width: 30,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "Logout",
                                    style: TextStyle(
                                        color: Colors.red,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          Container(
                            height: 47,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border:
                                    Border.all(color: buttonGreen, width: 2)),
                            child: Text(
                              "Enquire now",
                              style: TextStyle(
                                  color: buttonGreen,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _createDrawerItem({String text, GestureTapCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10, top: 10),
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: buttonGreen,
                ),
                borderRadius: BorderRadius.circular(5),
              ),
              height: 30,
              width: 30,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              text,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 15),
            ),
          ],
        ),
      ),
    );
  }

  Widget _createHeader() {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ProfilePage()),
        );
      },
      child: Container(
        height: MediaQuery.of(context).size.height * 0.25,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: GreyTxtClr)),
                child: Icon(
                  Icons.close,
                  color: buttonGreen,
                  size: 14,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                      border: Border.all(color: buttonGreen, width: 2),
                      image: DecorationImage(
                          image: NetworkImage(
                              "https://assets.publishing.service.gov.uk/government/uploads/system/uploads/image_data/file/103058/s960_Minister_Donelan.jpeg"),
                          fit: BoxFit.cover),
                      shape: BoxShape.circle),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Aaron Taylor",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
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
                Icon(
                  Icons.arrow_forward_ios,
                  color: buttonGreen,
                  size: 16,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
