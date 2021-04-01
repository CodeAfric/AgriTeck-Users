import 'package:agriteck_user/Toast/show_toast.dart';
import 'package:agriteck_user/common-functions/helper-functions.dart';
import 'package:agriteck_user/farms/farm-details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:agriteck_user/styles/app-colors.dart';

class FarmScreen extends StatefulWidget {
  @override
  _FarmScreenState createState() => _FarmScreenState();
}

class _FarmScreenState extends State<FarmScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5.0),
      child: ListView.builder(
          padding: EdgeInsets.only(bottom: 80),
          itemCount: 8,
          itemBuilder: (context, index) {
            return ListItems(
              farmImage: 'assets/diseases/farm1.jpeg',
              farmName: "Attah Boakye's farm",
              farmLocation: 'Kwadaso Municipal',
            );
          }),
    );
  }
}

class ListItems extends StatelessWidget {
  final String farmImage;
  final String farmName;
  final String farmLocation;

  const ListItems({Key key, this.farmImage, this.farmName, this.farmLocation})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      elevation: 2.0,
      child: InkWell(
        onTap: () => sendToPage(context, FarmDetailsScreen()),
        child: Container(
          padding: EdgeInsets.all(3.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(3)),
                  child: Image.asset(
                    farmImage,
                    width: 125,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        farmName,
                        style: TextStyle(
                          fontSize: 18,
                          color: primary,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        farmLocation,
                        style: TextStyle(
                            fontSize: 14,
                            color: primary,
                            fontWeight: FontWeight.w400),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
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
