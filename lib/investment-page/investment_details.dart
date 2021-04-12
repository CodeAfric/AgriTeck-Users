import 'dart:convert';
import 'dart:io';

import 'package:agriteck_user/common-functions/helper-functions.dart';
import 'package:agriteck_user/commonly-used-widget/dailog-box.dart';
import 'package:agriteck_user/commonly-used-widget/floating-buttton.dart';
import 'package:agriteck_user/commonly-used-widget/floating-menu.dart';
import 'package:agriteck_user/commonly-used-widget/image-carousel.dart';
import 'package:agriteck_user/commonly-used-widget/round_button.dart';
import 'package:agriteck_user/commonly-used-widget/textField.dart';
import 'package:agriteck_user/farms-page/farmstate_update.dart';
import 'package:agriteck_user/farms-page/update-farm-page.dart';
import 'package:agriteck_user/investment-page/investment_request_update.dart';
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
              ImageCarousel([...widget.investment.farmDetails['images']]),
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
                          child: InvestmentContent(
                            input: widget.investment.input,
                            payback: widget.investment.payback,
                            farmDetails: widget.investment.farmDetails,
                            farmerDetails: widget.investment.farmerDetails,
                            inverstorDetails:
                                widget.investment.inverstorDetails,
                            approved: widget.investment.approved,
                            accepted: widget.investment.accepted,
                          ),
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
          ? FloatingButton(
              label: 'Accept Request',
              icon: Icons.check,
              onPressHandler: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return CustomDialogBox(
                      title: 'Accept Request',
                      descriptions:
                          'Are you sure you want to accept the request.',
                      btn1Text: 'No',
                      btn2Text: 'Yes',
                      img: 'assets/images/person.png',
                      btn1Press: () {
                        Navigator.pop(context);
                      },
                    );
                  },
                );
              },
            )
          : FloatingButton(
              label: 'Update Request',
              icon: Icons.edit,
              onPressHandler: () {
                sendToPage(
                  context,
                  InvestmentRequestUpdate(
                    investment: widget.investment,
                  ),
                );
              },
            ),
    );
  }
}

class InvestmentContent extends StatelessWidget {
  String input, payback;
  Map farmDetails, inverstorDetails, farmerDetails;
  bool approved, accepted;
  DateTime time, startTime, endTime;
  final TextStyle titleFontStyle = TextStyle(color: primaryDark, fontSize: 22);
  final TextStyle textFontStyle = TextStyle(fontSize: 16, height: 1.5);
  final TextStyle textFontStyle2 = TextStyle(
    fontWeight: FontWeight.bold,
    color: primary,
    fontSize: 16,
    height: 1.5,
  );
  var formatter = new DateFormat('MM/dd/yyyy');
  InvestmentContent({
    this.input = '',
    this.payback = '',
    this.farmDetails = const {},
    this.farmerDetails = const {},
    this.inverstorDetails = const {},
    this.approved = false,
    this.accepted = false,
    this.time,
    this.startTime,
    this.endTime,
  });

  @override
  Widget build(BuildContext context) {
    var _inputs = input.split(', ');
    var _payback = payback.split(', ');
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
                    'Approved Status',
                    style: titleFontStyle,
                  ),
                  subtitle: Text(
                    approved ? 'Approved By Admin' : 'Not Approved By Admin',
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
                    'Acceptance Status',
                    style: titleFontStyle,
                  ),
                  subtitle: Text(
                    accepted ? 'Accepted by Farmer' : 'Not Accepted by Farmer',
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
                    'Investor Inputs',
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
                              _inputs.length,
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
                                    _inputs[index],
                                    style: textFontStyle,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                ],
                              ),
                            ),
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
                    'Farmer Payback',
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
                              _payback.length,
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
                                    _payback[index],
                                    style: textFontStyle,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                ],
                              ),
                            ),
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
                    'Farm Details',
                    style: titleFontStyle,
                  ),
                  subtitle: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Wrap(
                        children: [
                          Text('Farm ID: ', style: textFontStyle2),
                          SizedBox(width: 2),
                          Text(farmDetails['farmId'], style: textFontStyle),
                        ],
                      ),
                      Wrap(
                        children: [
                          Text('Crops: ', style: textFontStyle2),
                          SizedBox(width: 2),
                          Text(farmDetails['cropType'], style: textFontStyle),
                        ],
                      ),
                      Wrap(
                        children: [
                          Text('Farm Size: ', style: textFontStyle2),
                          SizedBox(width: 2),
                          Text(farmDetails['farmSize'].toString(),
                              style: textFontStyle),
                        ],
                      ),
                      Wrap(
                        children: [
                          Text('Farm Lacation: ', style: textFontStyle2),
                          SizedBox(width: 2),
                          Text(farmDetails['location'], style: textFontStyle),
                        ],
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
                    'Farmer Details',
                    style: titleFontStyle,
                  ),
                  subtitle: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Wrap(
                        children: [
                          Text('Name: ', style: textFontStyle2),
                          SizedBox(width: 2),
                          Text(farmerDetails['name'], style: textFontStyle),
                        ],
                      ),
                      Wrap(
                        children: [
                          Text('Phone: ', style: textFontStyle2),
                          SizedBox(width: 2),
                          Text(farmerDetails['telephone'],
                              style: textFontStyle),
                        ],
                      ),
                      Wrap(
                        children: [
                          Text('Location: ', style: textFontStyle2),
                          SizedBox(width: 2),
                          Text(farmerDetails['location'], style: textFontStyle),
                        ],
                      ),
                      Wrap(
                        children: [
                          Text('Specialization: ', style: textFontStyle2),
                          SizedBox(width: 2),
                          Text(farmerDetails['specialized'],
                              style: textFontStyle),
                        ],
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
                    'Investor Details',
                    style: titleFontStyle,
                  ),
                  subtitle: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Wrap(
                        children: [
                          Text('Name: ', style: textFontStyle2),
                          SizedBox(width: 2),
                          Text(inverstorDetails['name'], style: textFontStyle),
                        ],
                      ),
                      Wrap(
                        children: [
                          Text('Phone: ', style: textFontStyle2),
                          SizedBox(width: 2),
                          Text(inverstorDetails['phone'], style: textFontStyle),
                        ],
                      ),
                      Wrap(
                        children: [
                          Text('Location: ', style: textFontStyle2),
                          SizedBox(width: 2),
                          Text(inverstorDetails['location'],
                              style: textFontStyle),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
