import 'dart:io';
import 'package:agriteck_user/pojo-classes/farmers-data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class UserServices {
  static Future<void> saveUserInfo(String id, Farmers farmers)async{
    FirebaseFirestore.instance.collection('Users').doc(id).set(
      farmers.toMap());

  }

  static Future<DocumentSnapshot> getUser(String userID) {
    return FirebaseFirestore.instance.collection('Users').doc(userID).get();
  }

  static Future<String> uploadPic(File image, String userID) async {
    firebase_storage.Reference reference = firebase_storage
        .FirebaseStorage.instance
        .ref()
        .child('Images')
        .child('Users')
        .child(userID);
    firebase_storage.TaskSnapshot storageTaskSnapshot =
        await reference.putFile(image);
    final String downloadUrl = await storageTaskSnapshot.ref.getDownloadURL();

    return downloadUrl;
  }

  static Future<Map<String, dynamic>> querySingleUser(String userId) async {
    Map<String, dynamic> data;
    FirebaseFirestore.instance.collection('Users').doc(userId).get().then((value){
      data=value.data();
    });
    return data;
  }
}
