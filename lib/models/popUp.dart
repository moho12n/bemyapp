import 'package:flutter/material.dart';

import 'package:keyboard_visibility/keyboard_visibility.dart';
import 'dart:ui' show ImageFilter;
import 'dart:async';
import 'dart:io';
//import 'package:image_picker_modern/image_picker_modern.dart';
import 'package:image_picker/image_picker.dart';
import '../theme.dart';
import 'package:bemyapp/backend/getList.dart';
//-------

class MyDialog extends StatelessWidget {
  const MyDialog({
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

class Dialog extends StatefulWidget {
  @override
  _MyDialogState createState() => new _MyDialogState();
}

class _MyDialogState extends State<Dialog> {
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

  final myPropositionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(builder: (context, orientation) {
      return MyDialog(
          child: Material(
              type: MaterialType.transparency,
              child: AnimatedContainer(
                curve: Curves.ease,
                duration: Duration(
                  milliseconds: 400,
                ),
                width: double.infinity,
                height: 356,
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    SizedBox(
                      height: 8,
                    ),
                    TextField(
                        cursorColor: ThemeColors.blueMain,
                        textCapitalization: TextCapitalization.sentences,
                        maxLines: 1,
                        decoration: InputDecoration(
                            labelText: "Proposition",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(14)))),
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        SizedBox(
                          width: 10,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    TextField(
                        controller: myPropositionController,
                        textCapitalization: TextCapitalization.sentences,
                        maxLines: 4,
                        decoration: InputDecoration(
                            labelText: "Partager votre avis",
                            hintText: "Description",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12)))),
                    SizedBox(
                      height: 8,
                    ),
                    OutlineButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0)),
                        onPressed: _pickImage,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Icon(
                                  Icons.add_a_photo,
                                  color: ThemeColors.blueMain,
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  "Ajouter une photo",
                                  style: new TextStyle(
                                      color: ThemeColors.blueMain,
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.w600,
                                      fontSize: 13),
                                ),
                              ]),
                        )),
                    SizedBox(
                      height: 8,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 54,
                      child: FlatButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0)),
                        onPressed: () {
                          makePutRequest(myPropositionController.text);
                          Navigator.pop(
                            context,
                          );
                        },
                        textColor: Colors.white,
                        color: Colors.blue,
                        child: Text(
                          "Publier",
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
