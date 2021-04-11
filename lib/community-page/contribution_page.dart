import 'dart:convert';
import 'dart:io';

import 'package:agriteck_user/common-functions/helper-functions.dart';
import 'package:agriteck_user/commonly-used-widget/round_button.dart';
import 'package:agriteck_user/commonly-used-widget/shape-painter.dart';
import 'package:agriteck_user/commonly-used-widget/textField.dart';
import 'package:agriteck_user/community-page/contribution_upload_image.dart';
import 'package:agriteck_user/constant.dart';
import 'package:agriteck_user/services/database-services.dart';
import 'package:agriteck_user/styles/app-colors.dart';
import 'package:agriteck_user/styles/app-styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';

class ContributionScreen extends StatefulWidget {
  @override
  _ContributionScreenState createState() => _ContributionScreenState();
}

class _ContributionScreenState extends State<ContributionScreen> {
  File image;
  bool isLoading = false;
  final picker = ImagePicker();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height - 61;

    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: primary,
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              width: screenWidth,
              height: screenHeight,
              color: Colors.white,
              child: CustomScrollView(
                physics: ClampingScrollPhysics(),
                slivers: <Widget>[
                  _tipOfTheDay(screenHeight),
                  _cureYouPlant(screenHeight, screenWidth),
                ],
              ),
            ),
          ),
        ));
  }

  SliverToBoxAdapter _tipOfTheDay(double screenHeight) {
    return SliverToBoxAdapter(
      child: Container(
        padding: const EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: primary,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(40.0),
            bottomRight: Radius.circular(40.0),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                Icon(
                  FontAwesomeIcons.lightbulb,
                  color: Colors.yellow,
                ),
                Text(
                  'Welcome',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Spacer(),
                Icon(
                  Icons.accessibility,
                  size: 20,
                  color: Colors.black45,
                ),
                Text(
                  'Contributor',
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: Colors.black45),
                )
              ],
            ),
            SizedBox(height: screenHeight * 0.03),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'How you can Help',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: screenHeight * 0.01),
                Text(
                  'Help the community by uploading pictures of labeled crops (both healthy and affected). The picture will be used to train our AI models to enhance performance and accuracy of desease detection feature.\n\nThe community thanks👍 you already.',
                  overflow: TextOverflow.clip,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                  ),
                ),
                SizedBox(height: screenHeight * 0.01),
                Text(
                  '🥳 Happy Contributions.',
                  overflow: TextOverflow.clip,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  SliverToBoxAdapter _cureYouPlant(double screenHeight, double screenWidth) {
    return SliverToBoxAdapter(
        child: Container(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Upload Pictures',
            style: const TextStyle(
              fontSize: 22.0,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: <Widget>[
                  CircleAvatar(
                    radius: screenWidth * 0.1,
                    backgroundImage: AssetImage(
                      'assets/plants/capture.jpg',
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.015),
                  Text(
                    'Focus and\nCapture',
                    style: const TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
              Column(
                children: <Widget>[
                  CircleAvatar(
                    radius: screenWidth * 0.1,
                    backgroundImage: AssetImage(
                      'assets/images/label.jpg',
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.015),
                  Text(
                    'Label \nImage',
                    style: const TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
              Column(
                children: <Widget>[
                  CircleAvatar(
                    radius: screenWidth * 0.1,
                    backgroundImage: AssetImage(
                      'assets/images/upload.jpg',
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.015),
                  Text(
                    'Upload \nimage',
                    style: const TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                  )
                ],
              )
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FlatButton.icon(
                padding: const EdgeInsets.symmetric(
                  vertical: 10.0,
                  horizontal: 60.0,
                ),
                onPressed: () {
                  _showPicker(context);
                },
                color: primaryDark,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                icon: const Icon(
                  Icons.photo_camera,
                  color: Colors.white,
                ),
                label: Text(
                  'Capture Plant',
                  style: Styles.buttonTextStyle,
                ),
                textColor: Colors.white,
              ),
            ],
          )
        ],
      ),
    ));
  }

  getImageFromGallery() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      image = File(pickedFile.path);
      sendToPage(context, ContributionUploadImage(image: image));
    } else {
      print('No image selected.');
    }
  }

  getImageFromCamera() async {
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
}
