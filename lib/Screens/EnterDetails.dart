import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:learninghub/API/signupUser.dart';
import 'package:learninghub/Const/Constants.dart';
import 'package:learninghub/Helper/sharedPref.dart';
import 'package:learninghub/Helper/snackbar_toast_helper.dart';
import 'package:learninghub/Screens/schoolBoradSelect.dart';

class EnterDetails extends StatefulWidget {
  final mob;
  EnterDetails({this.mob});

  @override
  _EnterDetailsState createState() => _EnterDetailsState();
}

class _EnterDetailsState extends State<EnterDetails> {
  TextEditingController nameController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();
  TextEditingController pinController = new TextEditingController();

  String dropdownValue;
  bool isTap = false;
  int textLength = 0;
  void enableTap() {
    setState(() {
      isTap = true;
    });
  }

  void disableTap() {
    setState(() {
      isTap = false;
    });
  }

  List<String> statesList = [
    "Andhra Pradesh",
    "Arunachal Pradesh",
    "Assam",
    "Bihar",
    "Chhattisgarh",
    "Goa",
    "Gujarat",
    "Haryana",
    "Himachal Pradesh",
    "Jharkhand",
    "Karnataka",
    "Kerala",
    "Madhya Pradesh",
    "Maharashtra",
    "Manipur",
    "Meghalaya",
    "Mizoram",
    "Nagaland",
    "Odisha",
    "Punjab",
    "Rajasthan",
    "Sikkim",
    "Tamil Nadu",
    "Telangana",
    "Tripura",
    "Uttar Pradesh",
    "Uttarakhand",
    "West Bengal",
  ];
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
                              "Student Details",
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
      onTap: () async {
        var name = nameController.text.toString();
        var email = emailController.text.toString();
        var pin = pinController.text.toString();
        if (name.isNotEmpty && email.isNotEmpty && pin.isNotEmpty) {
          enableTap();
          var rsp = await signUpApi(widget.mob.toString(), nameController.text,
              emailController.text, dropdownValue, pinController);

          print("--------------------------------------");
          print(name + ", " + dropdownValue + ", " + pin + ", " + email);
          print("--------------------------------------");

          print(rsp);
          if (rsp['attributes']['status'].toString() == "Success") {
            var id = await setSharedPrefrence(
                ID, rsp['attributes']['data'][0]['studentId']);
            var token = await setSharedPrefrence(
                TOKEN, rsp['attributes']['data'][0]['accessToken']);
            print(id);
            print(token);
            showToastSuccess("Account Created!");
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SelectSchoolBoard()),
            );
          }
          disableTap();
        } else {
          showToastSuccess("Oops! Something's wrong. Fill all fields above.");
        }
        setState(() {
          isTap = false;
        });
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 32, vertical: 10),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.white10),
            borderRadius: BorderRadius.circular(4),
            color: nameController.text.isEmpty ||
                    emailController.text.isEmpty ||
                    pinController.text.isEmpty
                ? Colors.grey
                : buttonGreen),
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
            controller: nameController,
            autofocus: false,
            // inputFormatters: [LengthLimitingTextInputFormatter(10)],
            style: TextStyle(
                fontSize: 14, color: Colors.white, fontWeight: FontWeight.w500),
            decoration: new InputDecoration(
              border: InputBorder.none,
              hintStyle: blckTextStyle,
              hintText: "Full Name",
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
            controller: pinController,
            autofocus: false,
            inputFormatters: [
              LengthLimitingTextInputFormatter(6),
            ],
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
            keyboardType: TextInputType.emailAddress,
            controller: emailController,
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
          icon: const Icon(
            Icons.keyboard_arrow_down_rounded,
            color: Colors.white,
          ),
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
          items: statesList.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              onTap: () {
                setState(() {
                  dropdownValue = value.toString();
                });
              },
              child: Text(
                value,
                style: TextStyle(color: Colors.white, fontSize: 14),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
