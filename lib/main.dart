// Step 7 (Final): Change the app's theme

import 'package:flutter/material.dart';
import 'package:modules/pages/gateWay/findmDNSClientList.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: '云易连网关',
      theme: new ThemeData(
        primaryColor: Colors.purple,
      ),
      home: FindmDNSClientListPage(),
      darkTheme: new ThemeData(
        primaryColor: Colors.black,
      ),
    );
  }
}
