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

class InvestmentRequestUpdate extends StatefulWidget {
  final Investment investment;
  InvestmentRequestUpdate({this.investment});
  @override
  _InvestmentRequestUpdateState createState() =>
      _InvestmentRequestUpdateState();
}

class _InvestmentRequestUpdateState extends State<InvestmentRequestUpdate> {
  bool isLoading = false;
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  FToast fToast;
  TextEditingController inputController;
  TextEditingController paybackController;

  @override
  void initState() {
    super.initState();
    fToast = FToast();
    fToast.init(context);
    paybackController = TextEditingController(text: widget.investment.payback);
    inputController = TextEditingController(text: widget.investment.input);
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
          'Update Investment Request',
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
                              widget.investment.input = value;
                            });
                          },
                          controller: inputController,
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
                              widget.investment.payback = value;
                            });
                          },
                          controller: paybackController,
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
                                press: isLoading
                                    ? null
                                    : updateInvestmentFunction(
                                        widget.investment))),
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

  updateInvestmentFunction(Investment investment) {
    return () async {
      if (mounted) {
        setState(() {
          isLoading = true;
        });
      }
      if (_formKey.currentState.validate()) {
        _formKey.currentState.save();
        try {
          // Get farmer details
          // farmerDetails = widget.investment['farmerDetails'];
          // farmerDetails['farmerId'] = widget.investment['farmerId'];
          // // Then farm details
          // widget.investment.remove('farmerDetails');
          // widget.investment.remove('farmState');
          // widget.investment.remove('description');
          // widget.investment.remove('farmerId');
          // farmDetails = widget.investment;

          String userId = await SharedPrefs.getUserID();
          String userData = await SharedPrefs.getUserData();
          Map investor = json.decode(userData);
          // String user=await SharedPrefs.getUserID();
          User user = FirebaseAuth.instance.currentUser;
          if (user != null) {
            investment.inverstorDetails = {
              'investorID': userId,
              'name': investor['name'],
              'phone': investor['phone'],
              'location': investor['location'],
              'interest': investor['interest'],
            };
            // Update from database
            await DatabaseServices.setDocument(
                'Investments', investment.investmentID, investment.toMap());
            isLoading = false;
            await showToast(context, fToast, Icons.check, primaryDark,
                "Request Updated successfully");
            Navigator.pop(context);
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
    };
  }
}
