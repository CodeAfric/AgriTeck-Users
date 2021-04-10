import 'package:agriteck_user/application-pages/authentication-screens/welcome-screen.dart';
import 'package:agriteck_user/common-functions/helper-functions.dart';
import 'package:agriteck_user/commonly-used-widget/clickable-text.dart';
import 'package:agriteck_user/commonly-used-widget/dailog-box.dart';
import 'package:agriteck_user/commonly-used-widget/please-wait-dailog.dart';
import 'package:agriteck_user/commonly-used-widget/shape-painter.dart';
import 'package:agriteck_user/services/sharedPrefs.dart';
import 'package:agriteck_user/styles/app-colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pinput/pin_put/pin_put.dart';
import '../../main-page.dart';
import 'farmer-login/registration-pages.dart';

class OTPScreen extends StatefulWidget {
  String verificationID, phone;

  OTPScreen(this.verificationID, this.phone);

  @override
  _OTPScreenState createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  final GlobalKey<State> _keyLoader = new GlobalKey<State>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  bool isLoading = false;
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
            painter: ShapePainter(), //image-like background
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
                                  TextButton(
                                    onPressed: () =>
                                        _pinPutFocusNode.requestFocus(),
                                    child: const Text('Focus'),
                                  ),
                                  TextButton(
                                    onPressed: () => _pinPutFocusNode.unfocus(),
                                    child: const Text('Unfocus'),
                                  ),
                                  TextButton(
                                    onPressed: () =>
                                        _pinPutController.text = '',
                                    child: const Text('Clear All'),
                                  ),
                                ],
                              ),
                              SizedBox(height: 35.0),
                              ClickableText(
                                //this is a custom text widget with onPress feature
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

  //with this function, we verify the token sent to the user phone
  verifyOTP(String pin) async {
    Dialogs.showLoadingDialog(context, _keyLoader); //invoking verification
    try {
      // Dialogs.showLoadingDialog(context, _keyLoader);//invoking login
      await FirebaseAuth.instance
          .signInWithCredential(PhoneAuthProvider.credential(
              verificationId: widget.verificationID, smsCode: pin))
          .then((value) async {
        if (value != null) {
          //After the telephone number verified successfully
          //we chack if the user is a new farmer or an old farmer
          await showToast(context, fToast, Icons.check, primaryDark,
              "Telephone number verified");
          bool userFound = false;
          FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
          //here we loop through all the users in our system to check if the just verified number exist
          var userType = await SharedPrefs.getUserType();

          firebaseFirestore
              .collection("$userType")
              .doc(value.user.uid)
              .get()
              .then((querySnapshot) async {
            var query = querySnapshot.data();
            print("QUERIED DATA: $query");
            // if (query.containsKey(''))
            // querySnapshot.docs.forEach((element) {
            //   if (element.id == value.user.uid) {
            //     userFound =
            //         true; //so if the user exist, we set the bool variable to true
            //   }
            // });
            if (userFound) {
              //so if the user found is true
              await SharedPrefs.setUserID(value.user.uid);
              await SharedPrefs.setUserName(value.user.displayName);
              await SharedPrefs.setUserPhone(value.user.phoneNumber);

              await showSnackBar(
                  "Log in successful...", _scaffoldKey.currentState);
              sendToPage(
                  context,
                  MainPage(
                    initPaage: BottomButtons.Home,
                  ));
            } else {
              //id the user do not exist, the we send the user to the registration page to fill the forms
              newUserDialog();
            }
          });
        }
      });
    } on FirebaseAuthException catch (e) {
      await showSnackBar(e.message, _scaffoldKey.currentState);
    } catch (e) {
      await showSnackBar(e.toString(), _scaffoldKey.currentState);
    }
    Navigator.of(_keyLoader.currentContext, rootNavigator: true).pop(); //clo
  }

//here we first show a dialog to the user, making him/her aware the number used is not registered
  newUserDialog() async {
    return showDialog(
            context: context,
            builder: (BuildContext context) {
              return CustomDialogBox(
                title: 'Sign Up',
                descriptions:
                    'The Phone Number Entered do not Exist..Complete Registration to Create New Account.',
                btn1Text: 'Cancel',
                btn2Text: 'Register',
                img: 'assets/images/confirm.png',
                btn1Press: () async {
                  //if the user cancel and refuse to fill the form, we sign the user out and go back to the welcome page
                  await FirebaseAuth.instance.signOut(); //sign user out
                  sendToPage(context, WelcomeScreen()); //send to welcome page
                  Navigator.pop(context);
                },
                btn2Press: () async {
                  setState(() {
                    //if the user accepts, then we send the user to the registration form
                    sendToPage(context, FarmerRegistrationForm(widget.phone));
                  });
                },
              );
            }) ??
        false;
  }
}
