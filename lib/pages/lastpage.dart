import 'package:flutter/material.dart';
import 'package:form1/pages/loginpage.dart';

class Lastpage extends StatefulWidget {
  const Lastpage({
    Key? key,
  }) : super(key: key);

  @override
  State<Lastpage> createState() => _LastpageState();
}

class _LastpageState extends State<Lastpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Registration Completed"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Text(
                  "Registration Completed",
                  style: TextStyle(fontSize: 25),
                ),
                SizedBox(
                  height: 10,
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginPage()));
                  },
                  child: Text('click here',
                      style: TextStyle(fontSize: 20, color: Colors.green)),
                ),
                Text('to go to Login Page',
                    style: TextStyle(
                      fontSize: 20,
                    ))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
