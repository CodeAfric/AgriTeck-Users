import 'package:agriteck_user/products/product-list.dart';
import 'package:agriteck_user/styles/app-colors.dart';
import 'package:flutter/material.dart';

class ProductScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height - 61,
      color: primaryLight.withOpacity(0.1),
      child: Column(
        children: [
          //Filter(),
          ProductList(),
        ],
      ),
    );
  }
}
