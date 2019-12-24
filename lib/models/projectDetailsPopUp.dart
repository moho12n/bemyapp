import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

import 'package:keyboard_visibility/keyboard_visibility.dart';
import 'dart:ui' show ImageFilter;
import 'dart:async';
import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:bemyapp/backend/listItem.dart';
import 'package:bemyapp/theme.dart';
import 'buttons.dart';
//-------

ProjectItem project = ProjectItem(0, "", "", "", "", "", "", "", "", "");

class ProjectDetailsDialog extends StatelessWidget {
  const ProjectDetailsDialog({
    Key key,
    this.child,
  }) : super(key: key);
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: MediaQuery.of(context).size.width - 32,
        child: MyPopupSurface2(
          child: child,
        ),
      ),
    );
  }
}

class MyPopupSurface2 extends StatelessWidget {
  const MyPopupSurface2({
    Key key,
    this.isSurfacePainted = true,
    this.child,
  }) : super(key: key);

  final bool isSurfacePainted;

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(25),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 40, sigmaY: 20),
        child: Container(
          decoration: BoxDecoration(
            color: Color(0xfffcf4ed),
            backgroundBlendMode: BlendMode.overlay,
          ),
          child: Container(
            color: isSurfacePainted ? Colors.white : null,
            child: child,
          ),
        ),
      ),
    );
  }
}

class DialogDetail extends StatefulWidget {
  @override
  _MyDialogState2 createState() => new _MyDialogState2();
}

class _MyDialogState2 extends State<DialogDetail> {
  File _pickedImage;

  Alignment childAlignment = Alignment.center;
  @override
  void initState() {
    KeyboardVisibilityNotification().addNewListener(
      onChange: (bool visible) {
        // Add state updating code
        setState(() {
          childAlignment = visible ? Alignment.topCenter : Alignment.center;
        });
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(builder: (context, orientation) {
      return ProjectDetailsDialog(
          child: Material(
              type: MaterialType.transparency,
              child: AnimatedContainer(
                curve: Curves.ease,
                duration: Duration(
                  milliseconds: 400,
                ),
                width: double.infinity,
                height: 380,
                padding: const EdgeInsets.only(left: 12, right: 12),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 12),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: <Widget>[
                                project.title == ""
                                    ? Text(
                                        "Titre du projet",
                                        style: new TextStyle(
                                            color: ThemeColors.greyText,
                                            fontFamily: 'Montserrat',
                                            fontWeight: FontWeight.w500,
                                            fontSize: 18),
                                      )
                                    : Text(
                                        project.title,
                                        style: new TextStyle(
                                            color: ThemeColors.greyText,
                                            fontFamily: 'Montserrat',
                                            fontWeight: FontWeight.w500,
                                            fontSize: 18),
                                      ),
                                SizedBox(
                                  height: 14,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 12),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      project.startDate == "" || project.startDate == null 
                                          ? Text(
                                              "24 Oct : 90 jours",
                                              style: new TextStyle(
                                                  color: ThemeColors.blueDark,
                                                  fontFamily: 'Montserrat',
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 16),
                                            )
                                          : Text(
                                              project.startDate +
                                                  " : " +
                                                  project.duration,
                                              style: new TextStyle(
                                                  color: ThemeColors.blueDark,
                                                  fontFamily: 'Montserrat',
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 16),
                                            ),
                                      project.description == ""
                                          ? Text(
                                              "Sidi Bachir",
                                              style: new TextStyle(
                                                  color: ThemeColors.blueDark,
                                                  fontFamily: 'Montserrat',
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 14),
                                            )
                                          : Text(
                                              "Sidi Bachir",
                                              style: new TextStyle(
                                                  color: ThemeColors.blueDark,
                                                  fontFamily: 'Montserrat',
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 14),
                                            ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 14,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 16),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      boxShadow: [
                                        BoxShadow(
                                          color: ThemeColors.shadow,
                                          offset: const Offset(0.0, 0.0),
                                        ),
                                        BoxShadow(
                                          color: Colors.white,
                                          offset: const Offset(0.0, 0.0),
                                          blurRadius: 8.0,
                                        ),
                                      ],
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.all(8),
                                      child: Center(
                                        child: project.budget == "" || project.budget == null
                                            ? Text(
                                                "2,000,000 DZD",
                                                style: new TextStyle(
                                                    color: ThemeColors.greyText,
                                                    fontFamily: 'Montserrat',
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 16),
                                              )
                                            : Text(
                                                project.budget,
                                                style: new TextStyle(
                                                    color: ThemeColors.greyText,
                                                    fontFamily: 'Montserrat',
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 16),
                                              ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 12, right: 12, bottom: 0, left: 8),
                          child: Container(
                            height: 136,
                            width: 136,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(8),
                                  topRight: Radius.circular(8)),
                              image: DecorationImage(
                                image: AssetImage("assets/images/Project1.jpg"),
                                fit: BoxFit.cover,
                              ),
                              boxShadow: [
                                BoxShadow(
                                    color: ThemeColors.shadow,
                                    blurRadius: 12,
                                    offset: Offset(0, 12))
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 18,
                    ),
                    TextField(
                        textCapitalization: TextCapitalization.sentences,
                        maxLines: 5,
                        decoration: InputDecoration(
                            labelText: "Partager votre avis",
                            hintText: "Description",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12)))),
                    SizedBox(
                      height: 12,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 40,
                      child: FlatButton(
                        highlightColor: ThemeColors.blueDark,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0)),
                        onPressed: () {
                          Navigator.pop(
                            context,
                          );
                        },
                        textColor: Colors.white,
                        color: ThemeColors.blueMain,
                        child: Text(
                          "Commenter",
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Lora',
                              fontWeight: FontWeight.bold,
                              fontSize: 14),
                        ),
                      ),
                    ),
                  ],
                ),
              )));
    });
  }

  //----
  void _pickImage() async {
    final imageSource = await showDialog<ImageSource>(
        context: context,
        builder: (context) => AlertDialog(
              title: Text("Veuillez choisir la source de l'image"),
              actions: <Widget>[
                MaterialButton(
                  child: Text("Camera"),
                  onPressed: () => Navigator.pop(context, ImageSource.camera),
                ),
                MaterialButton(
                  child: Text("Gallerie"),
                  onPressed: () => Navigator.pop(context, ImageSource.gallery),
                )
              ],
            ));

    if (imageSource != null) {
      final file = await ImagePicker.pickImage(source: imageSource);
      if (file != null) {
        setState(() => _pickedImage = file);
      }
    }
  }
}
