import 'package:crud_flutter/QrScanner/homepage.dart';
import 'package:flutter/material.dart';
// import 'package:qrscanner/homepage.dart';

void main() => runApp(new MaterialApp(home: MyApp()));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return HomePages();
  }
}
