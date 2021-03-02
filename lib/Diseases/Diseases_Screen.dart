import 'package:agriteck_user/styles/app-colors.dart';
import 'package:flutter/material.dart';
import 'package:agriteck_user/Diseases/diseases.dart';

class Diseases extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Material(
      child: PageView(
        scrollDirection: Axis.vertical,
        children: [
          Scaffold(
            resizeToAvoidBottomPadding: false,
            backgroundColor: Colors.white,
            appBar: buildAppBar(),
            body: SafeArea(
              child: Column(
                children: [
                  Filter(),
                  diseases_list(),
                ],
              ),

            ),
          ),
        ],
      ),
    );
  }
  AppBar buildAppBar(){
    return AppBar(
      elevation: 0,
      backgroundColor: primaryDark,
      title: Text('Diseases', style: TextStyle(fontWeight: FontWeight.bold,
          fontSize: 22,color: Colors.white)),
    );
  }
}
