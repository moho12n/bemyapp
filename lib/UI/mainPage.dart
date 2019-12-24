import 'package:flutter/material.dart';
import './project.dart';
import 'package:bemyapp/models/popUp.dart' as prefix0;
import 'project.dart';
import 'package:bemyapp/backend/listItem.dart';
import '../theme.dart';

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
        backgroundColor: ThemeColors.greyBG,
        body: Stack(
          children: <Widget>[
            MyList(),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 150,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        ThemeColors.greyBG0,
                        ThemeColors.greyBG,
                        ThemeColors.greyBG
                      ]),
                  boxShadow: [
                    BoxShadow(
                        color: ThemeColors.shadow,
                        blurRadius: 12,
                        offset: Offset(0, 12))
                  ],
                ),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Container(
                        width: 72,
                        height: 72,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(36),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                color: ThemeColors.shadow,
                                blurRadius: 12,
                                offset: Offset(0, 12)),
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(36),
                          child: FlatButton(
                            highlightColor: ThemeColors.shadow,
                            materialTapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (_) {
                                    return prefix0.Dialog();
                                  });
                            },
                            child: Icon(
                              Icons.mode_edit,
                              color: ThemeColors.blueMain,
                              size: 32,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Exprimez vous!",
                        style: new TextStyle(
                            color: ThemeColors.blueMain,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w700,
                            fontSize: 18),
                      ),
                      SizedBox(
                        height: 32,
                      ),
                    ]),
              ),
            ),
            Column(
              children: <Widget>[
                SizedBox(
                  height: 28,
                ),
                Icon(Icons.location_searching),
              ],
            ),
          ],
        ));
  }
}
