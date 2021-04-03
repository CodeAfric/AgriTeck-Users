import 'package:agriteck_user/common-functions/helper-functions.dart';
import 'package:agriteck_user/styles/app-colors.dart';
import 'package:flutter/material.dart';
import 'package:agriteck_user/model-data/DataModels.dart';

import 'Details_of_Farmers.dart';

class FarmersList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            size: 35.0,
            color: primaryDark,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: primaryLight.withOpacity(0.5),
        title: Text(
          'Farmers',
          style: TextStyle(
              color: primaryDark,
              fontWeight: FontWeight.w900,
              fontSize: 22.0),
        ),
        actions: [
          IconButton(
              icon: Icon(
                Icons.more_vert,
                size: 32,
                color: Colors.white,
              ),
              onPressed: () {})
        ],
      ),
      body:  ListView.builder(
        padding: EdgeInsets.only(bottom: 80.0),
        itemCount: 10,
        itemBuilder: (context, index) {
          return InkWell(
            child: Container(
              child: ListItems(
              ),
            ),
            onTap: () {
              sendToPage(context, FarmersDetails());
            },
          );
        },
      ),
      );
  }
}

class ListItems extends StatelessWidget {
  final Farmers data = new Farmers();
  @override
  Widget build(BuildContext context) {
    var listItems = Farmers_data().farmers_details()[0];
    return Container(
      child: Card(
        elevation: 5,
        child: Container(
          child: ListTile(
            isThreeLine: true,
            leading: Container(
              height: 60,
              width: 60,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.asset(listItems.farmerImage, fit: BoxFit.cover,height: 55,width: 55,),
              ),
            ),
            title: Text(
              listItems.farmerName,
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 16,
                color: primaryDark,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.phone, size: 13, color: Colors.black38),
                    SizedBox(width: 4),
                    Text(
                      listItems.farmerContact,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 16,
                        color: primary,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 6),
                Row(
                  children: [
                    Icon(Icons.location_pin, size: 13, color: Colors.red[400]),
                    SizedBox(width: 4),
                    Text(
                      listItems.farmerLocation,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 16,
                        color: primaryLight,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            trailing: Icon(
              Icons.chevron_right_outlined,
              color: primaryLight,
              size: 40,
            ),
          ),
        ),
      ),
    );
  }
}