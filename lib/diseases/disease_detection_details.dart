import 'dart:io';
import 'package:agriteck_user/common%20UI/floating-menu.dart';
import 'package:agriteck_user/community/commuinity-page.dart';
import 'package:agriteck_user/community/post-details.dart';
import 'package:agriteck_user/diseases/diseases-screen.dart';
import 'package:agriteck_user/styles/app-colors.dart';
import 'package:flutter/material.dart';

class DiseaseDetection extends StatefulWidget {
  final File imagePath;
  final List predictions;

  DiseaseDetection({this.imagePath, this.predictions});
  @override
  _DiseaseDetectionState createState() => _DiseaseDetectionState();
}

class _DiseaseDetectionState extends State<DiseaseDetection> {
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
      floatingActionButton: FloatingMenu(
        // label: 'Post Product',
        animatedIcon: AnimatedIcons.menu_close,
        menuItems: [
          BubbleMenuItem.create(
            label: 'View More Diseases',
            icon: Icons.remove_red_eye,
            onPress: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => DiseasesScreen()));
            },
          ),
          BubbleMenuItem.create(
            label: 'Ask Community',
            icon: Icons.edit,
            onPress: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => CommunityScreen()));
            },
          ),
        ],
        // onPressHandler: () {},
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: DiseaseDetectionDetails(
            imagePath: widget.imagePath,
            predictions: widget.predictions,
          ),
        ),
      ),
    );
  }
}

class DiseaseDetectionDetails extends StatelessWidget {
  final File imagePath;
  final List predictions;
  DiseaseDetectionDetails({this.imagePath, this.predictions});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      height: size.height - 100,
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(10),
                bottomLeft: Radius.circular(10),
              ),
              color: Colors.white,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: size.height * 0.3,
                  width: size.width,
                  child: Image.file(
                    imagePath,
                    height: 50,
                    width: size.width,
                    fit: BoxFit.fill,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Container(
                    child: ListTile(
                      title: Text(
                        predictions[0]['label']
                            .toString()
                            .replaceAll(new RegExp(r'_'), ' ')
                            .replaceAll(new RegExp(r'  '), ' ')
                            .toUpperCase(),
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: primaryDark,
                            fontSize: 24,
                            height: 1.5),
                      ),
                      subtitle: Text(
                        '${double.parse((predictions[0]['confidence'] * 100).toStringAsFixed(2))} Percent Sure',
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.red,
                            fontWeight: FontWeight.w400,
                            height: 1.5),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    print('object');
                  },
                  child: Container(
                    alignment: Alignment.centerRight,
                    decoration: BoxDecoration(
                      color: primaryDark,
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    margin:
                        EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'See Details',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                        ),
                        Icon(
                          Icons.arrow_drop_down,
                          size: 36.0,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ),
                Divider(
                  color: primaryLight,
                ),
              ],
            ),
          )
        ],
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
