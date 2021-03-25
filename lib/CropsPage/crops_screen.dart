import 'package:agriteck_user/styles/app-colors.dart';
import 'package:flutter/material.dart';
import 'package:agriteck_user/CropsPage/crops_Grid.dart';

class CropScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Material(
      child: PageView(
        scrollDirection: Axis.vertical,
        children: [
          Scaffold(
            appBar: buildAppBar(),
            backgroundColor: Colors.white,
            body: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SearchBar(),
                    crop_grid()
                  ],
                ),
              ),
            ),

          )
        ],
      ),
    );
  }
  AppBar buildAppBar(){
    return AppBar(
      elevation: 0,
      backgroundColor: primaryDark,
      title: Text('Crops'.toUpperCase(), style: TextStyle(
          fontSize: 18,color: Colors.white), textAlign: TextAlign.center,),
      centerTitle: true,

    );
  }
}