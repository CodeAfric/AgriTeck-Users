import 'package:agriteck_user/commonly-used-widget/image-carousel.dart';
import 'package:agriteck_user/styles/app-colors.dart';
import 'package:flutter/material.dart';

class DiseaseDetailsScreen extends StatelessWidget {
  final String diseaseName;
  final String diseaseId;

  // todo: Get the details detal at the init state
  DiseaseDetailsScreen({
    this.diseaseName,
    this.diseaseId,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      //resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            ImageCarousel([
              'assets/diseases/disease1.jpg',
              'assets/diseases/disease2.jpg',
              'assets/diseases/disease3.jpg',
            ]),
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
                child: DiseaseContant(
                  nameOfDisease: this.diseaseName,
                  plantTypes: 'Miaze, Banana, Barley, Bean, Bitter Gourd',
                  diseaseSymptoms:
                      'Curled and deformed leaves, Small Insects under leaves and shoots, Stunted growth',
                  causesOfDisease:
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DiseaseContant extends StatelessWidget {
  final String nameOfDisease;
  final String plantTypes;
  final String diseaseSymptoms;
  final String diseasePrevention;
  final String diseaseTreatment;
  final String causesOfDisease;
  final TextStyle titleFontStyle = TextStyle(color: primaryDark, fontSize: 22);
  final TextStyle textFontStyle = TextStyle(fontSize: 16, height: 1.5);

  DiseaseContant(
      {Key key,
      this.nameOfDisease,
      this.plantTypes,
      this.diseaseSymptoms,
      this.diseasePrevention,
      this.diseaseTreatment,
      this.causesOfDisease})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
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
                'Name of Disease',
                style: titleFontStyle,
              ),
              subtitle: Text(
                nameOfDisease,
                style: textFontStyle,
              ),
            ),
            ListTile(
              contentPadding: EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 4,
              ),
              title: Text(
                'Affected Plants',
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
                'Symptoms of Disease',
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
                'Causes of Disease',
                style: titleFontStyle,
              ),
              subtitle: Text(
                causesOfDisease,
                style: textFontStyle,
              ),
            ),
            ListTile(
              contentPadding: EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 4,
              ),
              title: Text(
                'Disease Prevention',
                style: titleFontStyle,
              ),
              subtitle: Text(
                diseasePrevention,
                style: textFontStyle,
              ),
            ),
            ListTile(
              contentPadding: EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 4,
              ),
              title: Text(
                'Disease Treatment',
                style: titleFontStyle,
              ),
              subtitle: Text(
                diseaseTreatment,
                style: textFontStyle,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 50.0,
        )
      ],
    );
  }
}
