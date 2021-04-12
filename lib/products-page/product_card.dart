import 'package:flutter/material.dart';
import 'package:agriteck_user/styles/app-colors.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ProductCard extends StatelessWidget {
  final String productImage;
  final String productName;
  final String productDesc;

  const ProductCard(
      {Key key, this.productImage, this.productName, this.productDesc})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        elevation: 5,
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
                child: Container(
                  padding: EdgeInsets.all(3.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(3)),
                    child: productImage != null
                        ? CachedNetworkImage(
                            imageUrl: productImage,
                            fit: BoxFit.cover,
                            height: 80,
                            width: 100,
                          )
                        : Image.asset(
                            'assets/diseases/disease1.jpg',
                            fit: BoxFit.cover,
                            height: 80,
                            width: 100,
                          ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.only(top: 10),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          productName,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 16,
                            color: primaryDark,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 10),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          productDesc,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 16,
                            color: primary,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                alignment: Alignment.centerRight,
                child: Icon(
                  Icons.chevron_right_outlined,
                  color: primaryLight,
                  size: 40,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
