import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:learninghub/Const/network.dart';
import 'package:learninghub/Helper/sharedPref.dart';
import 'package:learninghub/Helper/snackbar_toast_helper.dart';

Future sendSeek(courseId, chapterId, lastSeekPoint, videoTotalDuration) async {
  var id = await getSharedPrefrence(ID);
  var token = await getSharedPrefrence(TOKEN);

  final json = {
    'request_header': '',
    'secKey': secKey,
    'studentId': id.toString(),
    'apiToken': token.toString(),
    'courseId': courseId.toString(),
    'chapterId': chapterId.toString(),
    'lastSeekPoint': lastSeekPoint.toString(),
    'videoTotalDuration': videoTotalDuration.toString(),
  };
  final response = await http.post(
    Uri.parse(
      baseUrl,
    ),
    body: json,
  );
  var convertDataToJson;

  if (response.statusCode == 200) {
    print("courseeeeee");

    print(response.body);
    convertDataToJson = jsonDecode(response.body.toString());

    // If the server did return a 200 OK response,
    // then parse the JSON.
  } else {
    convertDataToJson = jsonDecode(response.body.toString());
    var msg = jsonDecode(response.body.toString());
    showToastSuccess(msg['attributes']['response']);
    print("response.body");
    print(response.body);
  }
  return convertDataToJson;
}
