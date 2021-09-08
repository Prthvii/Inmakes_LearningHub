import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:learninghub/Const/Constants.dart';

customSnackBar(BuildContext context, String msg, String action,
    GlobalKey<ScaffoldState> key, int seconds) {
  final SnackBar snackBar = SnackBar(
    content: Text(msg),
    duration: Duration(seconds: seconds),
    action: SnackBarAction(
        label: action, textColor: Colors.yellow, onPressed: () {}),
  );
  // ignore: deprecated_member_use
  key.currentState.showSnackBar(snackBar);
}

showToastError(String message) {
  Fluttertoast.showToast(
      msg: message,
      backgroundColor: Colors.black,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      textColor: Colors.white,
      fontSize: 16.0);
}

showToastSuccess(String message) {
  Fluttertoast.showToast(
      msg: message,
      backgroundColor: BlckColor,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      textColor: Colors.white,
      fontSize: 15.0);
}
