import 'package:bemyapp/UI/mainPage.dart';
import 'package:bemyapp/models/projectElements.dart';
import 'package:bemyapp/theme.dart';
import 'package:flutter/material.dart';
import 'models/buttons.dart';
import 'UI/project.dart';
import 'UI/login.dart';
import 'UI/budgetUI.dart';
import 'backend/getList.dart';
import 'theme.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Thémis'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: ThemeColors.Red, body: MyMainPage()
    );
  }
}


