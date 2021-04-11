import 'package:agriteck_user/common-functions/helper-functions.dart';
import 'package:agriteck_user/commonly-used-widget/custom_app_bar.dart';
import 'package:agriteck_user/commonly-used-widget/detect-disease.dart';
import 'package:agriteck_user/commonly-used-widget/floating-buttton.dart';
import 'package:agriteck_user/diseases-page/disease-card.dart';
import 'package:agriteck_user/pojo-classes/diseases-data.dart';
import 'package:agriteck_user/services/database-services.dart';
import 'package:agriteck_user/diseases-page/disease-details.dart';
import 'package:agriteck_user/styles/app-colors.dart';
import 'package:flutter/material.dart';

class DiseasesScreen extends StatefulWidget {
  @override
  _DiseasesScreenState createState() => _DiseasesScreenState();
}

class _DiseasesScreenState extends State<DiseasesScreen> {
  List diseasesList = [];

  @override
  void initState() {
    super.initState();
    DatabaseServices.getDataFromDatabase('Diseases').then((snapshot) {
      setState(() {
        diseasesList = snapshot.docs.toList();
      });
    });

    ///whatever you want to run on page build
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Diseases Page',
        leadingIcon: Icons.arrow_back,
        onIconPress: () {
          setState(() {
            Navigator.pop(context);
          });
        },
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height - 61,
            color: Colors.white,
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: ListView.builder(
                      padding: EdgeInsets.only(bottom: 80.0),
                      itemCount: diseasesList.length,
                      itemBuilder: (context, index) {
                        var disease = Disease.fromMapObject(
                          diseasesList[index].data(),
                        );
                        return InkWell(
                          child: Container(
                            child: DiseaseCard(
                              diseaseImage: disease.images[0],
                              // diseasesList[index]['images'][0] != null
                              //     ? diseasesList[index]['images'][0]
                              //     : null,
                              diseaseName: disease.name,
                              affectedPlants: disease.affectedPlants.join(', '),
                            ),
                          ),
                          onTap: () {
                            sendToPage(
                              context,
                              DiseaseDetailsScreen(
                                diseaseData: Disease.fromMapObject(
                                  diseasesList[index].data(),
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingButton(
        label: 'Detect Disease',
        icon: Icons.photo_camera,
        onPressHandler: () {
          detectDisease(context);
        },
      ),
    );
  }
}
