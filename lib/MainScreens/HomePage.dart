import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:learninghub/API/CounsellingApi.dart';
import 'package:learninghub/API/homepageAPI.dart';
import 'package:learninghub/Const/Constants.dart';
import 'package:learninghub/Helper/colorConverter.dart';
import 'package:learninghub/Helper/sharedPref.dart';
import 'package:learninghub/Helper/snackbar_toast_helper.dart';
import 'package:learninghub/Screens/LiveClasses.dart';
import 'package:learninghub/Screens/Notification.dart';
import 'package:learninghub/Screens/PlayerScreen.dart';
import 'package:learninghub/Screens/SingleSubChapters.dart';
import 'package:learninghub/Screens/schoolBoradSelect.dart';
import 'package:learninghub/Widgets/Drawer.dart';

class HomePage extends StatefulWidget {
  // const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var arrStudentInfo = [];
  var arrSubjects = [];
  var arrRecentVideos = [];
  var arrCourses = [];
  var name;
  var userID;
  List arrCourseList = List();
  String dropdownValue;
  var isLoading = true;

  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();

  Future<String> getHome() async {
    var rsp = await HomePageApi();
    print("homepageee");
    // print(rsp);
    if (rsp['attributes']['status'].toString() == "Success") {
      setState(() {
        arrStudentInfo = rsp["attributes"]["studentInfo"];
        name = arrStudentInfo[0]["fullName"].toString();
        userID = arrStudentInfo[0]["studentId"].toString();
        print("userID");
        print(userID);
        print("userID");
        arrSubjects = rsp["attributes"]["subjects"];
        arrRecentVideos = rsp["attributes"]["recentVideos"];
        arrCourses = rsp["attributes"]["courses"];
        print("000000000000000000000000");
        print(
          arrCourses[0]["courseName"].toString(),
        );
        print("000000000000000000000000");
        var CourseID = setSharedPrefrence(CID, arrCourses[0]["courseId"]);
        if (arrCourses != null) {
          for (var value in arrCourses) {
            final Course = value["courseName"].toString();
            arrCourseList.add(Course);
          }
        }
      });
      print(arrSubjects);
    }

    setState(() {
      isLoading = false;
    });
    return "0";
  }

