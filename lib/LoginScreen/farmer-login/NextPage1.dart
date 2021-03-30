import 'package:agriteck_user/common%20UI/textField.dart';
import 'package:agriteck_user/styles/app-colors.dart';
import 'package:flutter/material.dart';

import 'Nextpage2.dart';

class ContinueSignUp extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: primaryLight.withOpacity(0.2),
      body: SafeArea(
        child: SingleChildScrollView(
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
                      height: 200,
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
                        child: Form(
                          key: _formKey,
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
                                'Sign Up Here',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 24),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: 5.0),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: GenderSelect(),
                    ),
                    SizedBox(height: 5.0),
                    Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: InputTextField(
                          prefixIcon: Icon(Icons.place),
                          label: 'your location',
                          isPassword: false,
                          withDecoration: true,
                          type: TextInputType.text,
                        )),
                    SizedBox(height: 5.0),
                    Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: InputTextField(
                          prefixIcon: Icon(Icons.format_list_numbered),
                          label: 'enter number of farms',
                          isPassword: false,
                          withDecoration: true,
                          type: TextInputType.number,
                        )),
                    SizedBox(height: 5.0),
                    Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: InputTextField(
                          prefixIcon: Icon(Icons.format_list_numbered),
                          label: 'enter farm size',
                          isPassword: false,
                          withDecoration: true,
                          type: TextInputType.text,
                        )),

                    SizedBox(height: 5.0),
                    InkWell(
                      onTap: () {
                        NavigateToNextPage(context);
                      },
                      child: Container(
                        height: 55,
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
                          "Next".toUpperCase(),
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ),
                    ),
                    //SizedBox(height: 10.0),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class GenderSelect extends StatefulWidget {
  @override
  _GenderSelectState createState() => _GenderSelectState();
}

class _GenderSelectState extends State<GenderSelect> {
  var selectedValue = 'Male';
  onChanged(value) {
    setState(() => selectedValue = value);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
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
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Radio(
                      value: 'Male',
                      activeColor: primary,
                      groupValue: selectedValue,
                      onChanged: (value) => onChanged(value)),
                  Text(
                    'Male',
                    style: TextStyle(color: primary),
                  )
                ],
              ),
              Row(
                children: [
                  Radio(
                      value: 'Female',
                      activeColor: primary,
                      groupValue: selectedValue,
                      onChanged: (value) => onChanged(value)),
                  Text(
                    'Female',
                    style: TextStyle(color: primary),
                  )
                ],
              ),
              Row(
                children: [
                  Radio(
                      value: 'Others',
                      activeColor: primary,
                      groupValue: selectedValue,
                      onChanged: (value) => onChanged(value)),
                  Text(
                    'Others',
                    style: TextStyle(color: primary),
                  )
                ],
              ),
            ],
          )),
    );
  }
}

Future NavigateToNextPage(context) async {
  Navigator.push(
      context, MaterialPageRoute(builder: (context) => SignUpPage2()));
}
