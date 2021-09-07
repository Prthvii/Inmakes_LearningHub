import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:learninghub/API/SelectBoardApi.dart';
import 'package:learninghub/API/SelectCourseApi.dart';
import 'package:learninghub/Const/Constants.dart';

import 'introScreens.dart';

class SelectSchoolBoard extends StatefulWidget {
  @override
  _SelectSchoolBoardState createState() => _SelectSchoolBoardState();
}

class _SelectSchoolBoardState extends State<SelectSchoolBoard> {
  var arrBoardName = [];
  var arrBoardId = "";
  List<String> arrBoardList = [];

  var arrCourseName = [];
  List<String> arrCourse = [];

  var isLoading = true;

  String BoardDropdownValue;
  String ClassDropdownValue;
  @override
  void initState() {
    super.initState();

    print("xoxoxo");
    this.BoardSlct();
    setState(() {});
  }

  Future<String> BoardSlct() async {
    var rsp = await SelectBoardApi();
    if (rsp['attributes']['status'].toString() == "Success") {
      setState(() {
        arrBoardName = rsp["attributes"]["schoolBoards"];
        if (arrBoardName != null) {
          for (var value in arrBoardName) {
            final board = value["boardName"].toString();
            // final boardID = value["boardId"].toString();
            // arrBoardId.add(boardID);
            arrBoardList.add(board);
            print(arrBoardList);
          }
          // boardId =
        }
      });
    }
    setState(() {
      isLoading = false;
    });
    return "0";
  }

  Future<String> CourseSlt() async {
    var rsp = await SlctCourseApi(arrBoardId.toString());
    print(rsp);
    if (rsp['attributes']['status'].toString() == "Success") {
      setState(() {
        arrCourseName = rsp["attributes"]["courses"];
        if (arrCourseName != null) {
          for (var value in arrCourseName) {
            final Course = value["courseName"].toString();
            // print(
            //     "``````````````````````````arrBoardName``````````````````````````");
            arrCourse.add(Course);
            // print(arrCourse);
            //
            // print("``````````````````````arrBoardName``````````````````````");
          }
        }
      });
    }
    setState(() {
      isLoading = false;
    });
    return "0";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.7,
                child: Stack(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 80),
                      child: Center(
                        child: SvgPicture.asset(
                          "assets/images/logo.svg",
                          height: 100,
                          width: 100,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              "Select you school board",
                              style: TextStyle(
                                  fontSize: 20,
                                  color: BlckColor,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                alignment: Alignment.center,
                height: MediaQuery.of(context).size.height * 0.3,
                decoration: BoxDecoration(
                    color: BlckColor,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(16),
                        topRight: Radius.circular(16))),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: Wrap(
                    alignment: WrapAlignment.center,
                    runSpacing: 10,
                    children: [SelectBoard(), SelectCourse(), Button()],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget SelectBoard() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 32),
      height: 51,
      width: double.infinity,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.white10),
          borderRadius: BorderRadius.circular(4),
          color: liteBlack),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: DropdownButton<String>(
          value: BoardDropdownValue,
          isExpanded: true,
          icon: const Icon(
            Icons.keyboard_arrow_down_rounded,
            color: Colors.white54,
          ),
          iconSize: 24,
          elevation: 16,
          dropdownColor: liteBlack,
          hint: Text(
            'Select Board',
            style: blckTextStyle,
          ),
          underline: Container(),
          style: const TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
          onChanged: (String newValue) async {
            arrCourse.clear();
            setState(() {
              BoardDropdownValue = newValue;
              arrBoardId = arrBoardName[0]["boardId"].toString();
              print(arrBoardId);
            });
          },
          items: arrBoardList.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              onTap: () async {
                setState(() {
                  BoardDropdownValue = value.toString();
                  // arrBoardId = arrBoardName[0]["boardId"].toString();
                  // print(arrBoardId);
                  // CourseSlt();
                });
              },
              child: Text(value),
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget SelectCourse() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 32),
      height: 51,
      width: double.infinity,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.white10),
          borderRadius: BorderRadius.circular(4),
          color: liteBlack),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: DropdownButton<String>(
          value: ClassDropdownValue,
          isExpanded: true,
          icon: const Icon(
            Icons.keyboard_arrow_down_rounded,
            color: Colors.white54,
          ),
          iconSize: 24,
          elevation: 16,
          dropdownColor: liteBlack,
          hint: Text(
            'Select Course',
            style: blckTextStyle,
          ),
          underline: Container(),
          style: const TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
          onChanged: (String newValue) {
            setState(() {
              ClassDropdownValue = newValue;
            });
          },
          items: arrCourse.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              onTap: () {
                ClassDropdownValue = value.toString();
              },
              child: Text(value),
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget Button() {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => IntroScreens()),
        );
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 32, vertical: 10),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.white10),
            borderRadius: BorderRadius.circular(4),
            color: buttonGreen),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Text(
            "Continue",
            style: TextStyle(
                fontSize: 14, fontWeight: FontWeight.w600, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
