import 'package:bemyapp/UI/budgetUI.dart';
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
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
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
                    child: Stack(
                      children: <Widget>[
                        Align(
                          alignment: Alignment.centerLeft,
                          child: FlatButton(
                            onPressed: () => _scaffoldKey.currentState.openDrawer(),
                            child: Icon(Icons.dehaze),
                          ),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Image.asset(
                            'assets/Logo.png',
                            height: 46,
                          ),
                        )
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
                          Image.asset(
                            'assets/icons/Search.png',
                            height: 22,
                          ),
                          SizedBox(
                            width: 18,
                          )
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
                            child: Image.asset(
                              'assets/icons/Pen.png',
                              height: 32,
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
          ],
        ),
        drawer: new Drawer(
            elevation: 0,
            child: Container(
              color: Color.fromARGB(255, 247, 247, 247),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(children: <Widget>[
                  SizedBox(
                    height: 32,
                  ),
                  Center(
                      heightFactor: 1.49,
                      child: Column(
                        children: <Widget>[
                          Image.asset(
                            'assets/images/avtr.png',
                            height: 88,
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          Text("Douzane",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15)),
                          SizedBox(
                            height: 2,
                          ),
                          Text("gm_douzane@esi.dz",
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.body2),
                        ],
                      )),
                  Row(
                    children: <Widget>[
                      Expanded(
                          child: RaisedButton(
                        color: Colors.white,
                        splashColor: ThemeColors.blueMain,
                        highlightColor: Colors.transparent,
                        highlightElevation: 1,
                        child: Container(
                          margin: EdgeInsets.only(top: 12, bottom: 16),
                          child: Column(
                            children: <Widget>[
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)),
                                    color: Colors.white,
                                    boxShadow: [
                                      new BoxShadow(
                                          color: ThemeColors.blueMain,
                                          blurRadius: 5)
                                    ]),
                                child: Material(
                                  color: Colors.white,
                                  elevation: 3,
                                  shadowColor: ThemeColors.blueMain,
                                  borderRadius: BorderRadius.circular(100),
                                  child: Padding(
                                      padding: EdgeInsets.all(7),
                                      child: Icon(
                                        Icons.edit,
                                        color: ThemeColors.blueAccent,
                                        size: 16,
                                      )),
                                ),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Text(
                                'Modifier',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 12,
                                    color: ThemeColors.blueAccent,
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        onPressed: () {
                          Navigator.of(context)
                              .pushNamed("/MenuMesLignesDisponibles");
                        },
                      )),
                      SizedBox(
                        width: 8,
                      ),
                      Expanded(
                          child: RaisedButton(
                        color: Colors.white,
                        splashColor: ThemeColors.blueAccent,
                        highlightColor: Colors.transparent,
                        highlightElevation: 1,
                        child: Container(
                          margin: EdgeInsets.only(top: 12, bottom: 16),
                          child: Column(
                            children: <Widget>[
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)),
                                    color: Colors.white,
                                    boxShadow: [
                                      new BoxShadow(
                                          color: ThemeColors.blueDark,
                                          blurRadius: 5)
                                    ]),
                                child: Material(
                                  color: Colors.white,
                                  elevation: 3,
                                  shadowColor: ThemeColors.blueAccent,
                                  borderRadius: BorderRadius.circular(100),
                                  child: Padding(
                                      padding: EdgeInsets.all(7),
                                      child: Icon(
                                        Icons.calendar_today,
                                        color: ThemeColors.blueDark,
                                        size: 16,
                                      )),
                                ),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Text(
                                'A propos',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 12,
                                    color: ThemeColors.blueAccent,
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        onPressed: () {},
                      )),
                    ],
                  ),
                  //-----------------------------
                  SizedBox(
                    height: 32,
                  ),
                  OutlineButton(
                      onPressed: () => Navigator.pop(context),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                Icons.people,
                                color: ThemeColors.blueMain,
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Text(
                                "Publication",
                                style: new TextStyle(
                                    color: ThemeColors.blueMain,
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 13),
                              ),
                            ]),
                      )),
                  //-----------------------------
                  SizedBox(
                    height: 22,
                  ),
                  OutlineButton(
                      onPressed: () => Navigator.pop(context),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                Icons.poll,
                                color: ThemeColors.blueMain,
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Text(
                                "Projet et sondages",
                                style: new TextStyle(
                                    color: ThemeColors.blueMain,
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 13),
                              ),
                            ]),
                      )),
                  //-----------------------------
                  SizedBox(
                    height: 22,
                  ),
                  OutlineButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MyBudgetPage()),
                        );
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                Icons.monetization_on,
                                color: ThemeColors.blueMain,
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Text(
                                "Budget de l'état",
                                style: new TextStyle(
                                    color: ThemeColors.blueMain,
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 13),
                              ),
                            ]),
                      )),
                  //-----------------------------
                  SizedBox(
                    height: 80,
                  ),
                  FlatButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0)),
                    onPressed: () async {
                      Navigator.pop(
                        context,
                      );
                    },
                    textColor: Colors.white,
                    color: Colors.transparent,
                    child: Text(
                      "Deconnexion",
                      style: TextStyle(
                          color: ThemeColors.greyText,
                          fontFamily: 'Lora',
                          fontWeight: FontWeight.bold,
                          fontSize: 14),
                    ),
                  ),
                ]),
              ),
            )));
  }
}
