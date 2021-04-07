import 'package:agriteck_user/common-functions/helper-functions.dart';
import 'package:agriteck_user/commonly-used-widget/round_button.dart';
import 'package:agriteck_user/commonly-used-widget/shape-painter.dart';
import 'package:agriteck_user/commonly-used-widget/textField.dart';
import 'package:agriteck_user/styles/app-colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'verificatio-page.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();
  String phoneNumber;
  bool isLoading = false;
  _sendCodeToPhone(String phone) async {
    setState(() {
      isLoading = true;
    });
    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: phone,
        verificationCompleted: (PhoneAuthCredential credential) async {
          await FirebaseAuth.instance.signInWithCredential(credential);
        },
        verificationFailed: (FirebaseAuthException e) async {
          await showSnackBar(e.message, _scaffoldKey.currentState);
          isLoading = false;
        },
        codeSent: (String verficationID, int resendToken) {
          setState(() async {
            isLoading = false;
            await showSnackBar('OTP sent to Phone', _scaffoldKey.currentState);
            sendToPage(context, OTPScreen(verficationID, phone));
          });
        },
        codeAutoRetrievalTimeout: (String verificationID) {
          setState(() async {
            isLoading = false;
            await showSnackBar('OTP sent to Phone', _scaffoldKey.currentState);
            //sendToPage(context, OTPScreen(verificationID, phoneNumber));
          });
        },
        timeout: Duration(seconds: 120));
  }

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return Scaffold(
      key: _scaffoldKey,
      body: Stack(
        children: [
          Container(
            height: _height,
            width: _width,
            child: CustomPaint(
              painter: ShapePainter(),//background image-like design
            ),
          ),
          Container(
            height: _height,
            width: _width,
            child: SingleChildScrollView(
              child: Container(
                height: _height,
                width: _width,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      RichText(
                        text: TextSpan(
                          style: Theme.of(context).textTheme.display3,
                          children: [
                            TextSpan(
                              text: "Agri",
                            ),
                            TextSpan(
                              text: "Teck",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      RichText(
                        text: TextSpan(
                          style: Theme.of(context).textTheme.bodyText1,
                          children: [
                            TextSpan(
                                text: "The Farmer's",
                                style: TextStyle(color: primaryLight)),
                            TextSpan(
                              text: " Best Friend,",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: primaryDark),
                            ),
                            TextSpan(
                                text: " The Economy's",
                                style: TextStyle(color: primaryLight)),
                            TextSpan(
                              text: " Backbone",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: primaryDark),
                            ),
                          ],
                        ),
                      ),
                      Form(
                        key: _formKey,
                        child: Container(
                          child: Column(
                            children: [
                              SizedBox(height: 20.0),
                              InputTextField(
                                withDecoration: true,
                                onSave: (value) {
                                  setState(() {
                                    phoneNumber = value;
                                  });
                                },
                                type: TextInputType.phone,
                                label: 'Phone Number',
                                validation: (value) {
                                  if (value.length < 10) {
                                    return 'Please Enter a valid Phone Number';
                                  } else
                                    return null;
                                },
                                prefixIcon: Icon(
                                  Icons.phone,
                                  color: primary,
                                ),
                                isPassword: false,
                              ),
                              SizedBox(height: 35.0),
                              SizedBox(
                                  width: 200,
                                  child: RoundedButton(
                                      isLoading: isLoading,
                                      text: 'SUBMIT',
                                      color: primary,
                                      press: _verify)),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  _verify() async {
    //we first check if the forms is correctly filed per the validation given to the textIput
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      if (mounted) {
        setState(() {
          _sendCodeToPhone(phoneNumber);//when all validation is done,
          //we move to the function to send the 
        });
      }
    }
  }

}
