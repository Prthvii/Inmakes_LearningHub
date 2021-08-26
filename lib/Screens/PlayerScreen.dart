import 'package:flutter/material.dart';
import 'package:learninghub/Const/Constants.dart';

class PlayerScreen extends StatefulWidget {
  // const PlayerScreen({Key? key}) : super(key: key);

  @override
  _PlayerScreenState createState() => _PlayerScreenState();
}

class _PlayerScreenState extends State<PlayerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.3,
                  color: Colors.blueAccent,
                  child: Center(child: Text("Video Player Section")),
                ),
                Container(
                  child: Column(
                    children: [
                      Container(
                        color: Color(0xff00202F),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 25),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 5,
                                child: Text(
                                  "Long Chapter Name can be here shown here",
                                  maxLines: 2,
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Container(
                                  color: Colors.white30,
                                  height: 30,
                                  width: 1,
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  child: Column(
                                    children: [
                                      Icon(
                                        Icons.download_rounded,
                                        size: 15,
                                        color: Colors.white70,
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        "Download",
                                        style: TextStyle(
                                            color: Colors.white70,
                                            fontSize: 8,
                                            fontWeight: FontWeight.w500),
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        color: Colors.white12,
                        width: double.infinity,
                        height: 0.1,
                      ),
                      Container(
                        color: Color(0xff00202F),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 25),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.arrow_back_ios,
                                      color: Colors.white70,
                                      size: 16,
                                    ),
                                    Text(
                                      "Previous",
                                      style: TextStyle(
                                          color: Colors.white54,
                                          fontSize: 10,
                                          fontWeight: FontWeight.w400),
                                    )
                                  ],
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                ),
                              ),
                              Container(
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.radio_button_checked,
                                      color: buttonGreen,
                                      size: 15,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      "Part 1",
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                          color: buttonGreen),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                child: Row(
                                  children: [
                                    Text(
                                      "Next",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 10,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Icon(
                                      Icons.arrow_forward_ios,
                                      color: Colors.white70,
                                      size: 16,
                                    ),
                                  ],
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        color: Colors.white12,
                        width: double.infinity,
                        height: 0.1,
                      ),
                    ],
                  ),
                ),
                Flexible(
                  child: Container(
                    color: Color(0xff00202F),
                  ),
                )
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(4)),
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Text(
                            "Your sample question can be shown here no matter how long",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: NetworkImage(
                                      "https://www.bolde.com/wp-content/uploads/2020/09/iStock-1269607964.jpg"),
                                  fit: BoxFit.cover)),
                          height: 30,
                          width: 30,
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Color(0xff062E40),
                      border: Border.all(
                        color: Color(0xff13394A),
                      ),
                      borderRadius: BorderRadius.circular(4)),
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                                color: Color(0xff062E40),
                                borderRadius: BorderRadius.circular(10)),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: TextFormField(
                                cursorColor: Colors.white70,
                                autofocus: false,
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w500),
                                decoration: new InputDecoration(
                                  border: InputBorder.none,
                                  hintStyle: TextStyle(
                                      fontSize: 14, color: Color(0xff446270)),
                                  hintText: "Ask a question?",
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  errorBorder: InputBorder.none,
                                  disabledBorder: InputBorder.none,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(4)),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 10),
                              child: Text(
                                "Post",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        )

                        // Text(
                        //   "Chat with teacher",
                        //   style: TextStyle(
                        //       color: buttonGreen,
                        //       fontSize: 16,
                        //       fontWeight: FontWeight.w600),
                        // ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: BlckColor,
                      border: Border.all(
                        color: buttonGreen,
                      ),
                      borderRadius: BorderRadius.circular(4)),
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Image(
                        //   image: AssetImage("assets/images/whatsapp.png"),
                        //   height: 16,
                        //   width: 16,
                        // ),
                        // SizedBox(
                        //   width: 10,
                        // ),
                        Text(
                          "Chat with teacher",
                          style: TextStyle(
                              color: buttonGreen,
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
