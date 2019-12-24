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
            return Text("${snapshot.error}");
          }
          return Center(child:CircularProgressIndicator());
        },
      );
  }

  ///AFFICHAGE DE LA LISTE DES PROJET / SONDAGES
  ListView jobsListView(data) {
    return ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          return data[index].type == "survey"
              ? Column(children: <Widget>[
                  Row(
                    children: <Widget>[
                      Image.asset(
                        'assets/icons/Poll.png',
                        width: 14,
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      Text(
                        'Sondage',
                        style: TextStyle(color: ThemeColors.greyText, fontSize: 15),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Container(
                      height: 188,
                      width: MediaQuery.of(context).size.width - 32,
                      child: Stack(children: <Widget>[
                        Container(
                          height: 168,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.0),
                            color: Colors.white70,
                            boxShadow: [
                              BoxShadow(
                                  color: Color(0xffc9d1e4),
                                  blurRadius: 8,
                                  offset: Offset(0, 8))
                            ],
                          ),
                        ),
                        Column(
                          children: <Widget>[
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                SizedBox(
                                  height: 8,
                                ),
                                Text(data[index].title),
                                SizedBox(height: 8),
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
                                          ),
                                          Expanded(
                                            child: SizedBox(),
                                          ),
                                          Text("72%"),
                                          SizedBox(
                                            width: 8,
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 8,
                                      ),
                                      LinearPercentIndicator(
                                        animation: true,
                                        lineHeight: 8.0,
                                        animationDuration: 1000,
                                        percent: 0.72,
                                        linearStrokeCap:
                                            LinearStrokeCap.roundAll,
                                        progressColor: ThemeColors.Green,
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
                                          ),
                                          Expanded(
                                            child: SizedBox(),
                                          ),
                                          Text("13%"),
                                          SizedBox(
                                            width: 8,
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 8,
                                      ),
                                      LinearPercentIndicator(
                                        animation: true,
                                        lineHeight: 8.0,
                                        animationDuration: 1000,
                                        percent: 0.13,
                                        linearStrokeCap:
                                            LinearStrokeCap.roundAll,
                                        progressColor: ThemeColors.Red,
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
                      children: <Widget>[
                        Image.asset(
                          'assets/icons/Poll.png',
                          width: 14,
                        ),
                        SizedBox(
                          width: 6,
                        ),
                        Text(
                          'Projet',
                          style:
                              TextStyle(color: ThemeColors.greyText, fontSize: 15),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Container(
                        height: 188,
                        width: MediaQuery.of(context).size.width - 16,
                        child: Stack(
                          children: <Widget>[
                            Container(
                              height: 168,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.0),
                                color: Colors.white70,
                                boxShadow: [
                                  BoxShadow(
                                      color: Color(0xffc9d1e4),
                                      blurRadius: 8,
                                      offset: Offset(0, 8))
                                ],
                              ),
                            ),
                            Column(
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: <Widget>[
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.all(12),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(data[index].title),
                                            Text(data[index].startDate +
                                                " : " +
                                                data[index].duration),
                                            Text(data[index].budget),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Column(
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 12,
                                              right: 12,
                                              bottom: 8,
                                              left: 8),
                                          child: Container(
                                            height: 128,
                                            width: 128,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              image: DecorationImage(
                                                image: AssetImage(
                                                    "assets/images/Project1.jpg"),
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
                                      width: 12,
                                    ),
                                    Expanded(child: buttonVisualer()),
                                    SizedBox(
                                      width: 8,
                                    ),
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
        });
  }
}
