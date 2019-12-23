import 'package:flutter/material.dart';
import '../models/buttons.dart';


Widget myListView(BuildContext context) {
  return ListView.separated(
    separatorBuilder: (BuildContext context, int index) => Divider(),
    physics: BouncingScrollPhysics(),
    scrollDirection: Axis.vertical,
    shrinkWrap: true,
    padding: EdgeInsets.all(32),
    itemCount: 8,
    itemBuilder: (context, index) {
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
    },
  );
}
