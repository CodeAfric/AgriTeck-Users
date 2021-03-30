import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'common-functions/helper-functions.dart';

class UserServices{

 static Future<UserCredential> createUser(String email,String password,ScaffoldState state)async{
   UserCredential userCredential;
   try {
     userCredential=   await FirebaseAuth.instance.createUserWithEmailAndPassword(
         email: 'emmanuelfrimpong07@gmail.com',
         password: "024856954",
     );

   } on FirebaseAuthException catch (e) {
     if (e.code == 'weak-password') {
       await showSnackBar('The password provided is too weak.', state);
     } else if (e.code == 'email-already-in-use') {
       await showSnackBar('The account already exists.', state);
     }
   } catch (e) {
     await showSnackBar(e, state);
   }
   return userCredential;
  }

 static Future<User> login(String email,String password,ScaffoldState state)async{
   User user;
   try {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
         email: email,
         password: password
     ).then((value) => (){
        user = FirebaseAuth.instance.currentUser;
    });
   } on FirebaseAuthException catch (e) {
     if (e.code == 'user-not-found') {
       await showSnackBar('No user found for that email.', state);
     } else if (e.code == 'wrong-password') {
       await showSnackBar('Wrong password provided for that user.', state);
     }

   }catch(_){
     await showSnackBar('Bad Internet..Try again', state);
   }
   return user;
 }


//  static Future<void> saveUserInfo(String id,bool age,String email,String name,String url) {
//    List fav=[];
//    List myStory=[];
//    CollectionReference users = FirebaseFirestore.instance.collection("Users");
//    return users.doc(id).set({
//      'id':id,
//      'email': email, // Stokes and Sons
//      'isAdult': age,
//      'userName':name,
//      'photoUrl':url,
//      'role':'User',
//      'favourite':fav,
//      'myStories':myStory
//    });
//  }
//  static Future<DocumentSnapshot> getUser(String userID) {
//    return FirebaseFirestore.instance
//        .collection('Users')
//        .doc(userID)
//        .get();
//  }
//
//
// static Future<String> uploadPic(File image,String userID) async {
//    FirebaseStorage _storage = FirebaseStorage.instance;
//    StorageTaskSnapshot snapshot = await _storage
//        .ref()
//        .child("images/$userID")
//        .putFile(image)
//        .onComplete;
//    final String downloadUrl = await snapshot.ref.getDownloadURL();
//    return downloadUrl;
//  }

}