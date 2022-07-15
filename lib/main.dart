import 'package:flutter/material.dart';
import 'package:form1/pages/loginpage.dart';

void main() {
  runApp(Myapp());
}

class Myapp extends StatefulWidget {
  const Myapp({Key? key}) : super(key: key);

  @override
  State<Myapp> createState() => _MyappState();
}

class _MyappState extends State<Myapp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Strapi log in App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: LoginPage(),
    );
  }
}

class StrapiLogin extends StatefulWidget {
  const StrapiLogin({Key? key}) : super(key: key);

  @override
  State<StrapiLogin> createState() => _StrapiLoginState();
}

class _StrapiLoginState extends State<StrapiLogin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
