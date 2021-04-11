import 'dart:convert';
import 'dart:io';

import 'package:agriteck_user/common-functions/helper-functions.dart';
import 'package:agriteck_user/commonly-used-widget/floating-buttton.dart';
import 'package:agriteck_user/commonly-used-widget/floating-menu.dart';
import 'package:agriteck_user/commonly-used-widget/image-carousel.dart';
import 'package:agriteck_user/commonly-used-widget/round_button.dart';
import 'package:agriteck_user/commonly-used-widget/textField.dart';
import 'package:agriteck_user/farms-page/farmstate_update.dart';
import 'package:agriteck_user/farms-page/update-farm-page.dart';
import 'package:agriteck_user/main-page.dart';
import 'package:agriteck_user/pojo-classes/farms-data.dart';
import 'package:agriteck_user/pojo-classes/investment.dart';
import 'package:agriteck_user/services/database-services.dart';
import 'package:agriteck_user/services/sharedPrefs.dart';
import 'package:agriteck_user/services/user-services.dart';
import 'package:agriteck_user/styles/app-colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class InvestmentDetailsScreen extends StatefulWidget {
  final Investment investment;

  InvestmentDetailsScreen({Key key, this.investment}) : super(key: key);

  @override
  _InvestmentDetailsScreenState createState() =>
      _InvestmentDetailsScreenState();
}

class _InvestmentDetailsScreenState extends State<InvestmentDetailsScreen> {
  String userType;

  getUserInfo() async {
    userType = await SharedPrefs.getUserType();
  }

  @override
  void initState() {
    getUserInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return Scaffold(
      //resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              ImageCarousel([
                'assets/diseases/disease1.jpg',
                'assets/diseases/disease1.jpg',
                'assets/diseases/disease1.jpg',
              ]),
              Container(
                height: size.height * 0.70,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15.0),
                    topRight: Radius.circular(15.0),
                  ),
                ),
                child: Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10.0),
                          topRight: Radius.circular(10.0)),
                      color: Colors.white,
                    ),
                    child: ListView(
                      scrollDirection: Axis.vertical,
                      padding: EdgeInsets.only(bottom: 80.0),
                      children: [
                        Container(
                            // child: FarmContent(
                            //   farmId: widget.investment.farmId,
                            //   location: widget.investment.location,
                            //   description: widget.investment.description,
                            //   farmCrops: widget.investment.cropType,
                            //   farmSize: widget.investment.farmSize.toString(),
                            //   farmState: widget.investment.farmState,
                            // ),
                            )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: (userType == 'Farmers')
          ? FloatingMenu(
              // label: 'Post Product',
              animatedIcon: AnimatedIcons.menu_close,
              menuItems: [
                BubbleMenuItem.create(
                  label: 'Update Farm',
                  icon: Icons.edit,
                  onPress: () {
                    // sendToPage(
                    //     context,
                    //     UpdateFarm(
                    //       farm: widget.farm,
                    //     ));
                  },
                ),
                BubbleMenuItem.create(
                  label: 'Update Farm State',
                  icon: Icons.accessibility,
                  onPress: () {
                    // sendToPage(
                    //     context,
                    //     FarmStateUpdate(
                    //       farm: widget.farm,
                    //     ));
                  },
                ),
              ],
              // onPressHandler: () {},
            )
          : FloatingButton(
              label: 'Request for Investment',
              icon: Icons.edit,
              onPressHandler: () {},
            ),

      // FloatingButton(
      //     label: 'Request Investment',
      //     icon: Icons.person,
      //     onPressHandler: () {
      //       showDialog(
      //           context: context,
      //           builder: (BuildContext context) {
      //             return CustomDialogBox(
      //               title: 'Investment Request',
      //               descriptions: 'Your request has been submitted.',
      //               btn1Text: '',
      //               btn2Text: 'okay',
      //               img: 'assets/images/person.png',
      //               btn1Press: () {
      //                 Navigator.pop(context);
      //               },
      //             );
      //           });
      //     }),
      //
    );
  }
}

class FarmContent extends StatelessWidget {
  final String farmId;
  final String location;
  final String description;
  final String farmSize;
  final List farmState;
  final String farmCrops;
  final Map farmer;
  final TextStyle titleFontStyle = TextStyle(color: primaryDark, fontSize: 22);
  final TextStyle textFontStyle = TextStyle(fontSize: 16, height: 1.5);
  var formatter = new DateFormat('MM/dd/yyyy');
  FarmContent({
    Key key,
    this.farmId = '',
    this.location = '',
    this.description = '',
    this.farmSize = '',
    this.farmState = const [],
    this.farmer = const {},
    this.farmCrops = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _farmCrops = farmCrops.split(', ');
    return Container(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ...ListTile.divideTiles(
              color: primary,
              tiles: [
                ListTile(
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 4,
                  ),
                  title: Text(
                    'Farm ID',
                    style: titleFontStyle,
                  ),
                  subtitle: Text(
                    farmId,
                    style: textFontStyle,
                  ),
                ),
                ListTile(
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 4,
                    ),
                    title: Text(
                      'Farm Size',
                      style: titleFontStyle,
                    ),
                    subtitle: Text(farmSize)),
                ListTile(
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 4,
                  ),
                  title: Text(
                    'Crop Type',
                    style: titleFontStyle,
                  ),
                  subtitle: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 2),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ...List.generate(
                                _farmCrops.length,
                                (index) => Row(
                                      children: [
                                        CircleAvatar(
                                          radius: 3,
                                          backgroundColor: Colors.grey,
                                        ),
                                        SizedBox(
                                          width: 2,
                                        ),
                                        Text(
                                          _farmCrops[index],
                                          style: textFontStyle,
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                      ],
                                    )),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                ListTile(
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 4,
                  ),
                  title: Text(
                    'Location',
                    style: titleFontStyle,
                  ),
                  subtitle: Text(
                    location,
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
                    description,
                    maxLines: 5,
                    overflow: TextOverflow.ellipsis,
                    style: textFontStyle,
                  ),
                ),
                ListTile(
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 4,
                    ),
                    title: Text(
                      'Farm State',
                      style: titleFontStyle,
                    ),
                    subtitle: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: farmState
                          .map(
                            (state) => Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  formatter.format(state['dateTime'].toDate()),
                                  style: textFontStyle,
                                ),
                                SizedBox(height: 4),
                                Text(state['state'], style: textFontStyle),
                                SizedBox(height: 4),
                                Text(state['input'], style: textFontStyle),
                                Divider(
                                  color: Colors.red,
                                ),
                              ],
                            ),
                          )
                          .toList(),
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
