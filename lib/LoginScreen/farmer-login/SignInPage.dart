import 'package:agriteck_user/LoginScreen/farmer-login/SignUpPage.dart';
import 'package:agriteck_user/styles/app-colors.dart';
import 'package:flutter/material.dart';
import 'package:agriteck_user/common UI/textField.dart';

class SignIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: primaryLight.withOpacity(0.2),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              width: width,
              height: height,
              //padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(color: Colors.white),
              child: Column(
                children: <Widget>[
                  Container(
                    width: width,
                    height: 250,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(100),
                      ),
                      gradient: LinearGradient(
                          colors: [primaryLight, primaryLight, primaryLight],
                          end: Alignment.bottomCenter,
                          begin: Alignment.topCenter),
                    ),
                    child: Center(
                      child: Column(
                        children: [
                          Container(
                            color: Colors.transparent,
                            height: 50,
                            width: 50,
                            child: Image.asset(
                              'assets/icons/seedling.png',
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            'Log In Here',
                            style: TextStyle(color: Colors.white, fontSize: 24),
                          )
                        ],
                      ),
                    ),
                  ),

                  SizedBox(height: 20.0),
                  Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: InputTextField(
                        prefixIcon: Icon(Icons.phone),
                        label: 'enter phone number',
                        type: TextInputType.number,
                        isPassword: false,
                        withDecoration: true,
                      )),
                  SizedBox(height: 10.0),
                  Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: InputTextField(
                        prefixIcon: Icon(Icons.lock),
                        label: 'enter password',
                        isPassword: true,
                        withDecoration: true,
                        type: TextInputType.text,
                        suffixIcon: Icon(Icons.remove_red_eye),
                      )),
                  SizedBox(height: 30.0),
                  Container(
                    height: 60,
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: primary,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey,
                              offset: Offset(0, 03),
                              blurRadius: 10)
                        ]),
                    child: Text(
                      "Login".toUpperCase(),
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      FlatButton(
                        textColor: primaryLight,
                        child: Text("Create Account".toUpperCase()),
                        onPressed: () {
                          NavigateToSignUp(context);
                        },
                      ),
                      Container(
                        color: Colors.white54,
                        width: 2.0,
                        height: 20.0,
                      ),
                      FlatButton(
                        textColor: primaryLight,
                        child: Text("Forgot Password".toUpperCase()),
                        onPressed: () {},
                      ),
                    ],
                  ),
                  //SizedBox(height: 10.0),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Future NavigateToSignUp(context) async {
  Navigator.push(context, MaterialPageRoute(builder: (context) => SignUp()));
}
