import 'package:agriteck_user/application-pages/welcome_page.dart';
import 'package:agriteck_user/services/sharedPrefs.dart';
import 'package:agriteck_user/services/user-services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'main-page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final _position = await SharedPrefs.getPositionInfo();
  if (_position == null) {
    await preferCurrentLoc();
  }
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // FirebaseAuth.instance.signOut();

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'AgriTek',
        theme: ThemeData(),
        home: FirebaseAuth.instance.currentUser != null
            ? MainPage(
                initPage: BottomButtons.Home,
              )
            : WelcomeScreen()
        // MainPage(
        //     initPage: BottomButtons.Home,
        //   ),
        );
  }
}
