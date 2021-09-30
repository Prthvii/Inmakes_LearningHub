import 'dart:io';
import 'dart:isolate';
import 'dart:ui';

import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:learninghub/API/VidePlayerAPI.dart';
import 'package:learninghub/API/ViewCommentsApi.dart';
import 'package:learninghub/API/postCommentApi.dart';
import 'package:learninghub/API/seekPointApi.dart';
import 'package:learninghub/Const/Constants.dart';
import 'package:learninghub/Helper/snackbar_toast_helper.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:video_player/video_player.dart';

class PlayerScreen extends StatefulWidget {
  final ContentID;
  PlayerScreen({
    this.ContentID,
  });

  @override
  _PlayerScreenState createState() => _PlayerScreenState();
}

class _PlayerScreenState extends State<PlayerScreen> {
  ScrollController scrollController = new ScrollController();
  bool isVisible = true;
  var title;
  TextEditingController commentController = TextEditingController();

  int selected = 0;
  var arrList = [];
  var arrVideoInfo = [];
  var arrComments = [];
  var courseDetail = [];
  var lessons = [];
  var isLoading = true;
  var isVdoLoading = true;
  var isPlayable = true;
  var url;
  var heading;
  var mob;
  var videoId;
  var urlId = 0;
  var totalLength = 0;
  var exitPoint = 0;
  var courseFee = "0";
  ReceivePort _port = ReceivePort();
  TargetPlatform _platform;
  VideoPlayerController _videoPlayerController1;
  ChewieController _chewieController;
  var isSynopsis = false;
  var synopsisItem;
  var filesItem = [];
  var isFiles = false;

  //----------------------------------------------------

  @override
  void initState() {
    super.initState();
    this.video();
    scrollController.addListener(() {
      if (scrollController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        if (isVisible)
          setState(() {
            isVisible = false;
          });
      }
      if (scrollController.position.userScrollDirection ==
          ScrollDirection.forward) {
        if (!isVisible)
          setState(() {
            isVisible = true;
          });
      }
    });
    // this.comment();
    IsolateNameServer.registerPortWithName(
        _port.sendPort, 'downloader_send_port');
    _port.listen((dynamic data) {
      String id = data[0];
      DownloadTaskStatus status = data[1];
      int progress = data[2];
      setState(() {});
    });

    // FlutterDownloader.registerCallback(downloadCallback);
  }

  @override
  void dispose() {
    IsolateNameServer.removePortNameMapping('downloader_send_port');
    _videoPlayerController1.dispose();

    _chewieController.dispose();
    super.dispose();
  }

  ///downloadfile--
  // static void downloadCallback(
  //     String id, DownloadTaskStatus status, int progress) {
  //   final SendPort send =
  //       IsolateNameServer.lookupPortByName('downloader_send_port');
  //   send.send([id, status, progress]);
  // }

  // void _download(String url) async {
  //   final status = await Permission.storage.request();
  //
  //   if (status.isGranted) {
  //     showToastSuccess("Downloading...");
  //     final id = await FlutterDownloader.enqueue(
  //       url: url,
  //       savedDir: '/storage/emulated/0/Download/',
  //       showNotification: true,
  //       openFileFromNotification: true,
  //     );
  //     print("downdload");
  //     print(id);
  //     showToastSuccess("Downloaded!");
  //   } else {
  //     print('Permission Denied');
  //   }
  // }

  ///api----
  Future<String> video() async {
    var rsp = await VideoPlayerApi(widget.ContentID);
    // print("Player");
    // print(rsp);
    if (rsp['attributes']['status'].toString() == "Success") {
      setState(() {
        url = rsp["attributes"]["videos"]["vimeoHlsUrl"];
        heading = rsp["attributes"]["videos"]["sectionHeading"];
        mob = rsp["attributes"]["videos"]["supportNumber"];
        videoId = rsp["attributes"]["videos"]["contentId"];

        initializePlayer();
      });
      var response = await viewVideoComments(videoId);
      if (response["attributes"]['status'].toString() == "Success") {
        arrComments = response["attributes"]["comments"];
        print(arrComments);
      }
    } else {
      showToastSuccess("Something went wrong!");
    }
    setState(() {
      isLoading = false;
    });
    return "0";
  }

