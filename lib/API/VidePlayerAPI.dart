import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:learninghub/Const/network.dart';
import 'package:learninghub/Helper/sharedPref.dart';
import 'package:learninghub/Helper/snackbar_toast_helper.dart';

Future VideoPlayerApi(ContentID) async {
  var id = await getSharedPrefrence(ID);
  var token = await getSharedPrefrence(TOKEN);
  var cid = await getSharedPrefrence(CID);
  print("===============================");
  print(id);
  print(token);
  print(cid);
  print(ContentID);
  print("===============================");
  final json = {
    'type': VideoPlayer,
    'secKey': secKey,
    'courseId': cid,
    'studentId': id.toString(),
    'contentId': ContentID,
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
