import 'package:agriteck_user/home/home-screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'authentication-screens/welcome-screen.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    FirebaseAuth.instance.signOut();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AgriTek',
      theme: ThemeData(),
      home:FirebaseAuth.instance.currentUser!=null?HomePage(initPaage: BottomButtons.Home,): WelcomeScreen(
      ),
    );
  }
}
