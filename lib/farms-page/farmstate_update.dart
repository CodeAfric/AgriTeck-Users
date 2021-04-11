import 'dart:convert';
import 'dart:io';
import 'package:agriteck_user/common-functions/helper-functions.dart';
import 'package:agriteck_user/commonly-used-widget/round_button.dart';
import 'package:agriteck_user/commonly-used-widget/shape-painter.dart';
import 'package:agriteck_user/commonly-used-widget/textField.dart';
import 'package:agriteck_user/pojo-classes/farmers-data.dart';
import 'package:agriteck_user/pojo-classes/farms-data.dart';
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

class FarmStateUpdate extends StatefulWidget {
  final Farm farm;
  FarmStateUpdate({this.farm});
  @override
  _FarmStateUpdateState createState() => _FarmStateUpdateState();
}

class _FarmStateUpdateState extends State<FarmStateUpdate> {
  Map<String, dynamic> farmState = {
    'input': '',
    'state': '',
    'dateTime': '',
  };
  bool isLoading = false;
  final picker = ImagePicker();
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  FToast fToast;
  TextEditingController _pickDateController =
      TextEditingController(text: 'choose time ');

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
          'Update Farm State',
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
                        getDate(),
                        SizedBox(
                          height: 20,
                        ),
                        InputTextField(
                          withDecoration: true,
                          onSave: (value) {
                            setState(() {
                              farmState['state'] = value;
                            });
                          },
                          type: TextInputType.text,
                          label: 'State',
                          alignText: true,
                          validation: (value) {
                            if (value.isEmpty) {
                              return 'Please Enter State of the Farm';
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
                          maxLine: 3,
                          onSave: (value) {
                            setState(() {
                              farmState['input'] = value;
                            });
                          },
                          type: TextInputType.text,
                          label: 'Input',
                          alignText: true,
                          validation: (value) {
                            if (value.isEmpty) {
                              return 'Please Enter Farm State Input';
                            } else
                              return null;
                          },
                          isPassword: false,
                        ),
                        SizedBox(height: 20.0),
                        SizedBox(
                          width: 200,
                          child: RoundedButton(
                            isLoading: isLoading,
                            text: 'UPDATE DATA',
                            color: primaryDark,
                            press: isLoading
                                ? null
                                : updateDataFunction(widget.farm),
                          ),
                        ),
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

  Widget getDate() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: primary.withOpacity(.98),
              blurRadius: 2,
              offset: Offset(0, 2),
            )
          ]),
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        //margin: EdgeInsets.only(left: 70, right: 20),
        child: TextFormField(
          onTap: () async {
            await showDatePicker(
              context: context,
              initialDate: DateTime(1900, 1, 1),
              firstDate: DateTime(1900, 1, 1),
              lastDate: DateTime.now(),
              initialDatePickerMode: DatePickerMode.year,
              builder: (BuildContext context, Widget child) {
                return Theme(
                  data: ThemeData(
                    primaryColor: primary,
                    accentColor: primaryLight,
                    buttonBarTheme: ButtonBarThemeData(
                      buttonTextTheme: ButtonTextTheme.accent,
                    ),
                  ),
                  child: child,
                );
              },
            ).then((value) {
              if (value != null) {
                farmState['dateTime'] = value;
                var formatter = new DateFormat('MM/dd/yyyy');
                _pickDateController.text = formatter.format(value);
              }
            });
          },
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(16.0),
            prefixIcon: Container(
                padding: const EdgeInsets.only(top: 16.0, bottom: 16.0),
                margin: const EdgeInsets.only(right: 8.0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30.0),
                        bottomLeft: Radius.circular(30.0),
                        topRight: Radius.circular(30.0),
                        bottomRight: Radius.circular(10.0))),
                child: Icon(
                  Icons.date_range_outlined,
                  color: primary,
                )),
            hintStyle: TextStyle(color: primaryLight),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0),
                borderSide: BorderSide.none),
            filled: true,
            fillColor: Colors.white54,
          ),
          style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black87),
          cursorColor: primary,
          controller: _pickDateController,
          readOnly: true,
        ),
      ),
    );
  }

  Function updateDataFunction(Farm farm) {
    return () async {
      print(farm);
      if (mounted) {
        setState(() {
          isLoading = true;
        });
      }
      if (_formKey.currentState.validate()) {
        _formKey.currentState.save();
        try {
          // String user=await SharedPrefs.getUserID();
          var formatter = new DateFormat('MM/dd/yyyy');
          User user = FirebaseAuth.instance.currentUser;
          if (user != null) {
            farm.farmState.add(farmState);
            Map<String, dynamic> update = {'farmState': farm.farmState};

            // Update from database
            await DatabaseServices.updateDocument('Farms', farm.farmId, update);
            isLoading = false;
            await showToast(context, fToast, Icons.check, primaryDark,
                "Farm data Saved successfully");
            sendToPage(
                context,
                MainPage(
                  initPage: BottomButtons.Farms,
                ));
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
