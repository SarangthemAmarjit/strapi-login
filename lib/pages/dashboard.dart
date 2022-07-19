import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:form1/modals/jwt_model.dart';
import 'package:form1/pages/loginpage.dart';
import 'package:form1/pages/sidemenu.dart';
import 'package:form1/services/service_api.dart';
import 'package:form1/services/shared_preference.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'registerpage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:basic_utils/basic_utils.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  String getusername = '';
  String? usernamefinal;

  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawer(),
      appBar: AppBar(
        title: Text('Dash Board'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              'WELCOME',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
