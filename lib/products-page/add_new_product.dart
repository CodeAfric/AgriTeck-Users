import 'dart:convert';
import 'dart:io';
import 'package:agriteck_user/common-functions/helper-functions.dart';
import 'package:agriteck_user/commonly-used-widget/round_button.dart';
import 'package:agriteck_user/commonly-used-widget/shape-painter.dart';
import 'package:agriteck_user/commonly-used-widget/textField.dart';
import 'package:agriteck_user/pojo-classes/farmers-data.dart';
import 'package:agriteck_user/pojo-classes/farms-data.dart';
import 'package:agriteck_user/pojo-classes/product-data.dart';
import 'package:agriteck_user/products-page/products_page.dart';
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

class AddNewProduct extends StatefulWidget {
  @override
  _AddNewProductState createState() => _AddNewProductState();
}

class _AddNewProductState extends State<AddNewProduct> {
  String farmId, description;
  List<Map<String, dynamic>> farmState;

  String productName, productDesc, measure, timeStamp;
  int quantity;
  double price;
  File image;
  double farmSize;
  String location;
  bool isLoading = false;
  final picker = ImagePicker();
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  DateTime _dateTime;
  TextEditingController _pickDateController =
      TextEditingController(text: 'choose time');
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
          'Add New Product',
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
                        _imageChooser(),
                        SizedBox(
                          height: 20,
                        ),
                        // InputTextField(
                        //   withDecoration: true,
                        //   onSave: (value) {
                        //     setState(() {
                        //       productId = value;
                        //     });
                        //   },
                        //   type: TextInputType.text,
                        //   label: 'Product Id',
                        //   alignText: true,
                        //   validation: (value) {
                        //     if (value.isEmpty) {
                        //       return 'Please Enter Type of Crop on farm';
                        //     } else
                        //       return null;
                        //   },
                        //   isPassword: false,
                        // ),
                        SizedBox(
                          height: 20,
                        ),
                        InputTextField(
                          withDecoration: true,
                          maxLine: 1,
                          onSave: (value) {
                            setState(() {
                              productName = value;
                            });
                          },
                          type: TextInputType.text,
                          label: 'Product Name',
                          alignText: true,
                          validation: (value) {
                            if (value.isEmpty) {
                              return 'Please Enter Product Name';
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
                              productDesc = value;
                            });
                          },
                          type: TextInputType.text,
                          label: 'Product Descriptions',
                          alignText: true,
                          validation: (value) {
                            if (value.isEmpty) {
                              return 'Please Enter Product Description';
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
                          onSave: (value) {
                            setState(() {
                              measure = value;
                            });
                          },
                          type: TextInputType.text,
                          label: 'Measure',
                          alignText: true,
                          validation: (value) {
                            if (value.isEmpty) {
                              return 'Please Enter Measure';
                            } else
                              return null;
                          },
                          isPassword: false,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        // InputTextField(
                        //   withDecoration: true,
                        //   onSave: (value) {
                        //     setState(() {
                        //       timeStamp = value;
                        //     });
                        //   },
                        //   type: TextInputType.text,
                        //   label: 'TimeStamp',
                        //   validation: (value) {
                        //     if (value.isEmpty) {
                        //       return 'Please Enter Time';
                        //     } else
                        //       return null;
                        //   },
                        //   isPassword: false,
                        // ),
                        getDate(),
                        SizedBox(height: 20.0),
                        InputTextField(
                          withDecoration: true,
                          onSave: (value) {
                            setState(() {
                              try {
                                quantity = int.parse(value);
                              } catch (e) {}
                            });
                          },
                          type: TextInputType.number,
                          label: 'Quantity',
                          validation: (value) {
                            if (value.isEmpty) {
                              return 'Please Enter the Quantity';
                            } else
                              return null;
                          },
                          isPassword: false,
                        ),
                        SizedBox(height: 20),
                        InputTextField(
                          withDecoration: true,
                          onSave: (value) {
                            setState(() {
                              try {
                                price = double.parse(value);
                              } catch (e) {}
                            });
                          },
                          type: TextInputType.number,
                          label: 'Price',
                          validation: (value) {
                            if (value.isEmpty) {
                              return 'Please Enter the Price';
                            } else
                              return null;
                          },
                          isPassword: false,
                        ),
                        SizedBox(height: 30.0),
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

  Widget _imageChooser() {
    return Center(
      child: GestureDetector(
        onTap: () {
          _showPicker(context);
        },
        child: Container(
          child: image != null
              ? Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: Image.file(
                        image,
                        width: 150,
                        height: 100,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 8.0, right: 8, bottom: 0),
                      child: Text(
                        'Change Image',
                        style: TextStyle(
                            color: primary,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                )
              : Container(
                  decoration: BoxDecoration(
                      color: Colors.white24,
                      borderRadius: BorderRadius.circular(50)),
                  width: MediaQuery.of(context).size.width,
                  height: 100,
                  child: Stack(children: <Widget>[
                    Align(
                      alignment: Alignment.center,
                      child: Icon(
                        Icons.camera_alt,
                        color: Colors.black38,
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 8.0, right: 8, bottom: 25),
                        child: Text(
                          'Upload Image',
                          style: TextStyle(
                              color: primary,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    )
                  ]),
                ),
        ),
      ),
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
                _dateTime = value;
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

  getImageFromGallery() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      image = File(pickedFile.path);
    } else {
      print('No image selected.');
    }
  }

  getImageFromCamera() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);
    if (pickedFile != null) {
      image = File(pickedFile.path);
    } else {
      await showSnackBar('No image selected.', _scaffoldKey.currentState);
    }
  }

  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: new Wrap(
                children: <Widget>[
                  new ListTile(
                      leading: new Icon(Icons.photo_library),
                      title: new Text('Photo Library'),
                      onTap: () {
                        setState(() {
                          getImageFromGallery();
                          Navigator.of(context).pop();
                        });
                      }),
                  new ListTile(
                    leading: new Icon(Icons.photo_camera),
                    title: new Text('Camera'),
                    onTap: () {
                      setState(() {
                        getImageFromCamera();
                        Navigator.of(context).pop();
                      });
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

  saveData() async {
    if (_formKey.currentState.validate()) {
      if (mounted) {
        setState(() {
          isLoading = true;
        });
      }

      if (_dateTime == null) {
        await showSnackBar("Please select date", _scaffoldKey.currentState);
      } else {
        _formKey.currentState.save();
        try {
          String userId = await SharedPrefs.getUserID();
          String userData = await SharedPrefs.getUserData();
          Map farmer = json.decode(userData);
          // String user=await SharedPrefs.getUserID();
          User user = FirebaseAuth.instance.currentUser;
          if (user != null) {
            String photoUrl;
            if (image != null) {
              photoUrl = await UserServices.uploadFarmPic(image, user.uid);
            }
            Product product = new Product(
                productName: productName,
                productDescription: productDesc,
                measure: measure,
                timeStamp: _dateTime.toString(),
                quantity: quantity,
                price: price,
                farmer: {
                  'name': farmer['name'],
                  'telephone': farmer['telephone'],
                  'location': farmer['location'],
                  'specialized': farmer['specialized'],
                  'farmerId': userId,
                },
                images: [
                  photoUrl
                ]);
            var snapshot = await UserServices.saveProduct(product);
            print(snapshot);
            Map<String, dynamic> update = {'productId': snapshot.id};
            await DatabaseServices.updateDocument(
                'Products', snapshot.id, update);
            isLoading = false;
            await showToast(context, fToast, Icons.check, primaryDark,
                "Product data Saved successfully");
            // sendToPage(context, ProductFullScreen());
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
    }
  }
}
