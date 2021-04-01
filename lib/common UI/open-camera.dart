import 'dart:io';
import 'package:agriteck_user/Toast/show_toast.dart';
import 'package:agriteck_user/diseases/disease_detection_details.dart';
import 'package:agriteck_user/styles/app-colors.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:agriteck_user/common-functions/tflite.dart';

ImagePicker _picker = ImagePicker();
Future<File> showCameraDialog(BuildContext context) {
  PickedFile imageFile;
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
                InkWell(
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
                  onTap: () async {
                    imageFile =
                        await _picker.getImage(source: ImageSource.gallery);
                    if (imageFile != null) {
                      //detect the crop disease
                      predictDesease(imageFile).then((predictions) async {
                        print('===========$predictions');
                        //print(predictions);
                        //show the details of the crop
                        Navigator.of(context).pop();
                        await Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return DiseaseDetection(
                            imagePath: File(imageFile.path),
                            predictions: predictions,
                          );
                        }));
                      });
                    } else {
                      showToast(content: 'No Image Selected');
                    }
                  },
                ),
                // Padding(padding: const EdgeInsets.all(8)),
                InkWell(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child:
                            FaIcon(FontAwesomeIcons.camera, color: primaryDark),
                      ),
                      Text(
                        'open Camera',
                        style: TextStyle(fontSize: 16, color: primary),
                      ),
                    ],
                  ),
                  onTap: () async {
                    imageFile =
                        await _picker.getImage(source: ImageSource.camera);
                    if (imageFile != null) {
                      //detect the crop disease
                      predictDesease(imageFile).then((predictions) async {
                        print(predictions);
                        //show the details of the crop
                        Navigator.of(context).pop();
                        await Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return DiseaseDetection(
                            imagePath: File(imageFile.path),
                            predictions: predictions,
                          );
                        }));
                      });
                    } else {
                      showToast(content: 'No Image Selected');
                    }
                  },
                ),
                Divider(
                  color: primaryLight,
                ),
                InkWell(
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

Future getImage({ImageSource source}) async {
  var imageFile = await _picker.getImage(source: source);
  if (imageFile != null) {
    return imageFile;
  } else {
    showToast(content: 'No Image Selected');
  }
}
