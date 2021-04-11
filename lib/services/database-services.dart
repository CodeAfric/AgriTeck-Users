import 'dart:async';
import 'dart:io';
import 'package:agriteck_user/pojo-classes/diseases-data.dart';
import 'package:agriteck_user/services/sharedPrefs.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class DatabaseServices {
  static Future<QuerySnapshot> getDataFromDatabase(String collection) async {
    await Firebase.initializeApp();
    var db = FirebaseFirestore.instance;
    CollectionReference reference = db.collection(collection);
    return reference.get();
  }

  static Future<QuerySnapshot> querySingleUserById(
      String userId, String collection) async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    return firebaseFirestore
        .collection(collection)
        .where('id', isEqualTo: 'userId')
        .get();
  }

  static Future<QuerySnapshot> querySingleFromDatabaseByField(
      String collection, String fieldName, dynamic value) async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    return firebaseFirestore
        .collection(collection)
        .where(fieldName, isEqualTo: value)
        .get();
  }

  static Future<String> uploadFarmPic(
      File image, String userID, String path) async {
    firebase_storage.Reference reference = firebase_storage
        .FirebaseStorage.instance
        .ref()
        .child(path)
        .child(userID)
        .child(image.path);
    firebase_storage.TaskSnapshot storageTaskSnapshot =
        await reference.putFile(image);
    final String downloadUrl = await storageTaskSnapshot.ref.getDownloadURL();

    return downloadUrl;
  }
}
