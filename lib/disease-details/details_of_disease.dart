import 'package:agriteck_user/disease-details/diseases_details_Screen.dart';
import 'package:agriteck_user/styles/app-colors.dart';
import 'package:flutter/material.dart';

class DiseaseDetails extends StatelessWidget {
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
                  nameOfDisease: 'Curly Yellows',
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
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Details extends StatelessWidget {
  final String nameOfDisease;
  final String plantTypes;
  final String diseaseSymptoms;
  final String diseasePrevention;
  final String diseaseTreatment;
  final String causesOfDisease;

  Details(
      {Key key,
      this.nameOfDisease,
      this.plantTypes,
      this.diseaseSymptoms,
      this.diseasePrevention,
      this.diseaseTreatment,
      this.causesOfDisease})
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
        ),
      ),
    );
  }
}
