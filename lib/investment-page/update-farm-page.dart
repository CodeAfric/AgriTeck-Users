import 'dart:convert';
import 'dart:io';
import 'package:agriteck_user/common-functions/helper-functions.dart';
import 'package:agriteck_user/commonly-used-widget/round_button.dart';
import 'package:agriteck_user/commonly-used-widget/shape-painter.dart';
import 'package:agriteck_user/commonly-used-widget/textField.dart';
import 'package:agriteck_user/pojo-classes/farmers-data.dart';
import 'package:agriteck_user/pojo-classes/farms-data.dart';
import 'package:agriteck_user/services/database-services.dart';
import 'package:agriteck_user/services/sharedPrefs.dart';
import 'package:agriteck_user/services/user-services.dart';
import 'package:agriteck_user/styles/app-colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import '../main-page.dart';

class UpdateFarm extends StatefulWidget {
  final Farm farm;
  UpdateFarm({this.farm});
  @override
  _UpdateFarmState createState() => _UpdateFarmState();
}

class _UpdateFarmState extends State<UpdateFarm> {
  String farmId, description;
  List<Map<String, dynamic>> farmState;
  String cropType;
  File image;
  double farmSize;
  String location;
  bool isLoading = false;
  final picker = ImagePicker();
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  FToast fToast;
  TextEditingController descpController,
      cropsController,
      locController,
      sizeController;

  @override
  void initState() {
    super.initState();
    fToast = FToast();
    descpController = TextEditingController(text: widget.farm.description);
    cropsController = TextEditingController(text: widget.farm.cropType);
    locController = TextEditingController(text: widget.farm.location);
    sizeController =
        TextEditingController(text: widget.farm.farmSize.toString());
    fToast.init(context);
  }

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: primary,
        elevation: 0,
        title: Text(
          'Update Farm',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: BackButton(
          color: Colors.white,
        ),
      ),
      backgroundColor: Colors.white,
      body: Stack(children: <Widget>[
        Container(
          height: _height,
          width: _width,
          child: CustomPaint(
            painter: ShapePainter(),
          ),
        ),
        Container(
          color: Colors.white.withOpacity(.6),
          height: _height,
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Form(
                  key: _formKey,
                  child: Container(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        _imageChooser(),
                        SizedBox(
                          height: 20,
                        ),
                        InputTextField(
                          withDecoration: true,
                          maxLine: 5,
                          controller: descpController,
                          onSave: (value) {
                            setState(() {
                              widget.farm.description = value;
                            });
                          },
                          type: TextInputType.text,
                          label: 'Farm Descriptions',
                          alignText: true,
                          validation: (value) {
                            if (value.isEmpty) {
                              return 'Please Enter Farm Description';
                            } else
                              return null;
                          },
                          isPassword: false,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        InputTextField(
                          withDecoration: true,
                          controller: cropsController,
                          onSave: (value) {
                            setState(() {
                              widget.farm.cropType = value;
                            });
                          },
                          type: TextInputType.text,
                          label: 'Crop on Farm',
                          alignText: true,
                          validation: (value) {
                            if (value.isEmpty) {
                              return 'Please Enter Type of Crop on farm';
                            } else
                              return null;
                          },
                          isPassword: false,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        InputTextField(
                          withDecoration: true,
                          controller: locController,
                          onSave: (value) {
                            setState(() {
                              widget.farm.location = value;
                            });
                          },
                          type: TextInputType.text,
                          label: 'Enter Farm Location',
                          validation: (value) {
                            if (value.isEmpty) {
                              return 'Please Enter farm Location';
                            } else
                              return null;
                          },
                          isPassword: false,
                        ),
                        SizedBox(height: 20.0),
                        InputTextField(
                          withDecoration: true,
                          controller: sizeController,
                          onSave: (value) {
                            setState(() {
                              try {
                                widget.farm.farmSize = double.parse(value);
                              } catch (e) {}
                            });
                          },
                          type: TextInputType.number,
                          label: 'Total farm Size',
                          validation: (value) {
                            if (value.isEmpty) {
                              return 'Please Enter the farm size';
                            } else
                              return null;
                          },
                          isPassword: false,
                        ),
                        SizedBox(height: 30.0),
                        SizedBox(
                            width: 200,
                            child: RoundedButton(
                                isLoading: isLoading,
                                text: 'SAVE DATA',
                                color: primaryDark,
                                press: isLoading
                                    ? null
                                    : updateDataFunction(widget.farm))),
                        SizedBox(
                          height: 20,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }

  Widget _imageChooser() {
    return Center(
      child: GestureDetector(
        onTap: () {
          _showPicker(context);
        },
        child: Container(
          child: image != null
              ? Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: Image.file(
                        image,
                        width: 150,
                        height: 100,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 8.0, right: 8, bottom: 0),
                      child: Text(
                        'Change Image',
                        style: TextStyle(
                            color: primary,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                )
              : Container(
                  decoration: BoxDecoration(
                      color: Colors.white24,
                      borderRadius: BorderRadius.circular(50)),
                  width: MediaQuery.of(context).size.width,
                  height: 100,
                  child: Stack(children: <Widget>[
                    Align(
                      alignment: Alignment.center,
                      child: Icon(
                        Icons.camera_alt,
                        color: Colors.black38,
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 8.0, right: 8, bottom: 25),
                        child: Text(
                          'Upload Image',
                          style: TextStyle(
                              color: primary,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    )
                  ]),
                ),
        ),
      ),
    );
  }

  getImageFromGallery() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      image = File(pickedFile.path);
    } else {
      print('No image selected.');
    }
  }

  getImageFromCamera() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);
    if (pickedFile != null) {
      image = File(pickedFile.path);
    } else {
      await showSnackBar('No image selected.', _scaffoldKey.currentState);
    }
  }

  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: new Wrap(
                children: <Widget>[
                  new ListTile(
                      leading: new Icon(Icons.photo_library),
                      title: new Text('Photo Library'),
                      onTap: () {
                        setState(() {
                          getImageFromGallery();
                          Navigator.of(context).pop();
                        });
                      }),
                  new ListTile(
                    leading: new Icon(Icons.photo_camera),
                    title: new Text('Camera'),
                    onTap: () {
                      setState(() {
                        getImageFromCamera();
                        Navigator.of(context).pop();
                      });
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

  Function updateDataFunction(Farm farm) {
    return () async {
      print(farm);
      if (mounted) {
        setState(() {
          isLoading = true;
        });
      }
      if (_formKey.currentState.validate()) {
        _formKey.currentState.save();
        try {
          String userId = await SharedPrefs.getUserID();
          String userData = await SharedPrefs.getUserData();
          Map farmer = json.decode(userData);
          User user = FirebaseAuth.instance.currentUser;

          if (user != null) {
            // Udate Farmer Details
            farm.farmerDetails = {
              'name': farmer['name'],
              'telephone': farmer['telephone'],
              'location': farmer['location'],
              'specialized': farmer['specialized'],
            };
            // Update from database
            await DatabaseServices.setDocument(
                'Farms', farm.farmId, farm.toMap());
            isLoading = false;
            await showToast(context, fToast, Icons.check, primaryDark,
                "Farm data Updated successfully");
            sendToPage(
                context,
                MainPage(
                  initPage: BottomButtons.Farms,
                ));
          }
        } catch (error) {
          setState(() {
            isLoading = false;
            print('[$error]');
          });
        }
      }

      if (mounted) {
        setState(() {
          isLoading = false;
        });
      }
    };
  }
}
