import 'package:flutter/material.dart';
import './project.dart';
import 'package:bemyapp/models/popUp.dart' as prefix0;
import 'project.dart';
import 'package:bemyapp/backend/listItem.dart';

class MyMainPage extends StatefulWidget {
  MyMainPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyMainPageState createState() => _MyMainPageState();
}

class _MyMainPageState extends State<MyMainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffeef0f4),
        body: Stack(
          children: <Widget>[
            Padding(
                padding: const EdgeInsets.all(28.0),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        FloatingActionButton(
                          backgroundColor: Colors.white,
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (_) {
                                  return prefix0.Dialog();
                                });
                          },
                          child: Icon(
                            Icons.mode_edit,
                            color: Colors.blue,
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text("Exprimez vous!"),
                      ]),
                )),
            Column(
              children: <Widget>[
                SizedBox(
                  height: 28,
                ),
                Icon(Icons.location_searching),
              ],
            ),
            MyList(),
          ],
        ));
  }
}
