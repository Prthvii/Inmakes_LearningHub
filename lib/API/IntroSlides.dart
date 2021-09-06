import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:learninghub/Const/network.dart';
import 'package:learninghub/Helper/snackbar_toast_helper.dart';

Future IntroSlidesApi() async {
  final json = {
    'type': IntroSlides,
    'secKey': secKey,
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
    print("IntroSlides");

    print(response.body);
    convertDataToJson = 0;
    showToastSuccess("Something went wrong, Check internet connection!");
  }
  return convertDataToJson;
}
