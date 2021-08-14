import 'package:flutter/material.dart';
import 'package:learninghub/Const/Constants.dart';

import 'introScreens.dart';

class SelectSchoolBoard extends StatefulWidget {
  @override
  _SelectSchoolBoardState createState() => _SelectSchoolBoardState();
}

class _SelectSchoolBoardState extends State<SelectSchoolBoard> {
  String BoardDropdownValue;
  String ClassDropdownValue;

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
                    children: [SelectBoard(), SelectClass(), Button()],
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
          icon: const Icon(Icons.keyboard_arrow_down_rounded),
          iconSize: 24,
          elevation: 16,
          dropdownColor: liteBlack,
          hint: Text(
            'Select Board',
            style: blckTextStyle,
          ),
          underline: Container(),
          style: const TextStyle(
            color: Color(
              0xff446270,
            ),
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
          onChanged: (String newValue) {
            setState(() {
              BoardDropdownValue = newValue;
            });
          },
          items: <String>['CBSE', 'STATE', 'ICSE']
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget SelectClass() {
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
          icon: const Icon(Icons.keyboard_arrow_down_rounded),
          iconSize: 24,
          elevation: 16,
          dropdownColor: liteBlack,
          hint: Text(
            'Select Class',
            style: blckTextStyle,
          ),
          underline: Container(),
          style: const TextStyle(
            color: Color(
              0xff446270,
            ),
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
          onChanged: (String newValue) {
            setState(() {
              ClassDropdownValue = newValue;
            });
          },
          items: <String>['One', 'Two', 'Three', 'Four']
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
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
