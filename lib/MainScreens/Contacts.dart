import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:learninghub/Const/Constants.dart';
import 'package:learninghub/Widgets/waveWidget.dart';
import 'package:url_launcher/url_launcher.dart';

class Contacts extends StatefulWidget {
  // const Contacts({Key? key}) : super(key: key);

  @override
  _ContactsState createState() => _ContactsState();
}

class _ContactsState extends State<Contacts> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final bool keyboardOpen = MediaQuery.of(context).viewInsets.bottom > 0;
    return Scaffold(
      backgroundColor: buttonGreen,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0.1),
        child: AppBar(
          elevation: 0,
          backgroundColor: buttonGreen,
        ),
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            AnimatedPositioned(
              duration: Duration(milliseconds: 500),
              curve: Curves.easeOutQuad,
              top: 0,
              child: WaveWidget(
                size: size,
                yOffset: size.height / 20,
                color: Colors.white,
              ),
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    "assets/images/Logo0.png",
                    height: MediaQuery.of(context).size.height * 0.3,
                    width: MediaQuery.of(context).size.width * 0.9,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.08,
                    ),
                    child: Text(
                      "Inmakes offer various kinds of products and services to the public and business firms to boost up their portfolio level. We nurture personal growth for our team by creating a challenging environment with opportunities.",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Colors.black54),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.05,
                    ),
                    child: Text(
                      "Contact Info",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.black87,
                          letterSpacing: 1),
                    ),
                  ),
                  Divider(
                    endIndent: MediaQuery.of(context).size.width * 0.15,
                    color: Colors.black38,
                  ),
                  address(),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  phone(),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  phone2(),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  email(),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  email2(),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.2,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget address() {
    return GestureDetector(
      onTap: () {
        launchMap();
      },
      child: Row(
        // crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/images/location.gif",
            height: MediaQuery.of(context).size.height * 0.08,
          ),
          SizedBox(
            width: 5,
          ),
          Expanded(
            child: Text(
              "Opp. Technopark, Trivandrum, Kerala 695582",
              style: txtStyl,
            ),
          ),
        ],
      ),
    );
  }

  Widget phone() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * 0.05,
      ),
      child: GestureDetector(
        onTap: () async {
          var url = 'tel:' + "+919288097883";
          if (await canLaunch(url)) {
            await launch(url);
          } else {
            Fluttertoast.showToast(
              msg: "Unable to make call!",
            );
            throw 'Could not launch $url';
          }
        },
        child: Row(
          // crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/phone.png",
              width: MediaQuery.of(context).size.width * 0.06,
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "+91 9288097883",
                    style: txtStyl,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget phone2() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * 0.05,
      ),
      child: GestureDetector(
        onTap: () async {
          var url = 'tel:' + "+919288025910";
          if (await canLaunch(url)) {
            await launch(url);
          } else {
            Fluttertoast.showToast(
              msg: "Unable to make call!",
            );
            throw 'Could not launch $url';
          }
        },
        child: Row(
          // crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/phone.png",
              width: MediaQuery.of(context).size.width * 0.06,
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "+91 9288025910",
                    style: txtStyl,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget email() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * 0.05,
      ),
      child: GestureDetector(
        onTap: () async {
          var url = 'mailto:' + "info@inmakesedu.com";
          if (await canLaunch(url)) {
            await launch(url);
          } else {
            Fluttertoast.showToast(
              msg: "Unable to create mail",
            );
            throw 'Could not launch $url';
          }
        },
        child: Row(
          // crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/email.png",
              width: MediaQuery.of(context).size.width * 0.06,
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "info@inmakesedu.com",
                    style: txtStyl,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget email2() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * 0.05,
      ),
      child: GestureDetector(
        onTap: () async {
          var url = 'mailto:' + "support@inmakesedu.com";
          if (await canLaunch(url)) {
            await launch(url);
          } else {
            Fluttertoast.showToast(
              msg: "Unable to create mail",
            );
            throw 'Could not launch $url';
          }
        },
        child: Row(
          // crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/email.png",
              width: MediaQuery.of(context).size.width * 0.06,
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "support@inmakesedu.com",
                    style: txtStyl,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  launchMap({String lat = "8.557887", String long = "76.876087"}) async {
    var mapSchema = 'geo:$lat,$long';
    if (await canLaunch(mapSchema)) {
      await launch(mapSchema);
    } else {
      throw 'Could not launch $mapSchema';
    }
  }
}

const txtStyl = TextStyle(
    fontSize: 16,
    letterSpacing: 1,
    fontWeight: FontWeight.w500,
    color: Colors.black54);
