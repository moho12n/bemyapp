import 'package:flutter/material.dart';
import '../models/buttons.dart';
import '../models/projectElements.dart';
import '../backend/getList.dart';
import 'dart:async';

class MyListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(""),
        ),
        body: ListView.separated(
            separatorBuilder: (BuildContext context, int index) => Divider(),
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            padding: EdgeInsets.all(16),
            itemCount: 1,
            itemBuilder: (context, index) {
              return Column(
                children: <Widget>[
                  Post(),
                  SizedBox(
                    height: 16,
                  ),
                  Poll(),
                ],
              );
            }));
  }
}
