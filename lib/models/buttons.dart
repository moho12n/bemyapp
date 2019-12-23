import 'package:flutter/material.dart';
import '../theme.dart';

class buttonVisualer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 128,
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              color: Color(0xffc9d1e4), blurRadius: 6, offset: Offset(0, 4))
        ],
      ),
      child: FlatButton(
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          onPressed: () {},
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Image.asset('assets/icons/Arrow.png', width: 20),
              SizedBox(width: 24,),
              Text(
                "Visualiser",
                style: new TextStyle(
                    color: ThemeColors.Grey,
                    fontFamily: 'Oxygen',
                    fontSize: 14),
              )
            ],
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
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: ThemeColors.mainBlue,
        boxShadow: [
          BoxShadow(
              color: Color(0xffc9d1e4), blurRadius: 6, offset: Offset(0, 4))
        ],
      ),
      child: FlatButton(
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          onPressed: () {},
          child: Text(
            "Commenter",
            style: new TextStyle(
                color: Colors.white, fontFamily: 'Oxygen', fontSize: 14),
          )),
    );
  }
}
//----------------------------

class buttonVoter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 128,
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: ThemeColors.mainBlue,
        boxShadow: [
          BoxShadow(
              color: Color(0xffc9d1e4), blurRadius: 6, offset: Offset(0, 4))
        ],
      ),
      child: FlatButton(
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          onPressed: () {},
          child: Text(
            "Voter",
            style: new TextStyle(
                color: Colors.white, fontFamily: 'Oxygen', fontSize: 14),
          )),
    );
  }
}