import 'package:agriteck_user/common-functions/helper-functions.dart';
import 'package:agriteck_user/crops-page/crops-card.dart';
import 'package:agriteck_user/crops-page/crops-details.dart';
import 'package:agriteck_user/diseases-page/disease-details.dart';
import 'package:flutter/material.dart';

import 'package:agriteck_user/common-functions/helper-functions.dart';
import 'package:agriteck_user/diseases-page/disease-card.dart';
import 'package:agriteck_user/pojo-classes/diseases-data.dart';
import 'package:agriteck_user/services/database-services.dart';
import 'package:agriteck_user/diseases-page/disease-details.dart';
import 'package:agriteck_user/styles/app-colors.dart';
import 'package:flutter/material.dart';

class CropsScreen extends StatefulWidget {
  @override
  _CropsScreenState createState() => _CropsScreenState();
}

class _CropsScreenState extends State<CropsScreen> {
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
      appBar: AppBar(
        backgroundColor: primary,
        title: Text(
          'Diseases',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 18,
            color: Colors.white,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height - 61,
              color: primaryLight.withOpacity(0.1),
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 5.0),
                      child: ListView.builder(
                          padding: EdgeInsets.only(bottom: 80.0),
                          itemCount: 10,
                          itemBuilder: (context, index) {
                            return InkWell(
                              child: CropCard(
                                cropName: 'Tomatoes',
                                cropImage: 'assets/diseases/tomatoes.jpg',
                              ),
                              onTap: () {
                                sendToPage(
                                  context,
                                  CropDetailsScreen(
                                    cropName: 'Curly flew Shoot',
                                  ),
                                );
                              },
                            );
                          }),
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
