import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

import 'package:keyboard_visibility/keyboard_visibility.dart';
import 'dart:ui' show ImageFilter;
import 'dart:async';
import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:bemyapp/backend/listItem.dart';
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
        child: MyPopupSurface(
          child: child,
        ),
      ),
    );
  }
}

class MyPopupSurface extends StatelessWidget {
  const MyPopupSurface({
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
  _MyDialogState createState() => new _MyDialogState();
}

class _MyDialogState extends State<DialogDetail> {
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Expanded(
                          flex: 1,
                          child: Column(
                            children: <Widget>[
                              project.title != ""
                                  ? Text(project.title)
                                  : Text("Recyclage"),
                              project.startDate != ""
                                  ? Text(project.startDate +
                                      " : " +
                                      project.duration)
                                  : Text("Mar, 24 dec :${project.duration}"),
                              project.description != ""
                                  ? Text(project.description)
                                  : Text("Oran"),
                              project.budget != ""
                                  ? Text(project.budget)
                                  : Text("200,000 DA"),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Image.asset(
                            'assets/images/project1.jpg',
                            height: 200,
                            width: 180,
                          ),
                        )
                      ],
                    ),
                    TextField(
                        textCapitalization: TextCapitalization.sentences,
                        maxLines: 4,
                        decoration: InputDecoration(
                            labelText: "Partager votre avis",
                            hintText: "Description",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12)))),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 40,
                      child: FlatButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0)),
                        onPressed: () {
                          Navigator.pop(
                            context,
                          );
                        },
                        textColor: Colors.white,
                        color: Colors.blue,
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
