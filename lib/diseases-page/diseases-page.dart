import 'package:agriteck_user/common-functions/helper-functions.dart';
import 'package:agriteck_user/diseases-page/disease-card.dart';
import 'package:agriteck_user/diseases-page/disease-details.dart';
import 'package:agriteck_user/styles/app-colors.dart';
import 'package:flutter/material.dart';

class DiseasesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryLight,
        title: Text(
          'Diseases',
          style: TextStyle(
              fontWeight: FontWeight.w600, fontSize: 18, color: Colors.white),
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
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: primaryLight.withOpacity(0.3),
                    ),
                    child: ListView.builder(
                      padding: EdgeInsets.only(bottom: 80.0),
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return InkWell(
                          child: Container(
                            child: DiseaseCard(
                              diseaseImage: 'assets/diseases/disease1.jpg',
                              diseaseName: 'Curly flew Shoot',
                              plantType: 'general grass',
                            ),
                          ),
                          onTap: () {
                            sendToPage(
                              context,
                              DiseaseDetailsScreen(
                                diseaseName: 'Curly flew Shoot',
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
    );
  }
}
