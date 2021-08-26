import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:learninghub/Const/Constants.dart';
import 'package:learninghub/Screens/schoolBoradSelect.dart';

class EnterDetails extends StatefulWidget {
  const EnterDetails({key}) : super(key: key);

  @override
  _EnterDetailsState createState() => _EnterDetailsState();
}

class _EnterDetailsState extends State<EnterDetails> {
  String dropdownValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.5,
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
                              "Enter your mobile number",
                              style: TextStyle(
                                  fontSize: 20,
                                  color: BlckColor,
                                  fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "We will send you an OTP to verify.",
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Color(0xff9F9F9F),
                                  fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                alignment: Alignment.center,
                height: MediaQuery.of(context).size.height * 0.5,
                decoration: BoxDecoration(
                    color: BlckColor,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(16),
                        topRight: Radius.circular(16))),
                child: Wrap(
                  runSpacing: 10,
                  alignment: WrapAlignment.center,
                  children: [
                    NameField(),
                    EmailField(),
                    StateDropDown(),
                    Pincode(),
                    Button()
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget Button() {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SelectSchoolBoard()),
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
            "Register",
            style: TextStyle(
                fontSize: 14, fontWeight: FontWeight.w600, color: Colors.white),
          ),
        ),
      ),
    );
  }

  Widget NameField() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 32),
      child: Container(
        alignment: Alignment.center,
        height: 51,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.white10),
            borderRadius: BorderRadius.circular(4),
            color: liteBlack),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: TextFormField(
            cursorColor: Colors.white12,
            keyboardType: TextInputType.phone,
            // controller: mobController,
            autofocus: false,
            // inputFormatters: [LengthLimitingTextInputFormatter(10)],
            style: TextStyle(
                fontSize: 14, color: Colors.white, fontWeight: FontWeight.w500),
            decoration: new InputDecoration(
              border: InputBorder.none,
              hintStyle: blckTextStyle,
              hintText: "Mobile Number",
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
            ),
          ),
        ),
      ),
    );
  }

  Widget Pincode() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 32),
      child: Container(
        alignment: Alignment.center,
        height: 51,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.white10),
            borderRadius: BorderRadius.circular(4),
            color: liteBlack),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: TextFormField(
            cursorColor: Colors.white12,
            keyboardType: TextInputType.phone,
            // controller: mobController,
            autofocus: false,
            // inputFormatters: [LengthLimitingTextInputFormatter(10)],
            style: TextStyle(
                fontSize: 14, color: Colors.white, fontWeight: FontWeight.w500),
            decoration: new InputDecoration(
              border: InputBorder.none,
              hintStyle: blckTextStyle,
              hintText: "Pin Code",
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
            ),
          ),
        ),
      ),
    );
  }

  Widget EmailField() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 32),
      child: Container(
        alignment: Alignment.center,
        height: 51,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.white10),
            borderRadius: BorderRadius.circular(4),
            color: liteBlack),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: TextFormField(
            cursorColor: Colors.white12,
            keyboardType: TextInputType.phone,
            // controller: mobController,
            autofocus: false,
            // inputFormatters: [LengthLimitingTextInputFormatter(10)],
            style: TextStyle(
                fontSize: 14, color: Colors.white, fontWeight: FontWeight.w500),
            decoration: new InputDecoration(
              border: InputBorder.none,
              hintStyle: blckTextStyle,
              hintText: "Email",
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
            ),
          ),
        ),
      ),
    );
  }

  Widget StateDropDown() {
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
          value: dropdownValue,
          isExpanded: true,
          icon: const Icon(Icons.keyboard_arrow_down_rounded),
          iconSize: 24,
          elevation: 16,
          dropdownColor: liteBlack,
          hint: Text(
            'Select State',
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
      ),
    );
  }
}
