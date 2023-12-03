import 'package:flutter/material.dart';
import 'package:project_x/XOScrenn.dart';

void main() {
  runApp(XOApp());
}

class XOApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'X O',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: XOScreen(),
    );
  }
}