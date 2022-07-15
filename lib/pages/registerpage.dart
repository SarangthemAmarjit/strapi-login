import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:form1/Refactor/inputfield.dart';
import 'package:form1/pages/dashboard.dart';
import 'package:form1/services/service_api.dart';
import 'package:form1/services/shared_preference.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'lastpage.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _MyWidgetState();
}

final _usernameController = TextEditingController();
final _emailController = TextEditingController();
final _passwordController = TextEditingController();

class _MyWidgetState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              child: Form(
                  child: Column(
            children: [
              Namefield(
                usercon: _usernameController,
              ),
              Emailfield(
                emailcon: _emailController,
              ),
              PasswordField(
                passcon: _passwordController,
              ),
              SizedBox(
                height: 50,
              ),
              ElevatedButton(
                  onPressed: (() {
                    String name1 = _usernameController.text;
                    String email1 = _emailController.text;
                    String password1 = _passwordController.text;
                    log(name1);

                    ServiceApi()
                        .submitData(name1, email1, password1)
                        .whenComplete(() => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Dashboard())));
                    Sharedpredlocalstorage().save();
                  }),
                  child: const Text(
                    'Submit',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ))
            ],
          ))),
        ],
      ),
    );
  }
}
