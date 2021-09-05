import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:learninghub/Const/network.dart';
import 'package:learninghub/Helper/snackbar_toast_helper.dart';

Future sendOtpApi(num) async {
  final json = {
    'type': sendOtp,
    'secKey': secKey,
    'mobileNumber': num.toString(),
    'countryCode': countryCode,
  };

  final response = await http.post(
      Uri.parse(
        baseUrl,
      ),
      body: json);
  var convertDataToJson;

  if (response.statusCode == 200) {
    print("response.body");

    convertDataToJson = jsonDecode(response.body.toString());
    // If the server did return a 200 OK response,
    // then parse the JSON.
    print(convertDataToJson);
  } else {
    convertDataToJson = 0;
    showToastSuccess("Something went wrong, Check internet connection!");
  }
  return convertDataToJson;
}
