import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:learninghub/Const/Constants.dart';
import 'package:learninghub/Screens/OTPScreen.dart';

class EnterNum extends StatefulWidget {
  const EnterNum({key}) : super(key: key);

  @override
  _EnterNumState createState() => _EnterNumState();
}

class _EnterNumState extends State<EnterNum> {
  final mobController = TextEditingController();

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
                      margin: EdgeInsets.symmetric(horizontal: 30),
                      child: Center(
                        child: SvgPicture.asset(
                          "assets/images/logo.svg",
                          height: 200,
                          width: 200,
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
                height: MediaQuery.of(context).size.height * 0.3,
                decoration: BoxDecoration(
                    color: BlckColor,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(16),
                        topRight: Radius.circular(16))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    NumberField(),
                    SizedBox(
                      height: 20,
                    ),
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

  Widget NumberField() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 32),
      child: Row(
        children: [
          Container(
            alignment: Alignment.center,
            height: 51,
            width: 51,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.white10),
                borderRadius: BorderRadius.circular(4),
                color: liteBlack),
            child: Text(
              "+91",
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.white),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Flexible(
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
                  controller: mobController,
                  autofocus: false,
                  inputFormatters: [LengthLimitingTextInputFormatter(10)],
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                      fontWeight: FontWeight.w500),
                  decoration: new InputDecoration(
                    border: InputBorder.none,
                    hintStyle: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff446270)),
                    hintText: "Mobile Number",
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget Button() {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  OTPScreen(mob: mobController.text.toString())),
        );
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
            "Continue",
            style: TextStyle(
                fontSize: 14, fontWeight: FontWeight.w600, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
