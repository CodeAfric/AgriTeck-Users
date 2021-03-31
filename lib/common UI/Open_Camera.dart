import 'dart:io';

import 'package:agriteck_user/styles/app-colors.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


Future<File> showCameraDialog(BuildContext context){
  File imageFile;
  return showDialog( context: context, builder: (BuildContext context){
    return AlertDialog(
      title: Text('Select an Option', style: TextStyle(fontSize: 18, color: primaryLight),),
      content: SingleChildScrollView(
        child: ListBody(
          children: [
            GestureDetector(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: FaIcon(FontAwesomeIcons.photoVideo, color: primaryDark,),
                  ),
                  Text('Open Gallery', style: TextStyle(fontSize: 16, color: primary),),
                ],
              ),
              onTap: ()async{
                await ImagePicker.pickImage(source: ImageSource.gallery).then((value){
                  imageFile=value;
                  Navigator.of(context).pop();
                });
              },
            ),
            // Padding(padding: const EdgeInsets.all(8)),
            GestureDetector(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: FaIcon(FontAwesomeIcons.camera, color: primaryDark),
                  ),
                  Text('open Camera', style: TextStyle(fontSize: 16, color: primary),),
                ],
              ),
              onTap: ()async{
                await ImagePicker.pickImage(source: ImageSource.camera).then((value) {
                 imageFile=value;
                  Navigator.of(context).pop();
                });
              },
            ),
            Divider(color: primaryLight,),
            GestureDetector(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: FaIcon(FontAwesomeIcons.windowClose, color: primaryDark,),
                  ),
                  Text('Cancel', style: TextStyle(fontSize: 16, color: primary),),
                ],
              ),
              onTap: (){
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
    );
  });

}