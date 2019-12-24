import 'package:bemyapp/backend/getList.dart' as prefix0;
import 'package:flutter/material.dart';
import '../models/buttons.dart';
import '../models/projectElements.dart';
import '../backend/getList.dart';
import 'dart:async';
import 'package:bemyapp/backend/listItem.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'dart:io';
import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:bemyapp/theme.dart';

import '../theme.dart';
import 'package:percent_indicator/percent_indicator.dart';

class MyList extends StatefulWidget {
  MyList({Key key, this.title}) : super(key: key);

  final String title;

  @override
  MyListView createState() => MyListView();
}

class MyListView extends State<MyList> {
  List data;
  creat() async {
    await makePostRequest("ga_namani@esi.dz", "azerty");
    await makeGetRequest();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    creat();
  }

  Future<List<ProjectItem>> fetchJobs() async {
    await prefix0.makePostRequest("ga_namani@esi.dz", "azerty");
    String token = await storage.read(key: 'jwt');
    String url = domainName;
    Response response = await get(url + '/api/feed', headers: {
      "Authorization": "Bearer " + token,
      "Content-type": "application/json"
    });

    if (response.statusCode == 200) {
      List jsonResponse = jsonDecode(response.body);
      print("hah:" + jsonResponse.toString());
      return jsonResponse
          .map((data) => new ProjectItem.fromJson(data))
          .toList();
    } else {
      throw Exception('Failed to load jobs from API');
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ProjectItem>>(
      future: fetchJobs(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<ProjectItem> data = snapshot.data;
          return jobsListView(data);
        } else if (snapshot.hasError) {
          return Center(child: Text("${snapshot.error}"));
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }

  ///AFFICHAGE DE LA LISTE DES PROJET / SONDAGES
  ListView jobsListView(data) {
    return ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: data[index].type == "survey"
                ? Column(children: <Widget>[
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
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20),
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
                                          linearStrokeCap:
                                              LinearStrokeCap.roundAll,
                                          progressColor: ThemeColors.blueMain,
                                          backgroundColor: ThemeColors.greyBG,
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 12),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20),
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
                                          linearStrokeCap:
                                              LinearStrokeCap.roundAll,
                                          progressColor: ThemeColors.blueMain,
                                          backgroundColor: ThemeColors.greyBG,
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 12),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20),
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
                                          linearStrokeCap:
                                              LinearStrokeCap.roundAll,
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
                  ])
                : Column(
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
                                          padding:
                                              const EdgeInsets.only(left: 12),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.stretch,
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
                                                padding: const EdgeInsets.only(
                                                    left: 12),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: <Widget>[
                                                    Text(
                                                      "24 Oct : 90 jours",
                                                      style: new TextStyle(
                                                          color: ThemeColors
                                                              .blueDark,
                                                          fontFamily:
                                                              'Montserrat',
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontSize: 16),
                                                    ),
                                                    Text(
                                                      "Sidi Bachir",
                                                      style: new TextStyle(
                                                          color: ThemeColors
                                                              .blueDark,
                                                          fontFamily:
                                                              'Montserrat',
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          fontSize: 14),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(
                                                height: 14,
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 16),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(30),
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color: ThemeColors.shadow,
                                                        offset: const Offset(
                                                            0.0, 0.0),
                                                      ),
                                                      BoxShadow(
                                                        color: Colors.white,
                                                        offset: const Offset(
                                                            0.0, 0.0),
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
                                                            color: ThemeColors
                                                                .greyText,
                                                            fontFamily:
                                                                'Montserrat',
                                                            fontWeight:
                                                                FontWeight.w500,
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
                                            top: 12,
                                            right: 12,
                                            bottom: 0,
                                            left: 8),
                                        child: Container(
                                          height: 136,
                                          width: 136,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(8),
                                                topRight: Radius.circular(8)),
                                            image: DecorationImage(
                                              image: AssetImage(
                                                  "assets/images/Project1.jpg"),
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
                  ),
          );
        });
  }
}
