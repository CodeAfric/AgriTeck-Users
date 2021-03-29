import 'package:agriteck_user/Home_Page/HomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:agriteck_user/Home_Page/HomeScreen.dart';

void main() {
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
