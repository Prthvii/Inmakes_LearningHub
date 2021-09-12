import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:learninghub/API/homepageAPI.dart';
import 'package:learninghub/Const/Constants.dart';
import 'package:learninghub/Screens/Notification.dart';

class ProfilePage extends StatefulWidget {
  // const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  var arrStudentInfo = [];
  var name;
  var email;
  var id;
  var number;
  var isLoading = true;

  Future<String> getHome() async {
    var rsp = await HomePageApi();
    print("homepageee");
    // print(rsp);
    if (rsp['attributes']['status'].toString() == "Success") {
      setState(() {
        arrStudentInfo = rsp["attributes"]["studentInfo"];
        name = arrStudentInfo[0]["fullName"].toString();
        id = arrStudentInfo[0]["studentId"].toString();
        number = arrStudentInfo[0]["mobileNumber"].toString();
        email = arrStudentInfo[0]["emailId"].toString();
      });
    }

    setState(() {
      isLoading = false;
    });
    return "0";
  }

  void initState() {
    super.initState();

    print("profile");
    this.getHome();
    setState(() {});
  }

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
      body: isLoading == true
          ? Center(
              child: SpinKitFadingCube(
              color: buttonGreen,
              size: 20,
            ))
          : Container(
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
                  Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 0, top: 20),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          GestureDetector(
                            child: Image(
                              image: AssetImage("assets/images/noti.png"),
                              height: 19,
                              width: 14,
                            ),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => NotificationPage()),
                              );
                            },
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.logout,
                                color: Colors.white,
                              )),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 80, top: 100),
                    child: SingleChildScrollView(
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
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
                                              name.toString(),
                                              style: TextStyle(
                                                  color: Color(0xff4D4D4D),
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              "ID:  " + id.toString(),
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
                                    // Divider(),
                                    _items("Account Settings", "Aaron Taylor"),
                                    Divider(),
                                    _items("Mobile", number.toString()),
                                    Divider(),
                                    _items("Email", email.toString()),
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
