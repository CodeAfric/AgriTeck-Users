import 'package:agriteck_user/home/home-screen.dart';
import 'package:agriteck_user/user-services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AgriTek',
      theme: ThemeData(),
      home: HomePage(
        initPaage: BottomButtons.Home,
      ),
    );
  }
}
