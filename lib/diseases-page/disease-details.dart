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
                  plantTypes: 'Maize, Banana, Barley, Bean, Bitter Gourd',
                  diseaseSymptoms:
                      'Curled and deformed leaves, Small Insects under leaves and shoots, Stunted growth',
                  causesOfDisease:
                      'Aphids, these are soft bodied insects with long legs',
                  diseasePrevention:
                      'Maintain a high number of different varieties of plants around the field,'
                          'remove plant debries from previous cultures,'
                          'Use reflective mulches to repel invading population okf aphids,'
                          'check weeds in and around the field,'
                          'if possible, use nets to protect the plant',
                  diseaseTreatment:
                      'for the beginning, use insecticidal soap solution or solution based on plant oils,'
                          'a spray of water on the affected plant can also remove them ',
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
