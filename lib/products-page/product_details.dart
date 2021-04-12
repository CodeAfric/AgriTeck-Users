import 'package:agriteck_user/commonly-used-widget/image-carousel.dart';
import 'package:agriteck_user/pojo-classes/product-data.dart';
import 'package:agriteck_user/styles/app-colors.dart';
import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:intl/intl.dart';

class ProductDetails extends StatelessWidget {
  final Product productData;
  // final String diseaseId;

  // todo: Get the details detal at the init state
  ProductDetails({this.productData});

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
            ImageCarousel([...productData.images]),
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
                child: ProductContent(
                  productName: productData.productName,
                  productDescription: productData.productDescription,
                  timeStamp: productData.timeStamp,
                  quantity: productData.quantity,
                  price: productData.price,
                  measure: productData.measure,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProductContent extends StatelessWidget {
  final String productName;
  final String productDescription;
  final String timeStamp;
  final int quantity;
  final double price;
  final String measure;
  final TextStyle titleFontStyle = TextStyle(color: primaryDark, fontSize: 22);
  final TextStyle textFontStyle = TextStyle(fontSize: 16, height: 1.5);

  ProductContent(
      {Key key,
      this.productName,
      this.productDescription,
      this.timeStamp,
      this.quantity,
      this.price,
      this.measure})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        ...ListTile.divideTiles(color: primary, tiles: [
          ListTile(
            contentPadding: EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 4,
            ),
            title: Text(
              'Product Name',
              style: titleFontStyle,
            ),
            subtitle: Text(
              productName,
              style: textFontStyle,
            ),
          ),
          ListTile(
            contentPadding: EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 4,
            ),
            title: Text(
              'Description',
              style: titleFontStyle,
            ),
            subtitle: Text(
              productDescription,
              style: textFontStyle,
            ),
          ),
          ListTile(
            contentPadding: EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 4,
            ),
            title: Text(
              'Time',
              style: titleFontStyle,
            ),
            subtitle: Text(
              DateFormat('MM/dd/yyyy').format(
                DateTime.parse(timeStamp),
              ),
            ),
          ),
          ListTile(
            contentPadding: EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 4,
            ),
            title: Text(
              'Quantity',
              style: titleFontStyle,
            ),
            subtitle: Text(quantity.toString()),
          ),
          ListTile(
              contentPadding: EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 4,
              ),
              title: Text(
                'Price',
                style: titleFontStyle,
              ),
              subtitle: Text(price.toString())),
          ListTile(
              contentPadding: EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 4,
              ),
              title: Text(
                'Measure',
                style: titleFontStyle,
              ),
              subtitle: Text(measure)),
        ]),
      ],
    );
  }
}
