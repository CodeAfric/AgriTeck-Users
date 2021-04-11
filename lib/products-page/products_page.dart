import 'package:agriteck_user/common-functions/helper-functions.dart';
import 'package:agriteck_user/commonly-used-widget/custom_app_bar.dart';
import 'package:agriteck_user/products-page/product_card.dart';
import 'package:agriteck_user/products-page/product_details.dart';
import 'package:agriteck_user/styles/app-colors.dart';
import 'package:flutter/material.dart';

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

class ProductFullScreen extends StatefulWidget {
  @override
  _ProductFullScreenState createState() => _ProductFullScreenState();
}

class _ProductFullScreenState extends State<ProductFullScreen> {
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
          'Product List',
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
            child: ListView.builder(
              padding: EdgeInsets.only(bottom: 80.0),
              itemCount: 10,
              itemBuilder: (context, index) {
                return InkWell(
                  child: Container(
                    child: ProductCard(
                      diseaseImage: 'assets/diseases/disease1.jpg',
                      diseaseName: 'Curly flew Shoot',
                      plantType: 'general grass',
                    ),
                  ),
                  onTap: () {
                    sendToPage(
                      context,
                      ProductDetails(),
                    );
                  },
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

class ProductsMidScreen extends StatelessWidget {
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
                        ProductDetails(),
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

class ProductScreens extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height - 61,
      color: primaryLight.withOpacity(0.1),
      child: Column(
        children: [
          //Filter(),
          Container(
            padding: EdgeInsets.all(10),
            alignment: Alignment.centerLeft,
            child: Text(
              'Product List'.toUpperCase(),
              style: TextStyle(
                  color: primaryDark,
                  fontWeight: FontWeight.w600,
                  fontSize: 16),
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.only(bottom: 80.0),
              itemCount: 10,
              itemBuilder: (context, index) {
                return InkWell(
                  child: Container(
                    child: ProductCard(
                      diseaseImage: 'assets/diseases/disease1.jpg',
                      diseaseName: 'Curly flew Shoot',
                      plantType: 'general grass',
                    ),
                  ),
                  onTap: () {
                    sendToPage(
                      context,
                      ProductDetails(),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
