import 'package:agriteck_user/commonly-used-widget/image-carousel.dart';
import 'package:agriteck_user/styles/app-colors.dart';
import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';

class ProductDetails extends StatelessWidget {
  // final Product diseaseData;
  // final String diseaseId;

  // todo: Get the details detal at the init state
  // DiseaseDetailsScreen({this.diseaseData});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      //resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // todo: image from network
            ImageCarousel([]),
            Container(
              height: size.height * 0.70,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15.0),
                  topRight: Radius.circular(15.0),
                ),
              ),
              child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: ProductContent(
                    name_of_disease: 'Aphids LKSDkj',
                    plant_types: 'Miaze, Banana, Barley, Bean, Bitter Gourd',
                    disease_symptoms:
                        'Curled and deformed leaves, Small Insects under leaves and shoots, Stunted growth',
                    causes_of_disease:
                        'Aphids, these are soft bodied insects with long legs',
                    disease_prevention:
                        'For example if one is coming out with a theory that '
                        'cannibals lives longer than normal human beings, the researcher will use '
                        'qualitative research to seek peoples belief on cannibalism, '
                        'analyze the data and formulate his theory. After that the researcher'
                        ' can use the quantitative research to deduce from people’s beliefs and arguments, '
                        'express their views, test and come out with figures to prove his theory that really people '
                        'who practice cannibalism live much longer than people who do not practice it.',
                    disease_treatment:
                        'For example if one is coming out with a theory that cannibals lives longer than normal'
                        ' human beings, the researcher will use qualitative research to seek '
                        'peoples belief on cannibalism, analyze',
                  )),
            ),
          ],
        ),
      ),
    );
  }
}

class ProductContent extends StatelessWidget {
  final String name_of_disease;
  final String plant_types;
  final String disease_symptoms;
  final String disease_prevention;
  final String disease_treatment;
  final String causes_of_disease;

  const ProductContent(
      {Key key,
      this.name_of_disease,
      this.plant_types,
      this.disease_symptoms,
      this.disease_prevention,
      this.disease_treatment,
      this.causes_of_disease})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ...ListTile.divideTiles(color: primary, tiles: [
              ListTile(
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                leading: Icon(
                  Icons.crop_square,
                  size: 15,
                ),
                title: Text(
                  'Name of Disease',
                  style: TextStyle(color: primaryDark),
                ),
                subtitle: Text(name_of_disease),
              ),
              ListTile(
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                leading: Icon(
                  Icons.crop_square,
                  size: 15,
                ),
                title: Text(
                  'Affected Plants',
                  style: TextStyle(color: primaryDark),
                ),
                subtitle: Text(plant_types),
              ),
              ListTile(
                leading: Icon(
                  Icons.crop_square,
                  size: 15,
                ),
                title: Text(
                  'Symptoms of Disease',
                  style: TextStyle(color: primaryDark),
                ),
                subtitle: Text(
                  disease_symptoms,
                  style: TextStyle(fontSize: 16),
                ),
              ),
              ListTile(
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                leading: Icon(
                  Icons.crop_square,
                  size: 15,
                ),
                title: Text(
                  'Causes of Disease',
                  style: TextStyle(color: primaryDark),
                ),
                subtitle: Text(causes_of_disease),
              ),
              ListTile(
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                leading: Icon(
                  Icons.crop_square,
                  size: 15,
                ),
                title: Text(
                  'Disease Prevention',
                  style: TextStyle(color: primaryDark),
                ),
                subtitle: Text(disease_prevention),
              ),
              ListTile(
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                leading: Icon(
                  Icons.crop_square,
                  size: 15,
                ),
                title: Text(
                  'Disease Treatment',
                  style: TextStyle(color: primaryDark),
                ),
                subtitle: Text(disease_treatment),
              ),
            ])
          ],
        ),
      ),
    );
  }
}
