import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:form1/modals/jwt_model.dart';
import 'package:form1/services/service_api.dart';
import 'package:form1/services/shared_preference.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'registerpage.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  String getusername = '';
  retrievefinal() async {
    getusername = await Sharedpredlocalstorage().retrieve();
    return getusername;
  }

  @override
  void initState() {
    super.initState();
    retrievefinal();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dash Board'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              'WELCOME  $getusername',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ),
          // Center(
          //     child: ElevatedButton(
          //         onPressed: () async {
          //           await Sharedpredlocalstorage().checkkey();
          //         },
          //         child: Text('Check Key')))
        ],
      ),
    );
  }
}
