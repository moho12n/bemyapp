import 'package:bemyapp/models/projectElements.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sparkline/flutter_sparkline.dart';
import 'package:bemyapp/theme.dart' as prefix0;

class BudgetUi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final titreTab = [
      'présidence de la République',
      'Services du Premier misitre',
      'Défence nationale',
      ' Intérieur et Collectivités locales',
      'Affaires étrangères',
      'Justice',
      'Finances',
      'Energie',
      'Industrie et Mines'
    ];
    final budgetVertTab = [
      '7.86',
      '4,45',
      '1.118,29',
      '425,57',
      '35,21',
      '74,54',
      '86,82',
      '50,8',
      '4,61'
    ];
    final budgetRougeTab = [
      '7.82',
      '4,5',
      '1.118,29',
      '394,26',
      '35,21',
      '72,67',
      '87,51',
      '44,15',
      '4,61'
    ];
    int index = 0;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: Text(
              "Répartition du Budget de l'état suivant la loi des finances courante (en milliard de dinnar)"),
        ),
        body: ListView.separated(
            separatorBuilder: (BuildContext context, int index) => Divider(),
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            padding: EdgeInsets.all(16),
            itemCount: titreTab.length,
            itemBuilder: (context, index) {
              titre = titreTab[index];
              budgetVert = budgetVertTab[index];
              budgetRouge = budgetRougeTab[index];
              return Container(
                width: MediaQuery.of(context).size.width - 32,
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 16,
                    ),
                    Text(
                      titre,
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
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
                        color: Color(0xffc9d1e4),
                        blurRadius: 8,
                        offset: Offset(0, 8))
                  ],
                ),
              );
            }));
  }
}
//-----------------

final firstColor = prefix0.ThemeColors.blueMain;
final secondColor = prefix0.ThemeColors.blueAccent;

class TopScreen extends StatelessWidget {
  var data = [
    0.0,
    0.2,
    0.0,
    0.3,
    0.8,
    1.0,
    0.3,
    0.5,
    0.3,
    0.9,
    0.5,
    0.6,
    0.4,
    0.5,
    -0.2,
    0.5
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 360,
      child: Stack(
        children: <Widget>[
          Container(
            height: 300,
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [firstColor, secondColor]),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    offset: Offset(0.0, 10),
                    blurRadius: 10.0,
                  ),
                ]),
          ),
          Positioned(
            top: 70,
            bottom: 0,
            right: 20,
            left: 20,
            child: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        flex: 5,
                        child: Container(
                          alignment: Alignment.center,
                          child: Text("Répartition du Budget (Mrd DZD)",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Montserrat')),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 250,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          offset: Offset(0.0, 0.5),
                          blurRadius: 10,
                        )
                      ]),
                  child: Container(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.all(32),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Text('2018',
                                          style: TextStyle(
                                              fontSize: 36,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'Montserrat')),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        '-0.1%',
                                        style: TextStyle(
                                            color: Colors.greenAccent,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'Montserrat'),
                                      )
                                    ],
                                  ),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        '4.584,46\nmilliards DA',
                                        style:
                                            TextStyle(fontFamily: 'Montserrat'),
                                      )
                                    ],
                                  )
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        '',
                                        style: TextStyle(
                                            color: Colors.red,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'Montserrat'),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        '2017',
                                        style: TextStyle(
                                            fontSize: 36,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'Montserrat'),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        '4.591,8\nmilliards DA',
                                        style:
                                            TextStyle(fontFamily: 'Montserrat'),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            // Image.asset('assets/chart.png', width: 200,),
                            Container(
                              height: 50,
                              child: Sparkline(
                                data: data,
                                lineColor: prefix0.ThemeColors.Red,
                                pointsMode: PointsMode.none,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class Requests extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.all(16.0),
      itemCount: _requestList.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          height: 150,
          padding: EdgeInsets.all(16.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: Colors.white),
          child: Row(
            children: <Widget>[
              Container(
                height: 100,
                width: 80,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: prefix0.ThemeColors.blueMain),
                child: Column(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(8),
                              topRight: Radius.circular(8)),
                          color: prefix0.ThemeColors.Red),
                      width: 80,
                      height: 20,
                      child: Center(
                        child: Text(
                          '',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 11,
                              fontFamily: 'Montserrat'),
                        ),
                      ),
                    ),
                    Container(
                      height: 80,
                      child: Center(
                          child: Icon(
                        Icons.work,
                        color: Colors.white,
                        size: 40,
                      )),
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                        height: 52,
                        padding: EdgeInsets.all(0),
                        child: Text(
                          _requestList[index].name,
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Montserrat'),
                        )),
                    Container(
                      child: Row(
                        children: <Widget>[
                          Text(_requestList[index].gagne,
                              style: TextStyle(
                                  fontSize: 16,
                                  color: prefix0.ThemeColors.Green,
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.w600)),
                          SizedBox(
                            width: MediaQuery.of(context).size.width - 280,
                          ),
                          Text(_requestList[index].perdu.toString(),
                              style: TextStyle(
                                  fontSize: 16,
                                  color: prefix0.ThemeColors.Red,
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.w600)),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) => const Divider(
        color: Colors.white10,
      ),
    );
  }
}

class Data {
  final String name, gagne, perdu;

  Data(
    this.name,
    this.gagne,
    this.perdu,
  );
}

final List<Data> _requestList = [
  Data("Ministère de l'éducation", "7.86  ", '5.82  '),
  Data('Energie', "74,54 ", "87.51 "),
  Data('La présidence', "7.86  ", '7.82  '),
  Data('Premier misitre', "4,45  ", "4.5   "),
  Data('Défence nationale', "1.118", "397.26"),
  Data('Affaires étrangères', "425,57", "35.21"),
  Data('Finances', "35,21 ", "72.67 "),
  Data('Industrie et Mines', "86,82 ", "44.15 "),
  Data('Justice', "4,61  ", "4,61  "),
];

///-----------------------
///
class MyBudgetPage extends StatefulWidget {
  @override
  _MyBudgetPageState createState() => _MyBudgetPageState();
}

class _MyBudgetPageState extends State<MyBudgetPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black12,
        child: Column(
          children: <Widget>[
            TopScreen(),
            Container(
              height: 50,
              padding: EdgeInsets.fromLTRB(32, 16, 32, 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    '',
                    style: TextStyle(fontFamily: 'Montserrat'),
                  ),
                  Text(
                    '',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontFamily: 'Montserrat'),
                  )
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height - 425,
              child: Requests(),
            ),
          ],
        ),
      ),
    );
  }
}
