import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:learninghub/Const/network.dart';
import 'package:learninghub/Helper/sharedPref.dart';
import 'package:learninghub/Helper/snackbar_toast_helper.dart';

Future LiveApi() async {
  var id = await getSharedPrefrence(ID);
  var token = await getSharedPrefrence(TOKEN);
  var cid = await getSharedPrefrence(CID);
  print("===============================");
  print(id);
  print(token);
  print(cid);
  print("===============================");
  final json = {
    'type': liveClassNew,
    'secKey': secKey,
    'studentId': id.toString(),
    'courseId': cid.toString(),
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
    convertDataToJson = 0;
    var msg = jsonDecode(response.body.toString());
    showToastSuccess(msg['attributes']['response']);
    print("response.body");
    print(response.body);
  }
  return convertDataToJson;
}
