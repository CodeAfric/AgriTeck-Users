import 'package:agriteck_user/commonly-used-widget/image-carousel.dart';
import 'package:agriteck_user/vendors/vendor-details.dart';
import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';

class VendorDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        //resizeToAvoidBottomPadding: false,
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                ImageCarousel([
                  'assets/diseases/disease1.jpg',
                  'assets/diseases/disease2.jpg',
                  'assets/diseases/disease3.jpg',
                ]),
                VendorDetails(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
