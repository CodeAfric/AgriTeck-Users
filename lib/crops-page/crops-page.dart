import 'package:agriteck_user/common-functions/helper-functions.dart';
import 'package:agriteck_user/crops-page/crops-card.dart';
import 'package:agriteck_user/crops-page/crops-details.dart';
import 'package:agriteck_user/diseases-page/disease-details.dart';
import 'package:flutter/material.dart';

class CropsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
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
    );
  }
}
