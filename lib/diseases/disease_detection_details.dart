import 'dart:io';
import 'package:agriteck_user/community/post-details.dart';
import 'package:agriteck_user/styles/app-colors.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';

class DiseaseDetectionDetails extends StatefulWidget {
  final File imagePath;

  DiseaseDetectionDetails({this.imagePath});
  @override
  _DiseaseDetectionDetailsState createState() =>
      _DiseaseDetectionDetailsState();
}

class _DiseaseDetectionDetailsState extends State<DiseaseDetectionDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryLight,
        title: Text(
          'Disease Detection Details',
          style: TextStyle(
              fontWeight: FontWeight.w600, fontSize: 18, color: Colors.white),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: DiseaseDetails(
            imagePath: widget.imagePath,
          ),
        ),
      ),
    );
  }
}

class DiseaseDetails extends StatelessWidget {
  final File imagePath;
  DiseaseDetails({this.imagePath});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      height: size.height,
      color: Colors.white,
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                  ),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(0, 8),
                        blurRadius: 15,
                        color: primaryLight.withOpacity(0.5)),
                  ]),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 200,
                    width: size.width,
                    child: Image.file(
                      imagePath,
                      height: 45,
                      width: size.width,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height: 70,
                        width: size.width * 0.65,
                        child: ListTile(
                          leading: ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Image.file(
                              imagePath,
                              height: 45,
                              width: 45,
                              fit: BoxFit.fill,
                            ),
                          ),
                          title: Text(
                            "comm.userName",
                            style: TextStyle(
                                fontSize: 16,
                                color: primary,
                                fontWeight: FontWeight.w400),
                            maxLines: 1,
                          ),
                          subtitle: Text(
                            "comm.postTime",
                            style: TextStyle(
                                fontSize: 14,
                                color: primaryLight,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      ),
                      Container(
                        height: 70,
                        width: size.width * 0.35,
                        child: ListTile(
                          title: Text(
                            "comm.userLocation",
                            style: TextStyle(
                                fontSize: 16,
                                color: primary,
                                fontWeight: FontWeight.w400),
                            maxLines: 1,
                          ),
                          subtitle: Text(
                            "comm.cropName",
                            style: TextStyle(
                                fontSize: 14,
                                color: primaryLight,
                                fontWeight: FontWeight.w300),
                          ),
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Container(
                      child: ListTile(
                        title: Text(
                          "comm.postTitle",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: primaryDark,
                              fontSize: 18,
                              height: 1.5),
                        ),
                        subtitle: Text(
                          "comm.postDescription",
                          style: TextStyle(
                              fontSize: 15,
                              color: primaryLight,
                              fontWeight: FontWeight.w400,
                              height: 1.5),
                          maxLines: 2,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      alignment: Alignment.centerRight,
                      child: Text(
                        'Translate',
                        style: TextStyle(
                            color: primary,
                            fontSize: 14,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                  Divider(
                    color: primaryLight,
                  ),
                  SingleChildScrollView(
                    child: Container(
                        height: size.height * 1.0,
                        child: ListView(
                          //physics: const NeverScrollableScrollPhysics(),
                          children: [
                            Coments(),
                            Coments(),
                          ],
                        )),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

// class ImageCarousel extends StatelessWidget {
//   final String imagePath;
//   ImageCarousel({this.imagePath});
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return Container(
//       height: size.height * 0.30,
//       child: Carousel(
//         boxFit: BoxFit.cover,
//         images: [
//           AssetImage(imagePath),
//           AssetImage(imagePath),
//           AssetImage(imagePath),
//         ],
//         animationCurve: Curves.fastOutSlowIn,
//         animationDuration: Duration(milliseconds: 2000),
//       ),
//     );
//   }
// }
