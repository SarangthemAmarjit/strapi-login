import 'package:flutter/material.dart';
import 'package:form1/main.dart';
import 'package:form1/modals/jwt_model.dart';
import 'package:form1/services/service_api.dart';
import 'package:form1/services/shared_preference.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dashboard.dart';
import 'registerpage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      title: 'Demo Form',
      home: const LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _FormhomeState();
}

class _FormhomeState extends State<LoginPage> {
  checkkey() async {
    JwtModel finalkey;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey('jwt')) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Dashboard()));
    }
  }

  final _passwordlogin = TextEditingController();
  final _emaillogin = TextEditingController();
  @override
  void initState() {
    super.initState;
    checkkey();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.red, Colors.yellow])),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 80,
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Login",
                    style: TextStyle(color: Colors.white, fontSize: 40),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Welcome Back",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
                child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(40),
                              topRight: Radius.circular(40))),
                      child: Padding(
                        padding: const EdgeInsets.all(30),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 60,
                            ),
                            Container(
                              padding: EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Color.fromRGBO(255, 95, 27, 3),
                                        blurRadius: 20,
                                        offset: Offset(0, 10))
                                  ]),
                              child: Column(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                                color: Colors.grey))),
                                    child: TextField(
                                      keyboardType: TextInputType.emailAddress,
                                      controller: _emaillogin,
                                      decoration: InputDecoration(
                                          hintText: "Email or Phone Number",
                                          hintStyle: TextStyle(
                                              color: Colors.grey[400]),
                                          border: InputBorder.none),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                                color: Colors.grey))),
                                    child: TextField(
                                      obscureText: true,
                                      keyboardType:
                                          TextInputType.visiblePassword,
                                      controller: _passwordlogin,
                                      decoration: InputDecoration(
                                          hintText: "Password",
                                          hintStyle: TextStyle(
                                              color: Colors.grey[400]),
                                          border: InputBorder.none),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            Text(
                              "Forget Password?",
                              style: TextStyle(color: Colors.grey),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Stack(
                              alignment: Alignment.center,
                              children: [
                                Container(
                                  width: 130,
                                  height: 40,
                                  decoration: BoxDecoration(
                                      color: Colors.orange[900],
                                      borderRadius: BorderRadius.circular(20)),
                                ),
                                TextButton(
                                    onPressed: () {
                                      String email1 = _emaillogin.text;
                                      var password1 = _passwordlogin.text;

                                      ServiceApi()
                                          .LoginData(email1, password1)
                                          .whenComplete(() => Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const Dashboard())));
                                      Sharedpredlocalstorage().save();
                                    },
                                    child: Text(
                                      "Login",
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.white),
                                    ))
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Stack(
                              alignment: Alignment.center,
                              children: [
                                Container(
                                  width: 150,
                                  height: 40,
                                  decoration: BoxDecoration(
                                      color: Colors.orange[900],
                                      borderRadius: BorderRadius.circular(20)),
                                ),
                                TextButton(
                                    onPressed: () => {
                                          {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        RegisterPage()))
                                          }
                                        },
                                    child: Text(
                                      "New Registration",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                          color: Colors.white),
                                    )),
                                SizedBox(
                                  height: 250,
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    )))
          ],
        ),
      ),
    );
  }
}
