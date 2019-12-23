import 'package:bemyapp/theme.dart';
import 'package:flutter/material.dart';
import '../models/buttons.dart';
import '../theme.dart';

class Post extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Row(children: <Widget>[
        Image.asset('assets/icons/Poll.png', width: 14,), SizedBox(width: 6,),
        Text('Projet', style: TextStyle(color: ThemeColors.Grey, fontSize: 15),),
      ],),
      SizedBox(height: 16,),
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
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text('Title'),
                            Text('24 Oct : 90 jours'),
                            Text('Oran'),
                            Text('2,000,000 DZD'),
                          ],
                        ),
                      ),
                    ),
                    Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top: 12, right: 12, bottom: 8, left: 8),
                          child: Container(
                            height: 128,
                            width: 128,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                              image: DecorationImage(
                                image: AssetImage("assets/images/Project1.jpg"),
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
                    SizedBox(width: 12,),
                    Expanded(child: buttonVisualer()),
                    SizedBox(width: 8,),
                    buttonComment(),
                    SizedBox(width: 12,)
                  ],
                )
              ],
            ),
          ],
        ))
    ],);
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
