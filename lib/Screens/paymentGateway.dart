import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:learninghub/MainScreens/HomePage.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class paymentPage extends StatefulWidget {
  // final amount;
  final id;

  paymentPage({this.id});
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<paymentPage> {
  Razorpay _razorpay;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
            child: Center(
          child: Image.asset(
            "assets/images/loading.gif",
            height: 40,
          ),
        )),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
    openCheckout();
  }

  @override
  void dispose() {
    super.dispose();
    _razorpay.clear();
  }

  void openCheckout() async {
    var options = {
      'key': 'rzp_test_1DP5mmOlF5G5ag',
      // 'amount': int.parse(widget.amount.toString()) * 100,
      'amount': 999 * 100,
      'name': 'Inmakes Learning Hub',
      // 'image': 'https://www.lifescool.app/lf-logo.jpeg',
      'description': 'Your learning partner',
      'prefill': {'contact': '8888888888', 'email': 'test@razorpay.com'},
      'external': {
        'wallets': ['paytm']
      }
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      debugPrint('Error: e');
    }
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) async {
    // var rsp = await subCourse(widget.id);
    // if (rsp != 0) {
    Fluttertoast.showToast(
        msg: "SUCCESS: " + response.paymentId, toastLength: Toast.LENGTH_SHORT);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
          builder: (context) => HomePage(
              // id: widget.id,
              )),
    );
    // } else {
    //   Fluttertoast.showToast(
    //       msg: "Failure occurred!", toastLength: Toast.LENGTH_SHORT);
    //   Navigator.pop(context);
    // }
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    Fluttertoast.showToast(
        msg: "ERROR: " + response.code.toString() + " - " + response.message,
        toastLength: Toast.LENGTH_SHORT);
    Navigator.pop(context);
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    Fluttertoast.showToast(
        msg: "EXTERNAL_WALLET: " + response.walletName,
        toastLength: Toast.LENGTH_SHORT);
    Navigator.pop(context);
  }
}
