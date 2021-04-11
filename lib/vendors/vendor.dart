import 'package:agriteck_user/styles/app-colors.dart';
import 'package:agriteck_user/vendors/vendor-list.dart';
import 'package:flutter/material.dart';

class VendorScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        //resizeToAvoidBottomPadding: false,
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Scaffold(
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
              backgroundColor: primary.withOpacity(0.5),
              title: Text(
                'Vendors',
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
            body: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height - 61,
              color: primaryLight.withOpacity(0.1),
              child: Column(
                children: [
                  //Filter(),
                  VendorList(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
