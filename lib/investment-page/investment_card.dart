import 'package:agriteck_user/styles/app-colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class InvestorCard extends StatelessWidget {
  final String farmImage;
  final String farmName;
  final String farmLocation;
  final String investmentInputs;

  const InvestorCard(
      {Key key,
      this.farmImage,
      this.farmName,
      this.investmentInputs,
      this.farmLocation})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: EdgeInsets.all(3.0),
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(3)),
              child: farmImage != null
                  ? CachedNetworkImage(
                      imageUrl: farmImage,
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
                    padding: EdgeInsets.only(top: 0),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      farmName,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 18,
                        color: primaryDark,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 5),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      farmLocation,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 16,
                        color: primary,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 5),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      investmentInputs,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontSize: 18,
                          color: primary,
                          fontWeight: FontWeight.w600),
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
    );
  }
}
