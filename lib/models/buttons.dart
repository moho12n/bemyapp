import 'package:flutter/material.dart';

class buttonVisualer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 128,
      height: 44,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        gradient: LinearGradient(
          colors: [
            Color(0xFFf63a49),
            Color(0xFFf61546),
          ],
        ),
        boxShadow: [
          BoxShadow(color: Colors.white12, blurRadius: 6, offset: Offset(0, 4))
        ],
      ),
      child: FlatButton(
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          onPressed: () {},
          child: Text(
            "VISUALISER",
            style: new TextStyle(
                color: Colors.white, fontFamily: 'Oxygen', fontSize: 16),
          )),
    );
  }
}
//-------------------------------------------

class buttonComment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 128,
      height: 44,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        gradient: LinearGradient(
          colors: [
            Color(0xFFf63a49),
            Color(0xFFf61546),
          ],
        ),
        boxShadow: [
          BoxShadow(color: Colors.white12, blurRadius: 6, offset: Offset(0, 4))
        ],
      ),
      child: FlatButton(
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          onPressed: () {},
          child: Text(
            "COMMENT",
            style: new TextStyle(
                color: Colors.white, fontFamily: 'Oxygen', fontSize: 16),
          )),
    );
  }
}