  void initState() {
    super.initState();

    print("xoxoxo");
    this.getHome();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      extendBody: true,
      drawer: DrawerWidget(id: userID.toString(), name: name.toString()),
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(1.0),
        child: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
        ),
      ),
      body: isLoading == true
          ? Center(
              child: SpinKitFadingCube(
              color: buttonGreen,
              size: 20,
            ))
          : SingleChildScrollView(
              child: Stack(
                children: [
                  Positioned(
                      right: 0,
                      top: 0,
                      child: Image.asset(
                        "assets/images/Art 10.png",
                        height: MediaQuery.of(context).size.height * 0.4,
                      )),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 60),
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          appbar(),
                          NameSection(),
                          BannerClass(),
                          SubjectsList(),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Text(
                              "Recent Courses",
                              style: Txt12Med,
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          RcntCr(),
                          liveClassesList(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }

  Widget appbar() {
    final ss = MediaQuery.of(context).size;
    return Container(
      child: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            GestureDetector(
              onTap: () => scaffoldKey.currentState.openDrawer(),
              child: Image(
                image: AssetImage("assets/images/Menu.png"),
                height: ss.height * 0.1,
                width: ss.width * 0.1,
              ),
            ),
            SvgPicture.asset(
              "assets/images/logo.svg",
              width: ss.width * 0.4,
            ),
          ],
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NotificationPage()),
              );
            },
            child: Icon(
              Icons.notifications,
              size: ss.height * 0.03,
              color: Colors.black,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: ss.width * 0.025, vertical: ss.height * 0.015),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SelectSchoolBoard()),
                );
              },
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: (Colors.grey[500]),
                        spreadRadius: 1,
                        blurRadius: 1,
                        offset: Offset(0, 1),
                      ),
                    ],
                    border: Border.all(
                      color: buttonGreen,
                    ),
                    borderRadius: BorderRadius.circular(4)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Add New Course",
                    style: TextStyle(
                        color: buttonGreen,
                        fontSize: ss.height * 0.017,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget NameSection() {
    final ss = MediaQuery.of(context).size;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            greeting(),
            style: Txt12Med,
          ),
          SizedBox(
            height: ss.height * 0.01,
          ),
          Text(
            name.toString(),
            style: TextStyle(
                fontSize: ss.height * 0.04, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }

  Widget BannerClass() {
    final ss = MediaQuery.of(context).size;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15),
      child: Stack(
        children: [
          Container(
            height: ss.height * 0.12,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: AssetImage("assets/images/homeBanner.png"),
                  fit: BoxFit.cover,
                )),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: ss.width * 0.05, top: 15),
                  child: Text(
                    "Course",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: ss.height * 0.02,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: ss.width * 0.05),
                  child: DropdownButton<String>(
                    value: dropdownValue,
                    isExpanded: true,
                    icon: const Icon(
                      Icons.keyboard_arrow_down_rounded,
                      color: Colors.white,
                    ),
                    iconSize: 24,
                    elevation: 16,
                    dropdownColor: liteBlack,
                    hint: Text(
                      arrCourses[0]["courseName"].toString(),
                      style: WhiteTextStyle,
                    ),
                    underline: Container(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                    onChanged: (String newValue) {
                      setState(() {
                        dropdownValue = newValue;
                      });
                    },
                    items: arrCourseList.map<DropdownMenuItem<String>>((value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget SubjectsList() {
    final ss = MediaQuery.of(context).size;

    return Container(
      height: ss.height * 0.13,
      child: Padding(
        padding: const EdgeInsets.only(top: 20, bottom: 20, left: 15),
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          separatorBuilder: (context, index) => SizedBox(
            width: 10,
          ),
          shrinkWrap: true,
          itemCount: arrSubjects != null ? arrSubjects.length : 0,
          itemBuilder: (context, index) {
            final item = arrSubjects != null ? arrSubjects[index] : null;
            return subs(item, index);
          },
        ),
      ),
    );
  }

  subs(var item, int index) {
    final ss = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => SingleSubjectsList(
                  id: item["subjectId"].toString(),
                  name: item["subjectName"].toString())),
        );
      },
      child: Card(
        elevation: 8,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
          child: Row(
            children: [
              Icon(
                Icons.circle,
                color: hexToColor(item['bgColor'].toString()),
                size: 15,
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                item["subjectName"].toString(),
                style: TextStyle(
                    color: Colors.black,
                    fontSize: ss.height * 0.02,
                    fontWeight: FontWeight.w600),
              )
            ],
          ),
        ),
      ),
    );
  }

  RcntCr() {
    final ss = MediaQuery.of(context).size;

    return Container(
      height: ss.height * 0.23,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          separatorBuilder: (context, index) => SizedBox(
            width: 10,
          ),
          shrinkWrap: true,
          itemCount: arrRecentVideos != null ? arrRecentVideos.length : 0,
          itemBuilder: (context, index) {
            final item =
                arrRecentVideos != null ? arrRecentVideos[index] : null;
            return courses(item, index);
          },
        ),
      ),
    );
  }

  courses(var item, int index) {
    final ss = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => PlayerScreen(ContentID: item["id"])),
        );
      },
      child: Stack(
        children: [
          Container(
            width: ss.width * 0.6,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.red,
                boxShadow: [
                  BoxShadow(
                    color: (Colors.grey[300]),
                    spreadRadius: 1,
                    blurRadius: 1,
                    offset: Offset(0, 1),
                  ),
                ],
                image: DecorationImage(
                    image:
                        NetworkImage(item["coverImage"].toString(), scale: 1),
                    fit: BoxFit.cover),
                border: Border.all(color: Colors.black12)),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, bottom: 15),
            child: Align(
                alignment: Alignment.bottomLeft,
                child: Row(
                  children: [
                    Icon(
                      Icons.play_circle_outline,
                      color: Colors.white,
                      size: ss.height * 0.04,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      item["chapterName"].toString(),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: ss.height * 0.021,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    )
                  ],
                )),
          )
        ],
      ),
    );
  }

  String greeting() {
    var hour = DateTime.now().hour;
    if (hour < 12) {
      return 'Good Morning,';
    }
    if (hour < 17) {
      return 'Good Afternoon,';
    }
    return 'Good Evening,';
  }

  liveClassesList() {
    final ss = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 30),
      child: Container(
        height: ss.height * 0.7,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            Container(
              height: ss.height * 0.6,
              width: MediaQuery.of(context).size.width * 0.7,
              decoration: BoxDecoration(
                  color: BlckColor, borderRadius: BorderRadius.circular(8)),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: circleClr,
                          image: DecorationImage(
                              image: AssetImage("assets/images/AppIcon.png"))),
                      height: 80,
                      width: 80,
                    ),
                    Text(
                      "Inmakes live classes",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    Text(
                      "Live classes by best teachers from LearningHub to clear your doubts and to provide individual attention",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: BlckTxtClr),
                      textAlign: TextAlign.left,
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                    ),
                    GestureDetector(
                      child: Button("Live Classes"),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LiveClasses()),
                        );
                      },
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.01,
            ),
            Container(
              height: 400,
              width: MediaQuery.of(context).size.width * 0.7,
              decoration: BoxDecoration(
                  color: BlckColor, borderRadius: BorderRadius.circular(8)),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: circleClr,
                          image: DecorationImage(
                              image: AssetImage("assets/images/AppIcon.png"))),
                      height: 80,
                      width: 80,
                    ),
                    Text(
                      "Avail free counselling",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    Text(
                      "Get free counselling for your self development ",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: BlckTxtClr),
                      textAlign: TextAlign.left,
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                    ),
                    GestureDetector(
                      child: Button("Book Now"),
                      onTap: () async {
                        print("counselling call");
                        setState(() {});
                        var rsp = await CounsellingApi();
                        print(rsp);
                        showToastSuccess(
                            rsp["attributes"]["response"].toString());
                      },
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget Button(String txt) {
    final ss = MediaQuery.of(context).size;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 32),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.white10),
          borderRadius: BorderRadius.circular(4),
          color: buttonGreen),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Text(
          txt,
          style: TextStyle(
              fontSize: 14, fontWeight: FontWeight.w600, color: Colors.white),
        ),
      ),
    );
  }
}
