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
    itemCount: 8,
    itemBuilder: (context, index) {
      return Post();
    },
  );
  }
}