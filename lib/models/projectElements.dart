import 'package:bemyapp/theme.dart';
import 'package:flutter/material.dart';
import '../models/buttons.dart';
import '../theme.dart';
import 'package:percent_indicator/percent_indicator.dart';

/// Post
class Post extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            SizedBox(
              width: 32,
            ),
            Image.asset(
              'assets/icons/Poll.png',
              width: 20,
            ),
            SizedBox(
              width: 6,
            ),
            Text(
              "Projet",
              style: new TextStyle(
                  color: ThemeColors.greyText,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w600,
                  fontSize: 14),
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Container(
            height: 188,
            width: MediaQuery.of(context).size.width - 48,
            child: Stack(
              children: <Widget>[
                Container(
                  height: 168,
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
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 12),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: <Widget>[
                                Text(
                                  "Titre du projet",
                                  style: new TextStyle(
                                      color: ThemeColors.greyText,
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.w500,
                                      fontSize: 18),
                                ),
                                SizedBox(
                                  height: 14,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 12),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        "24 Oct : 90 jours",
                                        style: new TextStyle(
                                            color: ThemeColors.blueDark,
                                            fontFamily: 'Montserrat',
                                            fontWeight: FontWeight.w600,
                                            fontSize: 16),
                                      ),
                                      Text(
                                        "Sidi Bachir",
                                        style: new TextStyle(
                                            color: ThemeColors.blueDark,
                                            fontFamily: 'Montserrat',
                                            fontWeight: FontWeight.w400,
                                            fontSize: 14),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 14,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 16),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      boxShadow: [
                                        BoxShadow(
                                          color: ThemeColors.shadow,
                                          offset: const Offset(0.0, 0.0),
                                        ),
                                        BoxShadow(
                                          color: Colors.white,
                                          offset: const Offset(0.0, 0.0),
                                          blurRadius: 8.0,
                                        ),
                                      ],
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.all(8),
                                      child: Center(
                                        child: Text(
                                          "2,000,000 DZD",
                                          style: new TextStyle(
                                              color: ThemeColors.greyText,
                                              fontFamily: 'Montserrat',
                                              fontWeight: FontWeight.w500,
                                              fontSize: 16),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 12, right: 12, bottom: 0, left: 8),
                          child: Container(
                            height: 136,
                            width: 136,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(8),
                                  topRight: Radius.circular(8)),
                              image: DecorationImage(
                                image: AssetImage("assets/images/Project1.jpg"),
                                fit: BoxFit.cover,
                              ),
                              boxShadow: [
                                BoxShadow(
                                    color: ThemeColors.shadow,
                                    blurRadius: 12,
                                    offset: Offset(0, 12))
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        buttonComment(),
                        SizedBox(
                          width: 12,
                        )
                      ],
                    )
                  ],
                ),
              ],
            ))
      ],
    );
  }
}

/// Poll
class Poll extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          SizedBox(
            width: 32,
          ),
          Image.asset(
            'assets/icons/Poll.png',
            width: 20,
          ),
          SizedBox(
            width: 6,
          ),
          Text(
            "Sondage",
            style: new TextStyle(
                color: ThemeColors.greyText,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w600,
                fontSize: 14),
          ),
        ],
      ),
      SizedBox(
        height: 20,
      ),
      Container(
          height: 220,
          width: MediaQuery.of(context).size.width - 48,
          child: Stack(children: <Widget>[
            Container(
              height: 200,
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
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 8, left: 12),
                  child: Text(
                    "Titre du projet",
                    style: new TextStyle(
                        color: ThemeColors.greyText,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w500,
                        fontSize: 18),
                  ),
                ),
                SizedBox(height: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              SizedBox(
                                width: 8,
                              ),
                              Text(
                                "Oui",
                                style: new TextStyle(
                                    color: ThemeColors.blueDark,
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15),
                              ),
                              Expanded(
                                child: SizedBox(),
                              ),
                              Text(
                                "72%",
                                style: new TextStyle(
                                    color: ThemeColors.blueDark,
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16),
                              ),
                              SizedBox(
                                width: 8,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          LinearPercentIndicator(
                            animation: true,
                            lineHeight: 6.0,
                            animationDuration: 1000,
                            percent: 0.72,
                            linearStrokeCap: LinearStrokeCap.roundAll,
                            progressColor: ThemeColors.blueMain,
                            backgroundColor: ThemeColors.greyBG,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 12),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              SizedBox(
                                width: 8,
                              ),
                              Text(
                                "Peut être",
                                style: new TextStyle(
                                    color: ThemeColors.blueDark,
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15),
                              ),
                              Expanded(
                                child: SizedBox(),
                              ),
                              Text(
                                "15%",
                                style: new TextStyle(
                                    color: ThemeColors.blueDark,
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16),
                              ),
                              SizedBox(
                                width: 8,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          LinearPercentIndicator(
                            animation: true,
                            lineHeight: 6.0,
                            animationDuration: 1000,
                            percent: 0.15,
                            linearStrokeCap: LinearStrokeCap.roundAll,
                            progressColor: ThemeColors.blueMain,
                            backgroundColor: ThemeColors.greyBG,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 12),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              SizedBox(
                                width: 8,
                              ),
                              Text(
                                "Non",
                                style: new TextStyle(
                                    color: ThemeColors.blueDark,
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15),
                              ),
                              Expanded(
                                child: SizedBox(),
                              ),
                              Text(
                                "13%",
                                style: new TextStyle(
                                    color: ThemeColors.blueDark,
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16),
                              ),
                              SizedBox(
                                width: 8,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          LinearPercentIndicator(
                            animation: true,
                            lineHeight: 6.0,
                            animationDuration: 1000,
                            percent: 0.13,
                            linearStrokeCap: LinearStrokeCap.roundAll,
                            progressColor: ThemeColors.blueMain,
                            backgroundColor: ThemeColors.greyBG,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Expanded(child: SizedBox()),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    buttonVoter(),
                    SizedBox(
                      width: 12,
                    )
                  ],
                ),
              ],
            ),
          ]))
    ]);
  }
}

//----------------------
String titre;
String budgetVert;
String budgetRouge;

class BudgetElement extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 32,
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 16,
          ),
          Text(
            titre,
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 16,
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: SizedBox(),
                flex: 2,
              ),
              Expanded(
                child: Text(
                  budgetVert,
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.green),
                ),
                flex: 2,
              ),
              Expanded(
                child: SizedBox(),
                flex: 1,
              ),
              Expanded(
                child: Text(
                  budgetRouge,
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.red),
                ),
                flex: 2,
              ),
              Expanded(
                child: SizedBox(),
                flex: 1,
              ),
            ],
          )
        ],
      ),
      height: 128,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        color: Colors.white70,
        boxShadow: [
          BoxShadow(
              color: Color(0xffc9d1e4), blurRadius: 8, offset: Offset(0, 8))
        ],
      ),
    );
  }
}
