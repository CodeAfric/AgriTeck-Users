import 'package:agriteck_user/authentication-screens/farmer-login/registration-pages.dart';
import 'package:agriteck_user/common%20UI/clickable-text.dart';
import 'package:agriteck_user/common%20UI/dailog-box.dart';
import 'package:agriteck_user/common%20UI/shape-painter.dart';
import 'package:agriteck_user/common-functions/helper-functions.dart';
import 'package:agriteck_user/home/home-screen.dart';
import 'package:agriteck_user/services/user-services.dart';
import 'package:agriteck_user/styles/app-colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pinput/pin_put/pin_put.dart';

class OTPScreen extends StatefulWidget {
  String verificationID,phone;

  OTPScreen(this.verificationID,this.phone);

  @override
  _OTPScreenState createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  final TextEditingController _pinPutController = TextEditingController();
  final FocusNode _pinPutFocusNode = FocusNode();
  BoxDecoration get _pinPutDecoration {
    return BoxDecoration(
      border: Border.all(color: primaryDark),
      borderRadius: BorderRadius.circular(15.0),
    );
  }
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
        Align(
          alignment: Alignment.topCenter,
          child: Padding(
            padding: EdgeInsets.only(top: 0),
            child: RichText(
              text: TextSpan(
                style: TextStyle(
                    color: primary, fontSize: 45, fontWeight: FontWeight.w200),
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
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
              topLeft: Radius.circular(120),
            )),
            height: MediaQuery.of(context).size.height * 0.8,
            child: Center(
              child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          child: Column(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.9,
                                padding: EdgeInsets.all(10),
                                child: Center(
                                  child: Text(
                                    'Phone Verification\n(${widget.phone})',
                                    style: TextStyle(
                                      fontSize: 32,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 30.0),
                              PinPut(
                                fieldsCount: 6,
                                onSubmit: (String pin) => verifyOTP(pin),
                                focusNode: _pinPutFocusNode,
                                controller: _pinPutController,
                                submittedFieldDecoration:
                                    _pinPutDecoration.copyWith(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                selectedFieldDecoration: _pinPutDecoration,
                                followingFieldDecoration:
                                    _pinPutDecoration.copyWith(
                                  borderRadius: BorderRadius.circular(5.0),
                                  border: Border.all(
                                    color: primaryDark.withOpacity(.5),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 30.0),
                              const Divider(),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  FlatButton(
                                    onPressed: () =>
                                        _pinPutFocusNode.requestFocus(),
                                    child: const Text('Focus'),
                                  ),
                                  FlatButton(
                                    onPressed: () => _pinPutFocusNode.unfocus(),
                                    child: const Text('Unfocus'),
                                  ),
                                  FlatButton(
                                    onPressed: () =>
                                        _pinPutController.text = '',
                                    child: const Text('Clear All'),
                                  ),
                                ],
                              ),
                              SizedBox(height: 35.0),
                              ClickableText(
                                text1: 'Did Not Get Code ?',
                                text2: 'Resend',
                                press: () {
                                  Navigator.pop(context);
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ]),
    );
  }

  verifyOTP(String pin) async {
    try {
      await FirebaseAuth.instance
          .signInWithCredential(PhoneAuthProvider.credential(
          verificationId:widget.verificationID, smsCode: pin)).then((value)async{
            if(value!=null){
              await showToast(context, fToast, Icons.check, primaryDark,
                  "Telephone number verified");
              bool userFound=false;
              FirebaseFirestore firebaseFirestore= FirebaseFirestore.instance;
              firebaseFirestore.collection("Users").get().then((querySnapshot) {
                querySnapshot.docs.forEach((element) {
                  if(element.id==value.user.uid){
                    userFound=true;

                  }

                });
                if(userFound){
                 // await showSnackBar("Log in successful...", _scaffoldKey.currentState);
                  sendToPage(context, HomePage(initPaage: BottomButtons.Home,));
                }else{
                  newUserDialog();
                }
              });


              // if(data==null){
              //   newUserDialog();
              // }else{
              //
              // }
                //sendToPage(context, UserForms(widget.phone));
            }
      });


    } on FirebaseAuthException catch (e) {
      await showSnackBar(e.message, _scaffoldKey.currentState);

    } catch (e) {
      await showSnackBar(e.toString(), _scaffoldKey.currentState);
    }

  }

  newUserDialog() async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return CustomDialogBox(
            title: 'Sign Up',
            descriptions: 'The Phone Number Entered do not Exist..Complete Registration to Create New Account.',
            btn1Text: 'Cancel',
            btn2Text: 'Register',
            img: 'assets/images/confirm.png',
            btn1Press: () {
              Navigator.pop(context);
            },
            btn2Press: () async {
             // await FirebaseAuth.instance.signOut();
             setState(() {
               sendToPage(context,UserForms(widget.phone));
             });
            },
          );
        }) ??
        false;
  }
}

