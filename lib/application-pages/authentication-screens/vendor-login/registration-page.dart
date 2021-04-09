import 'dart:io';

import 'package:agriteck_user/application-pages/authentication-screens/welcome-screen.dart';
import 'package:agriteck_user/common-functions/helper-functions.dart';
import 'package:agriteck_user/commonly-used-widget/custom-drop-down.dart';
import 'package:agriteck_user/commonly-used-widget/dailog-box.dart';
import 'package:agriteck_user/commonly-used-widget/radio-buttons.dart';
import 'package:agriteck_user/commonly-used-widget/round_button.dart';
import 'package:agriteck_user/commonly-used-widget/shape-painter.dart';
import 'package:agriteck_user/commonly-used-widget/textField.dart';
import 'package:agriteck_user/main-page.dart';
import 'package:agriteck_user/model-data/DataModels.dart';
import 'package:agriteck_user/pojo-classes/farmers-data.dart';
import 'package:agriteck_user/pojo-classes/vendors-data.dart';
import 'package:agriteck_user/services/user-services.dart';
import 'package:agriteck_user/styles/app-colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import '../../../constant.dart';

class VendorRegistrationForm extends StatefulWidget {
  @override
  _VendorRegistrationForm createState() => _VendorRegistrationForm();
}

class _VendorRegistrationForm extends State<VendorRegistrationForm> {
  String _name,
      _location,
      _investorId,
      _gender,
      _phoneNumber,
      _email,
      _investorInterest;
  DateTime backButtonPressTime;
  File _image;
  final picker = ImagePicker();
  bool genderVal = true;
  bool isLoading = false;
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  DateTime _dateTime;
  TextEditingController _pickDateController =
      TextEditingController(text: 'choose date of birth');
  FToast fToast;

  @override
  void initState() {
    super.initState();
    _pickDateController = TextEditingController();
    fToast = FToast();
    fToast.init(context);
  }

//when a user attempt going back this dialog is shown to warn the user
  Future<bool> _onBackPressed() async {
    return showDialog(
            context: context,
            builder: (BuildContext context) {
              return CustomDialogBox(
                title: 'Leave !',
                descriptions: 'Are you Sure you want to leave this page ?',
                btn1Text: 'No',
                btn2Text: 'Yes',
                img: 'assets/images/warning.png',
                btn1Press: () {
                  Navigator.pop(context);
                },
                btn2Press: () async {
                  await FirebaseAuth.instance.signOut();
                  return Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => WelcomeScreen()),
                      (route) => false);
                },
              );
            }) ??
        false;
  }

