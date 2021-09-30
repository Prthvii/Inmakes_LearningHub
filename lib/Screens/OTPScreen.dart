import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:learninghub/API/sendOTP.dart';
import 'package:learninghub/API/verifyOtp.dart';
import 'package:learninghub/Const/Constants.dart';
import 'package:learninghub/Helper/sharedPref.dart';
import 'package:learninghub/Helper/snackbar_toast_helper.dart';
import 'package:learninghub/Screens/EnterDetails.dart';
import 'package:learninghub/Widgets/newBottomNav.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:timer_button/timer_button.dart';

class OTPScreen extends StatefulWidget {
  final mob;

  OTPScreen({this.mob});

  @override
  _OTPScreenState createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  TextEditingController otpController = new TextEditingController();
  bool isTap = false;
  bool otpFail = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(1.0),
        child: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
        ),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.6,
                child: Stack(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.1,
                      ),
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
                              "Verification code",
                              style: TextStyle(
                                  fontSize: 20,
                                  color: BlckColor,
                                  fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "Please type the verification code sent to",
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Color(0xff9F9F9F),
                                  fontWeight: FontWeight.w500),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              "+91 ${widget.mob.toString()}",
                              style: TextStyle(
                                  fontSize: 14,
                                  color: BlckColor,
                                  fontWeight: FontWeight.w500),
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
                height: MediaQuery.of(context).size.height * 0.37,
                decoration: BoxDecoration(
                    color: BlckColor,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(16),
                        topRight: Radius.circular(16))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 40,
                      ),
                      child: Container(
                        child: Column(
                          children: [
                            OTP(),
                            Button(),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                Spacer(),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 30),
                                  child: SizedBox(
                                    height: 30,
                                    child: TimerButton(
                                      label: "Resend OTP",
                                      color: BlckColor,
                                      // resetTimerOnPressed: true,
                                      buttonType: ButtonType.FlatButton,
                                      timeOutInSeconds: 30,
                                      onPressed: () async {
                                        print("resend");
                                        var rsp = await sendOtpApi(
                                            widget.mob.toString());
                                        print("rsp['attributes']");
                                        if (rsp['attributes']['message']
                                                .toString() ==
                                            "Success") {
                                          showToastSuccess("OTP Resented!");
                                        }
                                      },
                                      disabledColor: Colors.red,
                                      // color: BlckColor,
                                      disabledTextStyle: new TextStyle(
                                          fontSize: 12.0, color: Colors.grey),
                                      activeTextStyle: new TextStyle(
                                        fontSize: 12.0,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      child: Padding(
                        padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).size.height * 0.03,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              CupertinoIcons.phone_fill,
                              color: buttonGreen,
                              size: 18,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "Contact Us",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: buttonGreen),
                            )
                          ],
                        ),
                      ),
                    )
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
      onTap: () async {
        setState(() {
          isTap = true;
          otpFail = false;
        });
        var rsp = await verifyOtpApi(widget.mob.toString(), otpController.text);
        print("rsp['attributes']");
        print(rsp);
        if (rsp['attributes']['status'].toString() == "Success") {
          if (rsp['attributes']['newStudent'].toString() == "old") {
            print("id");
            print(rsp['attributes']["studentInfo"][0]['studentId']);
            print("token");
            print(rsp['attributes']['studentInfo'][0]['accessToken']);
            var id = await setSharedPrefrence(ID,
                rsp['attributes']["studentInfo"][0]['studentId'].toString());
            var token = await setSharedPrefrence(TOKEN,
                rsp['attributes']['studentInfo'][0]['accessToken'].toString());

            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => newBottom()),
            );
          } else {
            print("new user");
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => EnterDetails(
                        mob: widget.mob.toString(),
                      )),
            );
          }
        } else if (rsp['attributes']['response'].toString() ==
            "Verification failed.") {
          showToastSuccess("Invalid OTP!");
          setState(() {
            otpFail = true;
          });
        }
        setState(() {
          isTap = false;
        });
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

  OTP() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 32),
      child: PinCodeTextField(
        appContext: context,
        length: 6,
        autoDisposeControllers: false,
        blinkWhenObscuring: true,
        animationType: AnimationType.fade,
        // validator: (v) {},
        pinTheme: PinTheme(
          inactiveFillColor: liteBlack,
          activeFillColor: liteBlack,
          selectedFillColor: liteBlack,
          borderWidth: 1,
          activeColor: liteBlack,
          inactiveColor: liteBlack,
          selectedColor: liteBlack,
          shape: PinCodeFieldShape.box,
          borderRadius: BorderRadius.circular(4),
          fieldHeight: 45,
          fieldWidth: 45,
        ),
        cursorColor: Colors.white,
        animationDuration: Duration(milliseconds: 300),
        enableActiveFill: true,
        // controller: _otpController,
        keyboardType: TextInputType.number,
        textStyle: TextStyle(color: Colors.white, fontSize: 16),
        controller: otpController,
        onCompleted: (v) async {
          setState(() {
            isTap = true;
            otpFail = false;
          });
          var rsp =
              await verifyOtpApi(widget.mob.toString(), otpController.text);
          print("rsp['attributes']");
          print(rsp);
          if (rsp['attributes']['status'].toString() == "Success") {
            if (rsp['attributes']['newStudent'].toString() == "old") {
              print("id");
              print(rsp['attributes']["studentInfo"][0]['studentId']);
              print("token");
              print(rsp['attributes']['studentInfo'][0]['accessToken']);
              var id = await setSharedPrefrence(ID,
                  rsp['attributes']["studentInfo"][0]['studentId'].toString());
              var token = await setSharedPrefrence(
                  TOKEN,
                  rsp['attributes']['studentInfo'][0]['accessToken']
                      .toString());

              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => newBottom()),
              );
            } else {
              print("new user");
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => EnterDetails(
                          mob: widget.mob.toString(),
                        )),
              );
            }
          } else if (rsp['attributes']['response'].toString() ==
              "Verification failed.") {
            showToastSuccess("Invalid OTP!");
            setState(() {
              otpFail = true;
            });
          }
          setState(() {
            isTap = false;
          });
        },
        onChanged: (value) {},
        beforeTextPaste: (text) {
          print("Allowing to paste $text");
          //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
          //but you can show anything you want here, like your pop up saying wrong paste format or etc
          return true;
        },
      ),
    );
  }
}
