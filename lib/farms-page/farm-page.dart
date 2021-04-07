import 'package:agriteck_user/common-functions/helper-functions.dart';
import 'package:agriteck_user/farms-page/Farm-details.dart';
import 'package:agriteck_user/farms-page/farm-card.dart';
import 'package:agriteck_user/styles/app-colors.dart';
import 'package:flutter/material.dart';

class FarmsScreen extends StatelessWidget {
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
                    child: FarmCard(
                      farmImage: 'assets/diseases/disease1.jpg',
                      farmName: 'Curly flew Shoot',
                      plantType: 'general grass',
                    ),
                    onTap: () {
                      sendToPage(
                        context,
                        FarmDetailsScreen(
                          farmName: 'Curly flew Shoot',
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
