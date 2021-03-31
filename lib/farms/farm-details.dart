import 'package:agriteck_user/common%20UI/floating-buttton.dart';
import 'package:agriteck_user/styles/app-colors.dart';
import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';

class FarmDetailsScreen extends StatelessWidget {
  final String farmImage;
  final String farmName;
  final String farmLocation;
  const FarmDetailsScreen(
      {Key key, this.farmImage, this.farmName, this.farmLocation})
      : super(key: key);
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
                FarmDetails(),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingButton(
            label: 'Request Investment',
            icon: Icons.person,
            onPressHandler: () {}));
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

class FarmDetails extends StatelessWidget {
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
                  nameOfCrop: 'Managing Director (Ecom)',
                  plantTypes: 'Kwadaso Municipal',
                  diseaseSymptoms: '0248569654',
                  causesOfCrop:
                      'Aphids, these are soft bodied insects with long legs',
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
                    'Attah Boakye',
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
                      'Age',
                      style: titleFontStyle,
                    ),
                    subtitle: Text('42 years')),
                ListTile(
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 4,
                  ),
                  title: Text(
                    'Contact',
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
                    'Location',
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
                    'Speciality',
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
                              'NO. Plot:',
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
                    '',
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
