import 'package:flutter/material.dart';
import '../models/buttons.dart';

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
    );
  }
}
