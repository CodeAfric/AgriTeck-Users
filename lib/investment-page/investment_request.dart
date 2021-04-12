import 'dart:convert';
import 'dart:io';
import 'package:agriteck_user/common-functions/helper-functions.dart';
import 'package:agriteck_user/commonly-used-widget/round_button.dart';
import 'package:agriteck_user/commonly-used-widget/shape-painter.dart';
import 'package:agriteck_user/commonly-used-widget/textField.dart';
import 'package:agriteck_user/investment-page/investment_page.dart';
import 'package:agriteck_user/pojo-classes/farmers-data.dart';
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

import '../main-page.dart';

class InvestmentRequest extends StatefulWidget {
  final Map farm;
  InvestmentRequest({this.farm});
  @override
  _InvestmentRequestState createState() => _InvestmentRequestState();
}

class _InvestmentRequestState extends State<InvestmentRequest> {
  String input, payback;
  Map farmDetails, inverstorDetails, farmerDetails;
  bool isLoading = false;
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  FToast fToast;

  @override
  void initState() {
    super.initState();
    fToast = FToast();
    fToast.init(context);
  }

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: primary,
        elevation: 0,
        title: Text(
          'Request Investment',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: BackButton(
          color: Colors.white,
        ),
      ),
      backgroundColor: Colors.white,
      body: Stack(children: <Widget>[
        Container(
          height: _height,
          width: _width,
          child: CustomPaint(
            painter: ShapePainter(),
          ),
        ),
        Container(
          color: Colors.white.withOpacity(.6),
          height: _height,
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Form(
                  key: _formKey,
                  child: Container(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        InputTextField(
                          withDecoration: true,
                          maxLine: 5,
                          onSave: (value) {
                            setState(() {
                              input = value;
                            });
                          },
                          type: TextInputType.text,
                          label: 'Investment Inputs',
                          alignText: true,
                          validation: (value) {
                            if (value.isEmpty) {
                              return 'Please Enter Investment Inputs';
                            } else
                              return null;
                          },
                          isPassword: false,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        InputTextField(
                          withDecoration: true,
                          maxLine: 5,
                          onSave: (value) {
                            setState(() {
                              payback = value;
                            });
                          },
                          type: TextInputType.text,
                          label: 'What do you want from in return',
                          alignText: true,
                          validation: (value) {
                            if (value.isEmpty) {
                              return 'Please Enter Type of Crop on farm';
                            } else
                              return null;
                          },
                          isPassword: false,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                            width: 200,
                            child: RoundedButton(
                                isLoading: isLoading,
                                text: 'SAVE DATA',
                                color: primaryDark,
                                press: isLoading ? null : saveData)),
                        SizedBox(
                          height: 20,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }

  saveData() async {
    if (mounted) {
      setState(() {
        isLoading = true;
      });
    }
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      try {
        // Get farmer details
        farmerDetails = widget.farm['farmerDetails'];
        farmerDetails['farmerId'] = widget.farm['farmerId'];
        // Then farm details
        widget.farm.remove('farmerDetails');
        widget.farm.remove('farmState');
        widget.farm.remove('description');
        widget.farm.remove('farmerId');
        farmDetails = widget.farm;

        String userId = await SharedPrefs.getUserID();
        String userData = await SharedPrefs.getUserData();
        Map investor = json.decode(userData);
        // String user=await SharedPrefs.getUserID();
        User user = FirebaseAuth.instance.currentUser;
        if (user != null) {
          Investment investment = new Investment(
            input: input,
            payback: payback,
            farmerDetails: farmerDetails,
            farmDetails: farmDetails,
            inverstorDetails: {
              'investorID': userId,
              'name': investor['name'],
              'phone': investor['phone'],
              'location': investor['location'],
              'interest': investor['interest'],
            },
          );
          var snapshot = await DatabaseServices.saveData(
              'Investments', investment.toMap());
          Map<String, dynamic> update = {'investmentID': snapshot.id};
          await DatabaseServices.updateDocument(
              'Investments', snapshot.id, update);
          isLoading = false;
          await showToast(context, fToast, Icons.check, primaryDark,
              "Request sent successfully");
          sendToPage(context, MainPage(initPage: BottomButtons.Farms));
        }
      } catch (error) {
        setState(() {
          isLoading = false;
          print('[$error]');
        });
      }
    }

    if (mounted) {
      setState(() {
        isLoading = false;
      });
    }
  }
}
