import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:learninghub/Const/network.dart';
import 'package:learninghub/Helper/snackbar_toast_helper.dart';

Future signUpApi(num, name, email, state, pin) async {
  final json = {
    'type': reg,
    'secKey': secKey,
    'mobileNumber': num.toString(),
    'countryCode': countryCode,
    'fullName': name.toString(),
    'emailId': email.toString(),
    'devicePlatform': " ",
    'referralCode': "",
    'centerId': "Android",
    'deviceName': "Huwai",
    'appVersion': "1.0.0",
  };

  final response = await http.post(
    Uri.parse(
      baseUrl,
    ),
    body: json,
  );
  var convertDataToJson;

  if (response.statusCode == 200) {
    convertDataToJson = jsonDecode(response.body.toString());

    // If the server did return a 200 OK response,
    // then parse the JSON.
  } else {
    convertDataToJson = 0;
    showToastSuccess("Something went wrong, Check internet connection!");
  }
  return convertDataToJson;
}
