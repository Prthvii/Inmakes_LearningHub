import 'package:shared_preferences/shared_preferences.dart';

///sahrepref const
final ID ="LS-ID";
final TOKEN ="LS-TOKEN";




Future setSharedPrefrence(key, data) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString(key, data);
}

Future getSharedPrefrence(key) async {
  var prefs = await SharedPreferences.getInstance();
  var value = prefs.getString(key);

  return value;
}
