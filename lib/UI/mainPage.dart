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
            Container(
              height: 260,
              decoration: BoxDecoration(
                  border: Border(
                      bottom:
                          BorderSide(width: 1, color: ThemeColors.greyText))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SafeArea(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 24, bottom: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                        Image.asset('assets/Logo.png', height: 46,)
                    ],
                  ),
                      )),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                    ),
                    child: Container(
                      height: 54,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.0),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: ThemeColors.shadow,
                              blurRadius: 12,
                              offset: Offset(0, 12))
                        ],
                      ),
                      child: Row(
                        children: <Widget>[
                          SizedBox(
                            width: 18,
                          ),
                          Text(
                            "Rechercher",
                            style: new TextStyle(
                                color: ThemeColors.greyText,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w500,
                                fontSize: 18),
                          ),
                          Expanded(
                            child: SizedBox(),
                          ),
                          Image.asset('assets/icons/Search.png', height: 22,),
                          SizedBox(width: 18,)
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: SizedBox(),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        width: (MediaQuery.of(context).size.width - 48) / 3,
                        height: 44,
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    width: 4, color: ThemeColors.blueMain))),
                        child: Center(
                          child: Text(
                            "Commune",
                            style: new TextStyle(
                                color: ThemeColors.blueMain,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w600,
                                fontSize: 16),
                          ),
                        ),
                      ),
                      Container(
                        width: (MediaQuery.of(context).size.width - 48) / 3,
                        height: 44,
                        child: Center(
                          child: Text(
                            "Wilaya",
                            style: new TextStyle(
                                color: ThemeColors.greyText,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w500,
                                fontSize: 16),
                          ),
                        ),
                      ),
                      Container(
                        width: (MediaQuery.of(context).size.width - 48) / 3,
                        height: 44,
                        child: Center(
                          child: Text(
                            "Ministère",
                            style: new TextStyle(
                                color: ThemeColors.greyText,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w500,
                                fontSize: 16),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 260),
              child: MyList(),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 168,
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
                            child: Image.asset('assets/icons/Pen.png', height: 32,),
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
