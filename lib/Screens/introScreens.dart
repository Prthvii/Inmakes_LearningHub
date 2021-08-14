import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:learninghub/Const/Constants.dart';

import '../BottomNav.dart';

class IntroScreens extends StatefulWidget {
  // const IntroScreens({Key? key}) : super(key: key);

  @override
  _IntroScreensState createState() => _IntroScreensState();
}

class _IntroScreensState extends State<IntroScreens> {
  final introKey = GlobalKey<IntroductionScreenState>();
  void _onIntroEnd(context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => BottomNav()),
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

  Widget _buildImage(String assetName, [double width = 350]) {
    return Image.asset('assets/$assetName', width: width);
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
        key: introKey,
        globalBackgroundColor: Colors.white,
        dotsDecorator: DotsDecorator(
            size: const Size.square(1.0),
            activeSize: const Size(1.0, 1.0),
            activeColor: Colors.white,
            color: Colors.white,
            spacing: const EdgeInsets.symmetric(horizontal: 0.0),
            activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0.0))),
        // globalFooter: GestureDetector(
        //   onTap: () {},
        //   child: Container(
        //       height: 56,
        //       width: 56,
        //       decoration: BoxDecoration(
        //           color: buttonGreen, borderRadius: BorderRadius.circular(5)),
        //       child: const Icon(
        //         Icons.arrow_forward,
        //         color: Colors.white,
        //       )),
        // ),
        pages: [
          PageViewModel(
            title: "Fractional shares",
            body:
                "Instead of having to buy an entire share, invest any amount you want.",
            image: Image.network(
              "https://wallpapercave.com/wp/wp2722822.jpg",
              fit: BoxFit.cover,
            ),
            decoration: pageDecoration,
          ),
          PageViewModel(
            title: "Learn as you go",
            body:
                "Download the Stockpile app and master the market with our mini-lesson.",
            image: Image.network("https://wallpapercave.com/wp/wp2722822.jpg"),
            decoration: pageDecoration,
          ),
          PageViewModel(
            title: "Kids and teens",
            body:
                "Kids and teens can track their stocks 24/7 and place trades that you approve.",
            image: Image.network("https://wallpapercave.com/wp/wp2722822.jpg"),
            decoration: pageDecoration,
          ),
          PageViewModel(
            title: "Full Screen Page",
            body:
                "Pages can be full screen as well.\n\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc id euismod lectus, non tempor felis. Nam rutrum rhoncus est ac venenatis.",
            image: Image.network("https://wallpapercave.com/wp/wp2722822.jpg"),
            decoration: pageDecoration.copyWith(
              contentMargin: const EdgeInsets.symmetric(horizontal: 16),
              // fullScreen: true,
              bodyFlex: 2,
              imageFlex: 3,
            ),
          ),
          PageViewModel(
            title: "Another title page",
            body: "Another beautiful body text for this example onboarding",
            image: Image.network("https://wallpapercave.com/wp/wp2722822.jpg"),
            decoration: pageDecoration,
          ),
        ],
        onDone: () => _onIntroEnd(context),
        showSkipButton: false,
        skipFlex: 0, isProgressTap: true,
        nextFlex: 0, isProgress: true,
        //rtl: true, // Display as right-to-left
        next: Container(
            height: 56,
            width: 56,
            decoration: BoxDecoration(
                color: buttonGreen, borderRadius: BorderRadius.circular(5)),
            child: const Icon(
              Icons.arrow_forward,
              color: Colors.white,
            )),
        done: const Text('Done',
            style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 15,
                color: Colors.black)),
        curve: Curves.fastLinearToSlowEaseIn,
        controlsMargin: const EdgeInsets.all(16),
        controlsPadding: kIsWeb
            ? const EdgeInsets.all(12.0)
            : const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
      ),
    );
  }
}
