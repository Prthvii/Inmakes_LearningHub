import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:learninghub/Const/Constants.dart';
import 'package:learninghub/Widgets/newBottomNav.dart';

class IntroScreens extends StatefulWidget {
  // const IntroScreens({Key? key}) : super(key: key);

  @override
  _IntroScreensState createState() => _IntroScreensState();
}

class _IntroScreensState extends State<IntroScreens> {
  var isLoading = true;
  var arrIntroImages = [];
  var arrImages = [];
  List<String> img = [];

  final introKey = GlobalKey<IntroductionScreenState>();
  void _onIntroEnd(context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => newBottom()),
    );
  }

  Widget _buildFullscrenImage() {
    return Image.network(
      'https://wallpapercave.com/wp/wp2722822.jpg',
      fit: BoxFit.cover,
      height: double.infinity,
      width: double.infinity,
      alignment: Alignment.center,
    );
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.dark.copyWith(statusBarColor: Colors.transparent),
    );
    const bodyStyle = TextStyle(
        fontSize: 14.0, fontWeight: FontWeight.w500, color: Color(0xff9F9F9F));
    const pageDecoration = const PageDecoration(
      bodyAlignment: Alignment.center,
      bodyFlex: 0,
      titleTextStyle: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.w700,
          color: Color(0xff002333)),
      bodyTextStyle: bodyStyle,
      descriptionPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Colors.white,
      imageAlignment: Alignment.center,
    );
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: IntroductionScreen(
        key: introKey, animationDuration: 3,
        globalBackgroundColor: Colors.white,
        dotsDecorator: DotsDecorator(
            size: const Size.square(5.0),
            activeSize: const Size(10.0, 10.0),
            activeColor: Colors.black,
            color: Colors.black38,
            spacing: const EdgeInsets.symmetric(horizontal: 5.0),
            activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0))),
        pages: [
          PageViewModel(
            bodyWidget: Image.asset("assets/images/Intro/intro1.jpg"),
            titleWidget: Text(""),
            decoration: pageDecoration,
          ),
          PageViewModel(
            bodyWidget: Image.asset("assets/images/Intro/intro2.jpg"),
            titleWidget: Text(""),
          ),
          PageViewModel(
            bodyWidget: Image.asset("assets/images/Intro/intro3.jpg"),
            titleWidget: Text(""),
          ),
        ],
        onDone: () => _onIntroEnd(context),
        showSkipButton: true,
        skip: Text(
          "Skip",
          style: TextStyle(color: Colors.black54, fontWeight: FontWeight.w500),
        ),
        skipFlex: 0, isProgressTap: true,
        nextFlex: 0, isProgress: true,
        //rtl: true, // Display as right-to-left
        next: Container(
          width: 100,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: BlckColor, borderRadius: BorderRadius.circular(5)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: const Text('Next',
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                    color: Colors.white)),
          ),
        ),
        done: Container(
          width: 100,
          decoration: BoxDecoration(
              color: buttonGreen, borderRadius: BorderRadius.circular(5)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                FittedBox(
                  fit: BoxFit.fitWidth,
                  child: const Text('Get Started',
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                          color: Colors.white)),
                ),
                SizedBox(
                  width: 5,
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                  size: 13,
                )
              ],
            ),
          ),
        ),
        curve: Curves.fastLinearToSlowEaseIn,
        controlsMargin: const EdgeInsets.all(16),
        controlsPadding: kIsWeb
            ? const EdgeInsets.all(12.0)
            : const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
      ),
    );
  }
}
