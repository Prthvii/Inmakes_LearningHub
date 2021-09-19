import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:learninghub/Const/network.dart';
import 'package:learninghub/Helper/sharedPref.dart';
import 'package:learninghub/Helper/snackbar_toast_helper.dart';

Future seekPointApi(ContentID, exitTime, totalTime) async {
  var id = await getSharedPrefrence(ID);
  var token = await getSharedPrefrence(TOKEN);
  print("===============================");

  print("SeeekkkAPIII");
  print(id);
  print(token);
  print(ContentID);
  print(exitTime);
  print(totalTime);
  print("===============================");

  final json = {
    'type': VideoPlayerLog,
    'secKey': secKey,
    'videoId': ContentID.toString(),
    'studentId': id.toString(),
    'lastSeekPoint': exitTime.toString(),
    'totalVideoDuration': totalTime.toString(),
    'accessToken': token.toString(),
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
    print("Coursee Slt");

    print(response.body);
    convertDataToJson = 0;
    showToastSuccess("Something went wrong, Check internet connection!");
  }
  return convertDataToJson;
}
