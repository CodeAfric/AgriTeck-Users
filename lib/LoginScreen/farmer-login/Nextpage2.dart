import 'dart:io';

import 'package:agriteck_user/styles/app-colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:image_picker/image_picker.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignUpPage2 extends StatefulWidget {
  @override
  _SignUpPage2State createState() => _SignUpPage2State();
}

class _SignUpPage2State extends State<SignUpPage2> {
  final _formKey = GlobalKey<FormState>();

  PickedFile imageFile;
  ImagePicker _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: primaryLight.withOpacity(0.2),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                width: width,
                height: height,
                //padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(color: Colors.white),
                child: Column(
                  children: <Widget>[
                    Container(
                      width: width,
                      height: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(100),
                        ),
                        gradient: LinearGradient(
                            colors: [primaryLight, primaryLight, primaryLight],
                            end: Alignment.bottomCenter,
                            begin: Alignment.topCenter),
                      ),
                      child: Center(
                        child: Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              Container(
                                color: Colors.transparent,
                                height: 50,
                                width: 50,
                                child: Image.asset(
                                  'assets/icons/seedling.png',
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                'Sign Up Here',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 24),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                        width: double.infinity,
                        padding: EdgeInsets.only(top: 15, left: 15),
                        child: Text(
                          'Choose the crops you cultivate',
                          style: TextStyle(color: primary),
                        )),
                    //SizedBox(height: 5.0,),
                    Wrap(
                      direction: Axis.horizontal,
                      children: [
                        CultivatedCrops(
                          cropType: 'Tomato',
                        ),
                        CultivatedCrops(
                          cropType: 'Okra',
                        ),
                        CultivatedCrops(
                          cropType: 'Pepper',
                        ),
                        CultivatedCrops(
                          cropType: 'Maize',
                        ),
                        CultivatedCrops(
                          cropType: 'Lettuce',
                        ),
                        CultivatedCrops(
                          cropType: 'Cuccumba',
                        ),
                      ],
                    ),
                    uploadProfile(),
                    SizedBox(height: 5.0),
                    Container(
                      height: 55,
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: primary,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey,
                                offset: Offset(0, 03),
                                blurRadius: 10)
                          ]),
                      child: Text(
                        "Next".toUpperCase(),
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                    //SizedBox(height: 10.0),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  uploadProfile() {
    return Center(
      child: Container(
          height: 110,
          width: 110,
          child: Column(
            children: [
              Container(
                height: 90,
                width: 100,
                child: OutlineButton(
                  borderSide: BorderSide(
                      color: primaryLight.withOpacity(0.8), width: 2.0),
                  onPressed: () {
                    showCameraDialog(context);
                  },
                  child: imageFile == null
                      ? new Icon(
                          Icons.camera_alt_outlined,
                          color: primaryLight,
                        )
                      : new Image.file(
                          imageFile as File,
                          fit: BoxFit.cover,
                        ),
                ),
              ),
              Text(
                'Upload photo',
                style: TextStyle(color: primaryDark),
              )
            ],
          )),
    );
  }

  Future<void> showCameraDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              'Select an Option',
              style: TextStyle(fontSize: 18, color: primaryLight),
            ),
            content: SingleChildScrollView(
              child: ListBody(
                children: [
                  GestureDetector(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: FaIcon(
                            FontAwesomeIcons.photoVideo,
                            color: primaryDark,
                          ),
                        ),
                        Text(
                          'Open Gallery',
                          style: TextStyle(fontSize: 16, color: primary),
                        ),
                      ],
                    ),
                    onTap: () {
                      openGallery(context);
                    },
                  ),
                  // Padding(padding: const EdgeInsets.all(8)),
                  GestureDetector(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: FaIcon(FontAwesomeIcons.camera,
                              color: primaryDark),
                        ),
                        Text(
                          'open Camera',
                          style: TextStyle(fontSize: 16, color: primary),
                        ),
                      ],
                    ),
                    onTap: () {
                      openCamera(context);
                    },
                  ),
                  Divider(
                    color: primaryLight,
                  ),
                  GestureDetector(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: FaIcon(
                            FontAwesomeIcons.windowClose,
                            color: primaryDark,
                          ),
                        ),
                        Text(
                          'Cancel',
                          style: TextStyle(fontSize: 16, color: primary),
                        ),
                      ],
                    ),
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

  openCamera(BuildContext context) async {
    PickedFile selectedImage =
        await _picker.getImage(source: ImageSource.camera);
    this.setState(() {
      imageFile = selectedImage;
    });
    Navigator.of(context).pop();
  }

  openGallery(BuildContext context) async {
    PickedFile selectedImage =
        await _picker.getImage(source: ImageSource.gallery);
    this.setState(() {
      imageFile = selectedImage;
    });
    Navigator.of(context).pop();
  }
}

class CultivatedCrops extends StatefulWidget {
  @override
  _CultivatedCropsState createState() => _CultivatedCropsState();
  final String cropType;
  const CultivatedCrops({Key key, this.cropType});
}

class _CultivatedCropsState extends State<CultivatedCrops> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Checkbox(
              activeColor: primary,
              tristate: false,
              value: isChecked,
              onChanged: (value) {
                setState(() {
                  isChecked = value;
                });
              }),
          Text(
            widget.cropType,
            style: TextStyle(
              color: primary,
            ),
          )
        ],
      ),
    );
  }
}
