import 'package:bemyapp/models/projectElements.dart';
import 'package:flutter/material.dart';

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
