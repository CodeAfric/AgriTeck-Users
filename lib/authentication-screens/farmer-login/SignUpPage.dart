
import 'package:agriteck_user/styles/app-colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:agriteck_user/common UI/textField.dart';

class SignUp extends StatelessWidget {
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
                        child: InputTextField(
                          prefixIcon: Icon(Icons.person),
                          label: 'enter first name',
                          type: TextInputType.text,
                          isPassword: false,
                          withDecoration: true,
                        )),
                    SizedBox(height: 5.0),
                    Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: InputTextField(
                          prefixIcon: Icon(Icons.person),
                          label: 'last name',
                          isPassword: false,
                          withDecoration: true,
                          type: TextInputType.text,
                        )),
                    SizedBox(height: 5.0),
                    DatePicker(),
                    SizedBox(height: 5.0),
                    Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: InputTextField(
                          prefixIcon: Icon(Icons.lock),
                          label: 'enter password',
                          isPassword: false,
                          withDecoration: true,
                          type: TextInputType.text,
                        )),
                    SizedBox(height: 5.0),
                    Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: InputTextField(
                          prefixIcon: Icon(Icons.lock),
                          label: 'confirm password',
                          isPassword: false,
                          withDecoration: true,
                          type: TextInputType.text,
                        )),
                    SizedBox(height: 5.0),
                    InkWell(
                      onTap: () {
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

class DatePicker extends StatefulWidget {
  @override
  _DatePickerState createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  TextEditingController _pickDateController;
  String _date = 'choose date of birth';

  @override
  void initState() {
    super.initState();
    _pickDateController = TextEditingController(text: _date);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15),
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
            final date = await showDatePicker(
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
            );
            if (date != null) {
              var formatter = new DateFormat('MM/dd/yyyy');
              _pickDateController.text = formatter.format(date);
            }
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
                  color: Colors.black54,
                )),
            hintStyle: TextStyle(color: primaryLight),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0),
                borderSide: BorderSide.none),
            filled: true,
            fillColor: Colors.white54,
          ),
          style: TextStyle(color: primaryLight, fontWeight: FontWeight.w600),
          cursorColor: primary,
          controller: _pickDateController,
          readOnly: true,
        ),
      ),
    );
  }
}

