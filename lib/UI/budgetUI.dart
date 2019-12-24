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

  var data =[0.0,0.2,0.0,0.3,0.8,1.0,0.3,0.5,0.3,0.9,0.5,0.6,0.4,0.5,-0.2,0.5];
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
                      SizedBox(width: 60,),
                      Expanded(
                        flex: 5,
                        child: Center(
                          child: Text('Blood Requests',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Montserrat')),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Icon(Icons.person),
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
                                      Text(
                                        '291',
                                        style: TextStyle(
                                            fontSize: 36,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'Montserrat')
                                      ),
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
                                        style: TextStyle(fontFamily: 'Montserrat'),
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
                                        style: TextStyle(fontFamily: 'Montserrat'),
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
