import 'package:flutter/material.dart';
import 'package:learninghub/Const/Constants.dart';
import 'package:learninghub/Widgets/Drawer.dart';

class HomePage extends StatefulWidget {
  // const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String dropdownValue;
  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: DrawerWidget(),
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            SizedBox(
              width: 50,
            ),
            GestureDetector(
              onTap: () => scaffoldKey.currentState.openDrawer(),
              child: Container(
                height: 32,
                width: 32,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2),
                  border: Border.all(color: Colors.grey),
                ),
                child: Icon(
                  Icons.grid_view,
                  color: buttonGreen,
                  size: 15,
                ),
              ),
            ),
            SizedBox(
              width: 15,
            ),
            Text(
              "Icon here",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(
                    color: buttonGreen,
                  ),
                  borderRadius: BorderRadius.circular(4)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Icon(
                      Icons.circle,
                      color: buttonGreen,
                      size: 15,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "Classes",
                      style: TextStyle(
                          color: buttonGreen,
                          fontSize: 11,
                          fontWeight: FontWeight.w600),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
    );
  }

  Widget NameSection() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Good Morning",
            style: Txt12Med,
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            "Aaron Taylor",
            style: Txt24Bold,
          )
        ],
      ),
    );
  }

  Widget BannerClass() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15),
      child: Stack(
        children: [
          Container(
            height: 80,
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
                  padding: const EdgeInsets.only(left: 20, top: 15),
                  child: Text(
                    "Class",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
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
                      'Select State',
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
                    items: <String>['One', 'Two', 'Free', 'Four']
                        .map<DropdownMenuItem<String>>((String value) {
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
    return Container(
      height: 80,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          separatorBuilder: (context, index) => SizedBox(
            width: 10,
          ),
          shrinkWrap: true,
          itemCount: 5,
          itemBuilder: (context, index) {
            return subs(index);
          },
        ),
      ),
    );
  }

  subs(int index) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black54, width: 1),
          borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Icon(
              Icons.circle,
              color: buttonGreen,
              size: 18,
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              "Classes",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 13,
                  fontWeight: FontWeight.w600),
            )
          ],
        ),
      ),
    );
  }

  RcntCr() {
    return Container(
      height: 121,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          separatorBuilder: (context, index) => SizedBox(
            width: 10,
          ),
          shrinkWrap: true,
          itemCount: 5,
          itemBuilder: (context, index) {
            return courses(index);
          },
        ),
      ),
    );
  }

  courses(int index) {
    return Stack(
      children: [
        Container(
          width: 210,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: Colors.grey[200],
              image: DecorationImage(
                  image: NetworkImage(
                    "https://scx2.b-cdn.net/gfx/news/hires/2019/3-quantumphysi.jpg",
                  ),
                  fit: BoxFit.cover)),
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
                    size: 30,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "Course Title",
                    style: Txt12Semi,
                  )
                ],
              )),
        )
      ],
    );
  }

  liveClassesList() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 30),
      child: Container(
        height: 400,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          separatorBuilder: (context, index) => SizedBox(
            width: 10,
          ),
          shrinkWrap: true,
          itemCount: 5,
          itemBuilder: (context, index) {
            return LiveClassWidget(index);
          },
        ),
      ),
    );
  }

  Widget LiveClassWidget(int index) {
    return Container(
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
              decoration:
                  BoxDecoration(shape: BoxShape.circle, color: circleClr),
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
                  fontSize: 16, fontWeight: FontWeight.w500, color: BlckTxtClr),
              textAlign: TextAlign.left,
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
            ),
            Button()
          ],
        ),
      ),
    );
  }

  Widget Button() {
    return GestureDetector(
      onTap: () {
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //       builder: (context) =>
        //           OTPScreen(mob: mobController.text.toString())),
        // );
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 32),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.white10),
            borderRadius: BorderRadius.circular(4),
            color: buttonGreen),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Text(
            "Book a free Class",
            style: TextStyle(
                fontSize: 14, fontWeight: FontWeight.w600, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
