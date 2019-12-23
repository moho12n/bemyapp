import 'package:flutter/material.dart';
import '../models/buttons.dart';
import 'package:percent_indicator/percent_indicator.dart';

class Post extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 188,
        width: MediaQuery.of(context).size.width - 32,
        child: Stack(
          children: <Widget>[
            Container(
              height: 168,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: Colors.black12,
                      blurRadius: 4,
                      offset: Offset(0, 2))
                ],
              ),
            ),
            Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.all(8),
                          child: Column(
                            children: <Widget>[
                              Text("Title"),
                              Text("Date"),
                              Text("Budget")
                            ],
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 8, right: 8, bottom: 8, left: 130),
                          child: Container(
                            height: 128,
                            width: 128,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                              image: DecorationImage(
                                image: AssetImage("assets/images/ext.jpg"),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
                Row(
                  children: <Widget>[
                    SizedBox(
                      width: 24,
                    ),
                    buttonVisualer(),
                    SizedBox(
                      width: 20,
                    ),
                    buttonComment()
                  ],
                )
              ],
            ),
          ],
        ));
  }
}

class Poll extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 188,
        width: MediaQuery.of(context).size.width - 32,
        child: Stack(children: <Widget>[
          Container(
            height: 168,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Colors.black12, blurRadius: 4, offset: Offset(0, 2))
              ],
            ),
          ),
          Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        height: 16,
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 8),
                        child: Text("Title"),
                      ),
                      SizedBox(height: 8),
                      Container(
                        padding: EdgeInsets.only(left: 16),
                        height: 16,
                        width: MediaQuery.of(context).size.width - 96,
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: Text(
                                "Oui",
                              ),
                              flex: 1,
                            ),
                            Expanded(
                              child: SizedBox(),
                              flex: 4,
                            ),
                            Expanded(
                              child: Text("90%"),
                              flex: 1,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: new LinearPercentIndicator(
                          width: MediaQuery.of(context).size.width - 120,
                          animation: true,
                          lineHeight: 20.0,
                          animationDuration: 2000,
                          percent: 0.9,
                          linearStrokeCap: LinearStrokeCap.roundAll,
                          progressColor: Colors.greenAccent,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 16),
                        height: 16,
                        width: MediaQuery.of(context).size.width - 96,
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: Text(
                                "Non",
                              ),
                              flex: 1,
                            ),
                            Expanded(
                              child: SizedBox(),
                              flex: 4,
                            ),
                            Expanded(
                              child: Text("10%"),
                              flex: 1,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: new LinearPercentIndicator(
                          width: MediaQuery.of(context).size.width - 120,
                          animation: true,
                          lineHeight: 20.0,
                          animationDuration: 2000,
                          percent: 0.1,
                          linearStrokeCap: LinearStrokeCap.roundAll,
                          progressColor: Colors.redAccent,
                        ),
                      ),
                    ],
                  )
                ],
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    flex: 5,
                    child: SizedBox(),
                  ),
                  Expanded(
                    flex: 3,
                    child: buttonVoter(),
                  ),
                  Expanded(
                    flex: 1,
                    child: SizedBox(),
                  ),
                ],
              ),
            ],
          ),
        ]));
  }
}
