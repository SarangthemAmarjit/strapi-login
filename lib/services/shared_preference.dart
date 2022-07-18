import 'dart:developer';

import 'package:form1/services/service_api.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Sharedpredlocalstorage {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  String? savekey;
  String getkey = '';
  String? username;
  String getusername = '';

  save() async {
    final SharedPreferences prefs = await _prefs;
    savekey = finalkey?.jwt;
    username = finalkey?.user.username;
    print(savekey);

    //log(savekey.toString());
    prefs.setString('jwt', savekey.toString());
    prefs.setString('username', username.toString());
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
}
