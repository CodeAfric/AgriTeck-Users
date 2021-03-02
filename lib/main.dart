import 'package:agriteck_user/styles/app-colors.dart';
import 'package:flutter/material.dart';
import 'package:agriteck_user/Home_Page/HomeScreen.dart';
import 'package:agriteck_user/Diseases/Diseases_Screen.dart';

void main() {
  runApp(MyApp(
  ));

}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        //primarySwatch: Colors.white,
      ),
      // call classes here
      home: diseases_HomeScreen(),
    );
  }
}
