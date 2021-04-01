import 'dart:io';
import 'package:agriteck_user/common%20UI/round_button.dart';
import 'package:agriteck_user/common%20UI/shape-painter.dart';
import 'package:agriteck_user/common-functions/helper-functions.dart';
import 'package:agriteck_user/home/home-screen.dart';
import 'package:agriteck_user/pojo-classes/farms.dart';
import 'package:agriteck_user/services/sharedPrefs.dart';
import 'package:agriteck_user/services/user-services.dart';
import 'package:agriteck_user/styles/app-colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:agriteck_user/common UI/textField.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';


class NewFarm extends StatefulWidget {

  @override
  _NewFarmState createState() => _NewFarmState();
}

class _NewFarmState extends State<NewFarm> {
  String farmId,description;
  List<Map<String,dynamic>> farmState;
  String  cropType;
  File image;
  double farmSize;
  String location;
  bool isLoading = false;
  final picker = ImagePicker();
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  FToast fToast;

  @override
  void initState() {
    super.initState();
    fToast = FToast();
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
          'New Farm',
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
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
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            color: Colors.white.withOpacity(.6),
            height: MediaQuery.of(context).size.height * 0.85,
            child: Center(
              child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Form(
                          key: _formKey,
                          child: Container(
                            child: Column(
                              children: [
                                _imageChooser(),
                                SizedBox(
                                  height: 30,
                                ),
                                InputTextField(
                                  withDecoration: true,
                                  maxLine: 5,
                                  onSave: (value) {
                                    setState(() {
                                      description = value;
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
                                  onSave: (value) {
                                    setState(() {
                                      cropType = value;
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
                                  onSave: (value) {
                                    setState(() {
                                      location = value;
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
                                  onSave: (value) {
                                    setState(() {
                                      try {
                                        farmSize = double.parse(value);
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
                                        textColor: Colors.white,
                                        text: 'SAVE DATA',
                                        color: primary,
                                        press: isLoading ? null : saveData)),
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
              ),
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
              ? ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Image.file(
              image,
              width: MediaQuery.of(context).size.width,
              height: 200,
              fit: BoxFit.fill,
            ),
          )
              : Container(
            decoration: BoxDecoration(
                color: Colors.white24,
                borderRadius: BorderRadius.circular(50)),
            width: MediaQuery.of(context).size.width,
            height: 200,
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
                    'Take photo',
                    style: TextStyle(color: primaryDark),
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
  saveData() async {
    if (mounted) {
      setState(() {
        isLoading = true;
      });
    }
    if (_formKey.currentState.validate()) {
        _formKey.currentState.save();
        try {
         String userId=await SharedPrefs.getUserID();
        // String user=await SharedPrefs.getUserID();
         var formatter = new DateFormat('MM/dd/yyyy');
          User user = FirebaseAuth.instance.currentUser;
          if (user != null) {
            String photoUrl;
            if (image != null) {
              photoUrl = await UserServices.uploadFarmPic(image, user.uid);
            }
            Farms farms=new Farms(
              farmSize: farmSize,
              farmerId: userId,
              farmId: userId+'-${formatter.format(DateTime.now())}',
              farmState: [],
              location: location,
              images: photoUrl,
              cropType: cropType,
              description: description,
            );
            await UserServices.saveFarm(user.uid+DateTime.now().toIso8601String(), farms);
            isLoading = false;
            await showToast(
                context, fToast, Icons.check, primaryDark,"Farm data Saved successfully");
            sendToPage(
                context,
                HomePage(
                  initPaage: BottomButtons.Farms,
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
    }
  }

