import 'dart:convert';
import 'dart:io';

import 'package:agriteck_user/common-functions/helper-functions.dart';
import 'package:agriteck_user/commonly-used-widget/bottom-icons.dart';
import 'package:agriteck_user/commonly-used-widget/round_button.dart';
import 'package:agriteck_user/commonly-used-widget/shape-painter.dart';
import 'package:agriteck_user/commonly-used-widget/textField.dart';
import 'package:agriteck_user/community-page/contribution_page.dart';
import 'package:agriteck_user/constant.dart';
import 'package:agriteck_user/main-page.dart';
import 'package:agriteck_user/services/database-services.dart';
import 'package:agriteck_user/services/sharedPrefs.dart';
import 'package:agriteck_user/styles/app-colors.dart';
import 'package:agriteck_user/styles/app-styles.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';

class ContributionUploadImage extends StatefulWidget {
  final File image;
  ContributionUploadImage({this.image});
  @override
  _ContributionUploadImageState createState() =>
      _ContributionUploadImageState();
}

class _ContributionUploadImageState extends State<ContributionUploadImage> {
  String imageLabel;
  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;
  FToast fToast;

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height - 61;

    var saveMyData = () async {
      if (_formKey.currentState.validate()) {
        _formKey.currentState.save();
        try {
          setState(() {
            isLoading = true;
          });
          // String userId = await SharedPrefs.getUserID();
          // String userData = await SharedPrefs.getUserData();
          // String user=await SharedPrefs.getUserID();
          User user = FirebaseAuth.instance.currentUser;
          if (user != null) {
            String photoUrl;
            if (widget.image != null) {
              photoUrl = await DatabaseServices.uploadFile(
                  widget.image, 'datasets/$imageLabel/');
            }
            Map<String, dynamic> data = {
              'photoUrl': photoUrl,
              'label': imageLabel,
            };
            await DatabaseServices.saveData('Dataset', data);
            isLoading = false;
            print('Uploaded Successfully');
            setState(() {
              isLoading = false;
            });
            Navigator.of(context).push(FeedBackOverlay());
          }
        } catch (error) {
          setState(() {
            isLoading = false;
            print('[$error]');
          });
        }
      }
    };

    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: primary,
        title: Text('Upload Picture'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(10),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 10),
                  Container(
                    height: screenHeight * 0.4,
                    width: screenWidth * 0.9,
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      child: Image.file(
                        widget.image,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Form(
                    key: _formKey,
                    child: InputTextField(
                        label: 'description',
                        onSave: (value) {
                          setState(() {
                            imageLabel = value;
                          });
                        },
                        validation: (value) {
                          if (value.isEmpty) {
                            return 'Please Enter Label';
                          } else
                            return null;
                        },
                        isPassword: false,
                        withDecoration: true),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  RoundedButton(
                    color: primary,
                    press: isLoading ? null : saveMyData,
                    text: 'Submit',
                    isLoading: isLoading,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class FeedBackOverlay extends ModalRoute<void> {
  File image;
  bool isLoading = false;
  final picker = ImagePicker();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Duration get transitionDuration => Duration(milliseconds: 500);

  @override
  bool get opaque => false;

  @override
  bool get barrierDismissible => false;

  @override
  Color get barrierColor => Colors.black.withOpacity(0.5);

  @override
  String get barrierLabel => null;

  @override
  bool get maintainState => true;

  @override
  Widget buildPage(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
  ) {
    // This makes sure that text and other content follows the material style
    return Material(
      type: MaterialType.transparency,
      // make sure that the overlay content is not cut off
      child: SafeArea(
        child: _buildOverlayContent(context),
      ),
    );
  }

  Widget _buildOverlayContent(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            '🥳',
            style: TextStyle(color: Colors.white, fontSize: 150.0),
            textAlign: TextAlign.center,
          ),
          Text(
            'Hurray!!!',
            style: TextStyle(color: Colors.white, fontSize: 30.0),
            textAlign: TextAlign.center,
          ),
          Text(
            '👍\nThank You \n For contributing to our community',
            style: TextStyle(color: Colors.white, fontSize: 30.0),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 20,
          ),
          RoundedButton(
            color: primary,
            press: () => noReturnSendToPage(
                context,
                MainPage(
                  initPage: BottomButtons.Diseases,
                )),
            text: 'Contribute Later',
          ),
          SizedBox(
            height: 10,
          ),
          RoundedButton(
            color: primaryDark,
            press: () => _showPicker(context),
            text: 'Continue Contributions',
          ),
        ],
      ),
    );
  }

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    // You can add your own animations for the overlay content
    return FadeTransition(
      opacity: animation,
      child: ScaleTransition(
        scale: animation,
        child: child,
      ),
    );
  }

  getImageFromGallery(BuildContext context) async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      image = File(pickedFile.path);
      sendToPage(context, ContributionUploadImage(image: image));
    } else {
      print('No image selected.');
    }
  }

  getImageFromCamera(BuildContext context) async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);
    if (pickedFile != null) {
      image = File(pickedFile.path);
      sendToPage(context, ContributionUploadImage(image: image));
    } else {
      print('No image selected.');
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
                          getImageFromGallery(context);
                          Navigator.of(context).pop();
                        });
                      }),
                  new ListTile(
                    leading: new Icon(Icons.photo_camera),
                    title: new Text('Camera'),
                    onTap: () {
                      setState(() {
                        getImageFromCamera(context);
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
}
