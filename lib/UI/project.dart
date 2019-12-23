import 'package:flutter/material.dart';
import '../models/buttons.dart';
import '../models/projectElements.dart';

class MyListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  ListView.separated(
    separatorBuilder: (BuildContext context, int index) => Divider(),
    physics: BouncingScrollPhysics(),
    scrollDirection: Axis.vertical,
    shrinkWrap: true,
    padding: EdgeInsets.all(16),
    itemCount: 3,
    itemBuilder: (context, index) {
      return Column(children: <Widget>[Post(), SizedBox(height: 16,), Poll(),],);
    },
  );
  }
}