  ///video--

  Future<void> initializePlayer() async {
    _videoPlayerController1 = VideoPlayerController.network(url.toString());
    await _videoPlayerController1.initialize();
    setState(() {
      totalLength = _videoPlayerController1.value.duration.inSeconds;
    });
    print("total timeeeeeee");
    print(totalLength);
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController1,
      autoPlay: true,
      looping: false,
    );

    // _chewieController.enterFullScreen();
    setState(() {
      isLoading = false;
      isVdoLoading = false;
    });
  }

  Future<String> exiT() async {
    exitPoint = _videoPlayerController1.value.position.inSeconds;
    print("exitt  timeeeeeee");
    print(exitPoint);

    var rsp = await seekPointApi(
      widget.ContentID,
      exitPoint,
      totalLength,
    );
    print("senddd");
    print(rsp);
    return "0";
  }

  Future<bool> _onBackPressed() async {
    exiT();
    return Future<bool>.value(true);
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.black));
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
        backgroundColor: Color(0xff00202F),
        resizeToAvoidBottomInset: true,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(0.01),
          child: AppBar(
            elevation: 0,
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
            : Stack(
                children: [
                  Container(
                    child: Column(
                      children: [
                        isVdoLoading == true
                            ? Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.3,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SpinKitWave(
                                      color: buttonGreen,
                                      size: 20.0,
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      'Loading...',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white),
                                    ),
                                  ],
                                ),
                              )
                            : Container(
                                width: double.infinity,
                                height:
                                    MediaQuery.of(context).size.height * 0.3,
                                color: Colors.blueAccent,
                                child: Center(
                                  child: _chewieController != null &&
                                          _chewieController
                                              .videoPlayerController
                                              .value
                                              .isInitialized
                                      ? Chewie(
                                          controller: ChewieController(
                                            videoPlayerController:
                                                _videoPlayerController1,
                                            autoPlay: true,
                                            allowMuting: true,
                                          ),
                                        )
                                      : Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            CircularProgressIndicator(),
                                            SizedBox(height: 20),
                                            Text('Loading'),
                                          ],
                                        ),
                                ),
                              ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 3),
                          child: Container(
                            // color: Color(0xff00202F),
                            child: Column(
                              children: [
                                Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.09,
                                  color: Color(0xff00202F),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        flex: 5,
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(left: 10),
                                          child: Text(
                                            heading.toString(),
                                            maxLines: 2,
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10),
                                        child: Container(
                                          color: Colors.white30,
                                          height: 30,
                                          width: 1,
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
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
                                                    fontWeight:
                                                        FontWeight.w500),
                                              )
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.06,
                                  decoration: BoxDecoration(
                                      color: Color(0xff00202F),
                                      border: Border(
                                        top: BorderSide(
                                            width: 0.1, color: Colors.white70),
                                        bottom: BorderSide(
                                            width: 0.1, color: Colors.white70),
                                      )),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          child: Row(
                                            children: [
                                              Icon(
                                                Icons.arrow_back_ios,
                                                color: Colors.white70,
                                                size: 14,
                                              ),
                                              Text(
                                                "Previous",
                                                style: TextStyle(
                                                    color: Colors.white54,
                                                    fontSize: 10,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              )
                                            ],
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                          ),
                                        ),
                                        Container(
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Icon(
                                                Icons.radio_button_checked,
                                                color: buttonGreen,
                                                size: 14,
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
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                              Icon(
                                                Icons.arrow_forward_ios,
                                                color: Colors.white70,
                                                size: 14,
                                              ),
                                            ],
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: SingleChildScrollView(
                            child: Container(
                              color: Color(0xff00202F),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.31,
                                    child: Scrollbar(
                                      child: ListView.separated(
                                        scrollDirection: Axis.vertical,
                                        separatorBuilder: (context, index) =>
                                            SizedBox(
                                          height: 10,
                                        ),
                                        shrinkWrap: true,
                                        itemCount: arrComments != null
                                            ? arrComments.length
                                            : 0,
                                        itemBuilder: (context, index) {
                                          final item = arrComments != null
                                              ? arrComments[index]
                                              : null;
                                          return Comments(item, index);
                                        },
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    child: Column(
                                      children: [
                                        CommentBox(),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        ChatWhatsppButton()
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, top: 5),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Card(
                            elevation: 10,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(6.0),
                              child: Icon(
                                Icons.arrow_back_ios_outlined,
                                color: Colors.black,
                                size: 13,
                              ),
                            )),
                      ),
                    ),
                  )
                ],
              ),
      ),
    );
  }

  Comments(var item, int index) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.black, borderRadius: BorderRadius.circular(4)),
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Text(
                    item["comment"].toString(),
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white70,
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage(
                        "assets/images/person.png",
                      ),
                      alignment: Alignment.center,
                      fit: BoxFit.cover,
                    ),
                  ),
                  height: 30,
                  width: 30,
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Text(
                  item["postDate"].toString(),
                  style: TextStyle(
                      color: Colors.white70,
                      fontSize: 9,
                      fontWeight: FontWeight.w500),
                ),
                Spacer(),
                Text(
                  item["studentName"].toString(),
                  style: TextStyle(
                      color: Colors.white70,
                      fontSize: 9,
                      fontWeight: FontWeight.w500),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  CommentBox() {
    return Container(
      decoration: BoxDecoration(
          color: Color(0xff062E40),
          border: Border.all(
            color: Color(0xff13394A),
          ),
          borderRadius: BorderRadius.circular(4)),
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  color: Color(0xff062E40),
                  borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  cursorColor: Colors.white70,
                  maxLines: null,
                  controller: commentController,
                  autofocus: false,
                  textInputAction: TextInputAction.done,
                  style: TextStyle(
                      fontSize: 16,
                      letterSpacing: 0.8,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                  decoration: new InputDecoration(
                    border: InputBorder.none,
                    hintStyle:
                        TextStyle(fontSize: 14, color: Color(0xff446270)),
                    hintText: "Ask a question..",
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
            child: GestureDetector(
              onTap: () async {
                var comment =
                    await postComment(videoId, commentController.text);
                print("comment");
                print(comment);
                if (comment['attributes']['status'].toString() == "Success") {
                  showToastSuccess(comment["attributes"]["response"]);
                  commentController.clear();
                }
                setState(() {
                  isLoading = true;
                  video();
                });
              },
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(4)),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                  child: Text(
                    "Post",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 10,
                        fontWeight: FontWeight.bold),
                  ),
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
    );
  }

  ChatWhatsppButton() {
    return GestureDetector(
      onTap: () async {
        openwhatsapp();
      },
      child: Container(
        decoration: BoxDecoration(
            color: BlckColor,
            border: Border.all(
              color: buttonGreen,
            ),
            borderRadius: BorderRadius.circular(4)),
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                FontAwesomeIcons.whatsapp,
                color: buttonGreen,
                size: 16,
              ),
              Text(
                "    Chat with teacher",
                style: TextStyle(
                    color: buttonGreen,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
      ),
    );
  }

  openwhatsapp() async {
    var whatsapp = "+" + mob.toString();
    var whatsappURl_android =
        "whatsapp://send?phone=" + whatsapp + "&text=hello";
    var whatappURL_ios = "https://wa.me/$whatsapp?text=${Uri.parse("hello")}";
    if (Platform.isIOS) {
      // for iOS phone only
      if (await canLaunch(whatappURL_ios)) {
        await launch(whatappURL_ios, forceSafariVC: false);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: new Text("WhatsApp not installed!")));
      }
    } else {
      // android , web
      if (await canLaunch(whatsappURl_android)) {
        await launch(whatsappURl_android);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: new Text("WhatsApp not installed!"),
        ));
      }
    }
  }
}
