import 'package:bemyapp/models/projectElements.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sparkline/flutter_sparkline.dart';

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
          title: Text("Répartition du Budget"),
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

final firstColor = Color(0xffc10000);
final secondColor = Colors.red;

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
                      SizedBox(
                        width: 60,
                      ),
                      Expanded(
                        flex: 5,
                        child: Center(
                          child: Text('Répartition du budget',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Montserrat')),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: SizedBox(),
                      )
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
                                      Text('291',
                                          style: TextStyle(
                                              fontSize: 36,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'Montserrat')),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        '-12%',
                                        style: TextStyle(
                                            color: Colors.orange,
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
                                        'Available',
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
                                        '-49%',
                                        style: TextStyle(
                                            color: Colors.red,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'Montserrat'),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        '481',
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
                                        'Requests',
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
                                lineColor: Colors.red,
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
                    color: Color.fromRGBO(61, 62, 63, 1)),
                child: Column(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(8),
                              topRight: Radius.circular(8)),
                          color: Colors.red),
                      width: 80,
                      height: 20,
                      child: Center(
                        child: Text(
                          'URGENT',
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
                        child: Text(
                          _requestList[index].bloodtype,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Montserrat'),
                        ),
                      ),
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
                        padding: EdgeInsets.all(16),
                        child: Text(
                          _requestList[index].name,
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Montserrat'),
                        )),
                    Container(
                      padding: EdgeInsets.fromLTRB(16, 0, 0, 0),
                      child: Row(
                        children: <Widget>[
                          Text(_requestList[index].age.toString(),
                              style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.w600)),
                          SizedBox(
                            width: 5,
                          ),
                          Text('.'),
                          SizedBox(
                            width: 5,
                          ),
                          Text(_requestList[index].gender,
                              style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.w600)),
                          SizedBox(
                            width: 5,
                          ),
                          Text('.'),
                          SizedBox(
                            width: 5,
                          ),
                          Text(_requestList[index].distance.toString(),
                              style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.w600)),
                          Text('km',
                              style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.w600)),
                          SizedBox(
                            width: 5,
                          ),
                          Text('.'),
                          SizedBox(
                            width: 5,
                          ),
                          Text(_requestList[index].waitingHours.toString(),
                              style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.w600)),
                          Text('hrs',
                              style: TextStyle(
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
  final String name, bloodtype, gender;
  final int age, distance, waitingHours;

  Data(this.name, this.bloodtype, this.gender, this.age, this.distance,
      this.waitingHours);
}

final List<Data> _requestList = [
  Data('Mohammed', 'A+', 'Male', 22, 2, 3),
  Data('Sarah', 'B+', 'Female', 24, 3, 2),
  Data('Mohammed', 'A+', 'Male', 22, 2, 3),
  Data('Sarah', 'B+', 'Female', 24, 3, 2),
  Data('Mohammed', 'A+', 'Male', 22, 2, 3),
  Data('Sarah', 'B+', 'Female', 24, 3, 2),
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
                    'Recent Updates',
                    style: TextStyle(fontFamily: 'Montserrat'),
                  ),
                  Text(
                    'View All',
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