//=============================================================================
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          backgroundColor: primary,
          elevation: 0,
          title: Text(
            'Complete Registration',
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
              painter:
                  ShapePainter(), //this is the Image-like design on the backgroun
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
                                    height: 20,
                                  ),
                                  InputTextField(
                                    withDecoration: true,
                                    onSave: (value) {
                                      setState(() {
                                        _investorId = value;
                                      });
                                    },
                                    type: TextInputType.text,
                                    label: 'Vendor ID',
                                    validation: (value) {
                                      if (value.isEmpty) {
                                        return 'Please Enter a valid ID Number';
                                      } else
                                        return null;
                                    },
                                    prefixIcon: Icon(
                                      Icons.perm_identity_outlined,
                                      color: primary,
                                    ),
                                    isPassword: false,
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  InputTextField(
                                    withDecoration: true,
                                    onSave: (value) {
                                      setState(() {
                                        _name = value;
                                      });
                                    },
                                    type: TextInputType.text,
                                    label: 'Full Name',
                                    validation: (value) {
                                      if (value.isEmpty) {
                                        return 'Please Enter your Name';
                                      } else
                                        return null;
                                    },
                                    prefixIcon: Icon(
                                      Icons.drive_file_rename_outline,
                                      color: primary,
                                    ),
                                    isPassword: false,
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  InputTextField(
                                    withDecoration: true,
                                    onSave: (value) {
                                      setState(() {
                                        _email = value;
                                      });
                                    },
                                    type: TextInputType.text,
                                    label: 'Email',
                                    validation: (value) {
                                      if (value.isEmpty) {
                                        return 'Please Enter your Email';
                                      } else
                                        return null;
                                    },
                                    prefixIcon: Icon(
                                      Icons.email,
                                      color: primary,
                                    ),
                                    isPassword: false,
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  InputTextField(
                                    withDecoration: true,
                                    onSave: (value) {
                                      setState(() {
                                        _location = value;
                                      });
                                    },
                                    type: TextInputType.text,
                                    label: 'location',
                                    validation: (value) {
                                      if (value.isEmpty) {
                                        return 'Please Enter your location';
                                      } else
                                        return null;
                                    },
                                    prefixIcon: Icon(
                                      Icons.location_on_sharp,
                                      color: primary,
                                    ),
                                    isPassword: false,
                                  ),
                                  SizedBox(height: 20.0),
                                  CustomDropDown(
                                    value: _investorInterest,
                                    hint: 'Select interest',
                                    itemsList: investorInterest,
                                    onChanged: (value) {
                                      setState(() {
                                        _investorInterest = value;
                                      });
                                    },
                                  ),
                                  SizedBox(height: 20.0),
                                  SizedBox(
                                      width: 200,
                                      child: RoundedButton(
                                          isLoading: isLoading,
                                          text: 'SUBMIT',
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
      ),
    );
  }

  Widget getGender() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: primary.withOpacity(.98),
              blurRadius: 2,
              offset: Offset(0, 2),
            )
          ]),
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 2),
          child: Row(
            children: [
              Icon(
                FontAwesomeIcons.male,
                color: primary,
              ),
              SizedBox(
                width: 8,
              ),
              Text(
                'Gender ',
                style: TextStyle(
                    color: primaryLight,
                    fontSize: 16,
                    fontWeight: FontWeight.w700),
              ),
              Expanded(
                child: LabeledRadio(
                  label: 'Male',
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  value: false,
                  groupValue: genderVal,
                  onChanged: (bool newValue) {
                    setState(() {
                      genderVal = newValue;
                      _gender = 'Male';
                    });
                  },
                ),
              ),
              Expanded(
                child: LabeledRadio(
                  label: 'Female',
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  value: true,
                  groupValue: genderVal,
                  onChanged: (bool newValue) {
                    setState(() {
                      genderVal = newValue;
                      _gender = 'Female';
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _imageChooser() {
    return Center(
      child: GestureDetector(
        onTap: () {
          _showPicker(context);
        },
        child: CircleAvatar(
          radius: 70,
          backgroundColor: Colors.white,
          child: _image != null
              ? ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.file(
                    _image,
                    width: 150,
                    height: 150,
                    fit: BoxFit.fill,
                  ),
                )
              : Container(
                  decoration: BoxDecoration(
                      color: Colors.white24,
                      borderRadius: BorderRadius.circular(50)),
                  width: 150,
                  height: 150,
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

  Widget getDateOfBirth() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: primary.withOpacity(.98),
              blurRadius: 2,
              offset: Offset(0, 2),
            )
          ]),
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        //margin: EdgeInsets.only(left: 70, right: 20),
        child: TextFormField(
          onTap: () async {
            await showDatePicker(
              context: context,
              initialDate: DateTime(1900, 1, 1),
              firstDate: DateTime(1900, 1, 1),
              lastDate: DateTime.now(),
              initialDatePickerMode: DatePickerMode.year,
              builder: (BuildContext context, Widget child) {
                return Theme(
                  data: ThemeData(
                    primaryColor: primary,
                    accentColor: primaryLight,
                    buttonBarTheme: ButtonBarThemeData(
                      buttonTextTheme: ButtonTextTheme.accent,
                    ),
                  ),
                  child: child,
                );
              },
            ).then((value) {
              if (value != null) {
                _dateTime = value;
                var formatter = new DateFormat('MM/dd/yyyy');
                _pickDateController.text = formatter.format(value);
              }
            });
          },
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(16.0),
            prefixIcon: Container(
                padding: const EdgeInsets.only(top: 16.0, bottom: 16.0),
                margin: const EdgeInsets.only(right: 8.0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30.0),
                        bottomLeft: Radius.circular(30.0),
                        topRight: Radius.circular(30.0),
                        bottomRight: Radius.circular(10.0))),
                child: Icon(
                  Icons.date_range_outlined,
                  color: primary,
                )),
            hintStyle: TextStyle(color: primaryLight),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0),
                borderSide: BorderSide.none),
            filled: true,
            fillColor: Colors.white54,
          ),
          style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black87),
          cursorColor: primary,
          controller: _pickDateController,
          readOnly: true,
        ),
      ),
    );
  }

  getImageFromGallery() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      _image = File(pickedFile.path);
    } else {
      print('No image selected.');
    }
  }

  getImageFromCamera() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);
    if (pickedFile != null) {
      _image = File(pickedFile.path);
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
      if (_gender.isEmpty) {
        await showSnackBar("Please choose gender", _scaffoldKey.currentState);
      } else if (_dateTime == null) {
        await showSnackBar(
            "Please select you Date of Birth", _scaffoldKey.currentState);
      } else {
        _formKey.currentState.save();
        try {
          // _age = getYears(_dateTime);
          User user = FirebaseAuth.instance.currentUser;
          if (user != null) {
            String photoUrl;
            if (_image != null) {
              photoUrl = await UserServices.uploadPic(_image, user.uid);
            }
            Vendors vendors = new Vendors(
              vendorID: _investorId,
              name: _name,
              phone: _phoneNumber,
              email: _email,
              image: photoUrl,
              location: _location,
            );
            await UserServices.saveVendorInfo(user.uid, vendors);
            await FirebaseAuth.instance.currentUser
                .updateProfile(displayName: _name, photoURL: photoUrl);
            isLoading = false;
            await showToast(
                context, fToast, Icons.check, primaryDark, "Vendor data Saved");
            sendToPage(
                context,
                MainPage(
                  initPaage: BottomButtons.Home,
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
}
