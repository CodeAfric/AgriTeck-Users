import 'package:agriteck_user/common-functions/helper-functions.dart';
import 'package:agriteck_user/commonly-used-widget/custom_app_bar.dart';
import 'package:agriteck_user/commonly-used-widget/floating-buttton.dart';
import 'package:agriteck_user/commonly-used-widget/floating-menu.dart';
import 'package:agriteck_user/investment-page/new-farm-page.dart';
import 'package:agriteck_user/investors/investor.dart';
import 'package:agriteck_user/pojo-classes/product-data.dart';
import 'package:agriteck_user/products-page/add_new_product.dart';
import 'package:agriteck_user/products-page/product_card.dart';
import 'package:agriteck_user/products-page/product_details.dart';
import 'package:agriteck_user/services/sharedPrefs.dart';
import 'package:agriteck_user/styles/app-colors.dart';
import 'package:async_loader/async_loader.dart';
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
  getData() async {
    List productList;
    var userType = await SharedPrefs.getUserType();
    var snapshot;
    if (userType == 'Farmers') {
      var userId = await SharedPrefs.getUserID();
      snapshot = await DatabaseServices.queryFromDatabaseByField(
          'Products', 'farmer.farmerId', userId);
    } else if (userType == 'Investors') {
      snapshot = await DatabaseServices.getDataFromDatabase('Products');
    }

    productList = snapshot.docs.toList();
    return productList;
  }

  final GlobalKey<AsyncLoaderState> _asyncLoaderStateProduct =
      new GlobalKey<AsyncLoaderState>();

  @override
  Widget build(BuildContext context) {
    var _asyncLoader = new AsyncLoader(
      key: _asyncLoaderStateProduct,
      initState: () async => getData(),
      renderLoad: () => Center(child: new CircularProgressIndicator()),
      renderError: ([error]) => Center(
        child: new Text('Sorry, there was an error loading your Information'),
      ),
      renderSuccess: ({data}) => ListView.builder(
        padding: EdgeInsets.only(bottom: 80.0),
        itemCount: data.length,
        itemBuilder: (context, index) {
          var product = Product.fromMapObject(data[index].data());
          return InkWell(
            child: Container(
              child: ProductCard(
                productImage:
                    product.images.length > 0 ? product.images[0] : null,
                productName: product.productName,
                productDesc: product.productDescription,
              ),
            ),
            onTap: () {
              sendToPage(
                context,
                ProductDetails(productData: product),
              );
            },
          );
        },
      ),
    );
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
              color: Colors.white,
              child: _asyncLoader,
            ),
          ),
        ),
        floatingActionButton: FloatingButton(
          label: 'Add Product',
          icon: Icons.add,
          onPressHandler: () {
            sendToPage(context, AddNewProduct());
          },
        ));
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
                      productImage: 'assets/diseases/disease1.jpg',
                      productName: 'Curly flew Shoot',
                      productDesc: 'general grass',
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
