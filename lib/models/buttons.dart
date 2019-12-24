import 'package:bemyapp/models/projectDetailsPopUp.dart';
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
              SizedBox(
                width: 24,
              ),
              Text(
                "Visualiser",
                style: new TextStyle(
                    color: ThemeColors.greyText,
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
      width: 136,
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(8), bottomRight: Radius.circular(8)),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              color: ThemeColors.shadow, blurRadius: 12, offset: Offset(0, 12))
        ],
      ),
      child: FlatButton(
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          onPressed: () {
            showDialog(
                context: context,
                builder: (_) {
                  return DialogDetail();
                });
          },
          child: Text(
            "Commenter",
            style: new TextStyle(
                color: ThemeColors.blueMain,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w500,
                fontSize: 12),
          )),
    );
  }
}
//----------------------------

class buttonVoter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 136,
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              color: ThemeColors.shadow, blurRadius: 12, offset: Offset(0, 12)),
          BoxShadow(
              color: Color(0x304E6984), blurRadius: 8, offset: Offset(0, 0))
        ],
      ),
      child: FlatButton(
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          onPressed: () {},
          child: Text(
            "Voter",
            style: new TextStyle(
                color: ThemeColors.blueMain,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w500,
                fontSize: 12),
          )),
    );
  }
}
