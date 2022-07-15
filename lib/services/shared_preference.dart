import 'dart:developer';

import 'package:form1/services/service_api.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Sharedpredlocalstorage {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  String? savekey;
  String? getkey;
  String? username;
  String getusername = '';

  save() async {
    final SharedPreferences prefs = await _prefs;
    savekey = finalkey?.jwt.toString();
    username = finalkey?.user.username;

    log(savekey!);
    prefs.setString('jwt', savekey!);
    prefs.setString('username', username!);
  }

  retrieve() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    getusername = prefs.getString('username').toString();
    return getusername;
  }

  checkkey() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool CheckValue = prefs.containsKey('jwt');
    print(CheckValue);
  }

  removeValues() async {
    final SharedPreferences prefs = await _prefs;
    //Remove String
    prefs.remove("jwt");
  }
}
