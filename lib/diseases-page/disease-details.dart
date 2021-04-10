import 'package:agriteck_user/commonly-used-widget/image-carousel.dart';
import 'package:agriteck_user/pojo-classes/diseases-data.dart';
import 'package:agriteck_user/styles/app-colors.dart';
import 'package:flutter/material.dart';

class DiseaseDetailsScreen extends StatelessWidget {
  final Disease diseaseData;
  // final String diseaseId;

  // todo: Get the details detal at the init state
  DiseaseDetailsScreen({this.diseaseData});

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
            ImageCarousel([...diseaseData.images]),
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
                  nameOfDisease: diseaseData.name,
                  plantTypes: diseaseData.affectedPlants.join(', '),
                  diseaseSymptoms: diseaseData.signs,
                  causesOfDisease: diseaseData.causes,
                  diseasePrevention: diseaseData.preventiveM,
                  diseaseTreatment: diseaseData.treatment,
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
  final List diseaseSymptoms;
  final List diseasePrevention;
  final List diseaseTreatment;
  final List causesOfDisease;
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
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List.generate(
                  diseaseSymptoms.length,
                  (index) => Row(
                    children: [
                      CircleAvatar(
                        radius: 3,
                        backgroundColor: Colors.grey,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        diseaseSymptoms[index],
                        style: textFontStyle,
                      ),
                    ],
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
                'Causes of Disease',
                style: titleFontStyle,
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List.generate(
                  causesOfDisease.length,
                  (index) => Row(
                    children: [
                      CircleAvatar(
                        radius: 3,
                        backgroundColor: Colors.grey,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        causesOfDisease[index],
                        style: textFontStyle,
                      ),
                    ],
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
                'Disease Prevention',
                style: titleFontStyle,
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List.generate(
                  diseasePrevention.length,
                  (index) => Row(
                    children: [
                      CircleAvatar(
                        radius: 3,
                        backgroundColor: Colors.grey,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        diseasePrevention[index],
                        style: textFontStyle,
                      ),
                    ],
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
                'Disease Treatment',
                style: titleFontStyle,
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List.generate(
                  diseaseTreatment.length,
                  (index) => Row(
                    children: [
                      CircleAvatar(
                        radius: 3,
                        backgroundColor: Colors.grey,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        diseaseTreatment[index],
                        style: textFontStyle,
                      ),
                    ],
                  ),
                ),
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
