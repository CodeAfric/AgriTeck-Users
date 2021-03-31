import 'package:agriteck_user/disease-details/details_of_disease.dart';
import 'package:agriteck_user/diseases/disease_detection_details.dart';
import 'package:agriteck_user/styles/app-colors.dart';
import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';

class CropDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              ImageCarousel(),
              CropDetails(),
            ],
          ),
        ),
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

class CropDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.70,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15.0),
          topRight: Radius.circular(15.0),
        ),
      ),
      child: Expanded(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10.0),
                topRight: Radius.circular(10.0)),
            color: Colors.white,
          ),
          child: ListView(
            scrollDirection: Axis.vertical,
            children: [
              Container(
                child: Details(
                  nameOfCrop: 'Curly Yellows',
                  plantTypes: 'Miaze, Banana, Barley, Bean, Bitter Gourd',
                  diseaseSymptoms:
                      'Curled and deformed leaves, Small Insects under leaves and shoots, Stunted growth',
                  causesOfCrop:
                      'Aphids, these are soft bodied insects with long legs',
                  diseasePrevention:
                      'For example if one is coming out with a theory that '
                      'cannibals lives longer than normal human beings, the researcher will use '
                      'qualitative research to seek peoples belief on cannibalism, '
                      'analyze the data and formulate his theory. After that the researcher'
                      ' can use the quantitative research to deduce from people’s beliefs and arguments, '
                      'express their views, test and come out with figures to prove his theory that really people '
                      'who practice cannibalism live much longer than people who do not practice it.',
                  diseaseTreatment:
                      'For example if one is coming out with a theory that cannibals lives longer than normal'
                      ' human beings, the researcher will use qualitative research to seek '
                      'peoples belief on cannibalism, analyze',
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Details extends StatelessWidget {
  final String nameOfCrop;
  final String plantTypes;
  final String diseaseSymptoms;
  final String diseasePrevention;
  final String diseaseTreatment;
  final String causesOfCrop;

  Details(
      {Key key,
      this.nameOfCrop,
      this.plantTypes,
      this.diseaseSymptoms,
      this.diseasePrevention,
      this.diseaseTreatment,
      this.causesOfCrop})
      : super(key: key);

  TextStyle titleFontStyle = TextStyle(color: primaryDark, fontSize: 22);
  TextStyle textFontStyle = TextStyle(fontSize: 16, height: 1.5);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ...ListTile.divideTiles(
              color: primary,
              tiles: [
                ListTile(
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 4,
                  ),
                  title: Text(
                    'Name of Crop',
                    style: titleFontStyle,
                  ),
                  subtitle: Text(
                    nameOfCrop,
                    style: textFontStyle,
                  ),
                ),
                ListTile(
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 4,
                  ),
                  title: Text(
                    'Species',
                    style: titleFontStyle,
                  ),
                  subtitle: Wrap(
                    crossAxisAlignment: WrapCrossAlignment.start,
                    alignment: WrapAlignment.start,
                    children: List.generate(
                      5,
                      (index) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.grey,
                              radius: 5,
                            ),
                            SizedBox(
                              width: 4,
                            ),
                            Text(
                              'Disease',
                              style: textFontStyle,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                ListTile(
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 4,
                  ),
                  title: Text(
                    'Prefere Soil',
                    style: titleFontStyle,
                  ),
                  subtitle: Text(
                    diseaseSymptoms,
                    style: textFontStyle,
                  ),
                ),
                ListTile(
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 4,
                  ),
                  title: Text(
                    'Description',
                    style: titleFontStyle,
                  ),
                  subtitle: Text(
                    plantTypes,
                    style: textFontStyle,
                  ),
                ),
                ListTile(
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 4,
                  ),
                  title: Text(
                    'Pets And Diseases',
                    style: titleFontStyle,
                  ),
                  subtitle: Wrap(
                    crossAxisAlignment: WrapCrossAlignment.start,
                    alignment: WrapAlignment.start,
                    children: List.generate(
                      5,
                      (index) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.grey,
                              radius: 5,
                            ),
                            SizedBox(
                              width: 4,
                            ),
                            Text(
                              'Disease',
                              style: textFontStyle,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                ListTile(
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 4,
                  ),
                  title: Text(
                    'Tips',
                    style: titleFontStyle,
                  ),
                  subtitle: Column(
                    children: [
                      ...List.generate(
                        5,
                        (index) => Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10.0),
                                child: Icon(
                                  Icons.fiber_manual_record,
                                  size: 16,
                                  color: Colors.grey,
                                ),
                              ),
                              SizedBox(
                                width: 5.0,
                              ),
                              Expanded(
                                child: Text(
                                  diseaseSymptoms,
                                  style: textFontStyle,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 50.0,
            )
          ],
        ),
      ),
    );
  }
}
