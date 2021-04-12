import 'package:agriteck_user/styles/app-colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class FarmCard extends StatelessWidget {
  final String farmImage;
  final String farmName;
  final String plantType;
  final String farmLoc;

  const FarmCard(
      {Key key, this.farmImage, this.farmName, this.plantType, this.farmLoc})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        elevation: 5,
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
                        plantType,
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
                        farmLoc,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
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
    );
  }
}
