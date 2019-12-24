import 'package:bemyapp/UI/mainPage.dart';
import 'package:bemyapp/UI/project.dart';
import 'package:flutter/material.dart';
import '../backend/getList.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:async';
class LoginPage extends StatefulWidget {
  LoginPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyLoginPage createState() => _MyLoginPage();
}

class _MyLoginPage extends State<LoginPage> {
  final myEmailController = TextEditingController();
  final myPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context)  {
    return Scaffold(
      body: Center(
          child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: myEmailController,
              decoration: InputDecoration(
                disabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey,
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                hintText: "Enter Email",
              ),
            ),
            SizedBox(
              height: 12,
            ),
            TextField(
              controller: myPasswordController,
              decoration: InputDecoration(
                disabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey,
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                hintText: "Enter Password",
              ),
            ),
            RaisedButton(
              onPressed: () {
                Fluttertoast.showToast(
                    msg: "Mot de passe incorrect",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.CENTER,
                    timeInSecForIos: 2,
                    backgroundColor: Colors.redAccent,
                    textColor: Colors.white,
                    fontSize: 12.0);
                 makePostRequest(
                    myEmailController.text, myPasswordController.text);

                if (!erreur) {
                Navigator.push(context, MaterialPageRoute(builder: (context) => MyMainPage()));
                }
              },
              child: Text("Login"),
            )
          ],
        ),
      )),
    );
  }
}
