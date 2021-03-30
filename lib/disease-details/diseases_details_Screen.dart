import 'package:agriteck_user/styles/app-colors.dart';
import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';

class DiseaseDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Material(
      child: PageView(
        scrollDirection: Axis.vertical,
        children: [
          Scaffold(
            //resizeToAvoidBottomPadding: false,
            backgroundColor: Colors.white,
            body: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [ImageCarousel(), DiseaseDetails()],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ImageCarousel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.25,
      child: Carousel(
        boxFit: BoxFit.cover,
        images: [
          AssetImage('assets/diseases/disease1.jpg'),
          AssetImage('assets/diseases/disease2.jpg'),
          AssetImage('assets/diseases/disease3.jpg'),
        ],
        animationCurve: Curves.fastOutSlowIn,
        animationDuration: Duration(milliseconds: 2000),
      ),
    );
  }
}
