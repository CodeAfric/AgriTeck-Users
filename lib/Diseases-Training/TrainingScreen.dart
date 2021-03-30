import 'package:agriteck_user/Toast/show_toast.dart';
import 'package:agriteck_user/styles/app-colors.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';
import 'dart:async';
import 'dart:io';

class Training extends StatefulWidget {
  @override
  _TrainingState createState() => _TrainingState();
}

class _TrainingState extends State<Training> {
  File capturedImage;
  dynamic _pickImageError;
  bool _inProcess = false;

//get image
  getImage(ImageSource source) async {
    try {
      this.setState(() {
        _inProcess = true;
      });
      final PickedFile pickedFile =
          await ImagePicker().getImage(source: source); //pick image
      if (pickedFile != null) {
        //crop image after selection
        _imageCropper(pickedFile.path);
      } else {
        this.setState(() {
          _inProcess = false;
        });
        showToast(content: 'No Image Captured');
      }
    } catch (e) {
      setState(() {
        _pickImageError = e;
        print(_pickImageError.toString());
      });
    }
  }

//crop image
  Future<Null> _imageCropper(String imagePath) async {
    File capturedCroppedImageFile = await ImageCropper.cropImage(
        sourcePath: imagePath,
        androidUiSettings: AndroidUiSettings(
            toolbarTitle: 'Crop Image',
            toolbarWidgetColor: primary,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
        iosUiSettings: IOSUiSettings(
          title: 'Crop Image ',
        ));
    if (this.mounted) {
      setState(() {
        if (capturedCroppedImageFile != null) {
          if (this.mounted) {
            setState(() {
              capturedImage = capturedCroppedImageFile;
              _inProcess = false;
              showToast(content: 'Successful');
            });
          }
        } else {
          this.setState(() {
            _inProcess = false;
          });
          showToast(content: 'No Image Captured / Selected');
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: [
            SizedBox(
              height: 30.0,
            ),
            //buttons container
            Container(
              //color: primaryLight,
              margin: EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                        padding: EdgeInsets.only(left: 5),
                        child: Buttonts(
                          btnText: 'Pest and Diseases',
                          btnIcon: 'assets/icons/pest.png',
                        )),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                        padding: EdgeInsets.only(left: 5),
                        child: Buttonts(
                          btnText: 'Weather Update',
                          btnIcon: 'assets/icons/cloud.png',
                        )),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                        padding: EdgeInsets.only(left: 5),
                        child: Buttonts(
                          btnText: 'Good Farming Tips',
                          btnIcon: 'assets/icons/tips.png',
                        )),
                  ),
                ],
              ),
            ),

            //detect disease container
            Container(
              child: DiseaseCapture(
                  isLoading: _inProcess,
                  onPressed: () {
                    getImage(ImageSource.camera);
                  }),
            ),

            //weather container
            Container(
              padding: EdgeInsets.only(top: 10),
              child: Weather(
                temperature: '23.2°',
                location: 'Kumasi, Tanoso',
                date: '27/04/2021',
                weatherStatus: 'Partly cloudy throughout the day',
                onWeatherPressed: () {
                  showToast(content: 'view weather in details');
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Buttonts extends StatelessWidget {
  final String btnText;
  final String btnIcon;

  const Buttonts({Key key, this.btnText, this.btnIcon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: 90,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8), color: primaryLight),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              alignment: Alignment.topLeft,
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.white,
                  image: DecorationImage(
                      image: AssetImage(
                        btnIcon,
                      ),
                      fit: BoxFit.fill)),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              btnText,
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}

class DiseaseCapture extends StatelessWidget {
  final Function onPressed;
  final bool isLoading;
  DiseaseCapture({this.onPressed, this.isLoading});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Card(
      elevation: 3,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(10),
            alignment: Alignment.centerLeft,
            child: Text(
              'Detect Disease'.toUpperCase(),
              style: TextStyle(
                  fontSize: 20, color: primary, fontWeight: FontWeight.w400),
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 100,
                      width: 120,
                      child: OutlineButton(
                          borderSide: BorderSide(
                              color: primary.withOpacity(0.8), width: 2.0),
                          onPressed: () {},
                          child: ListTile(
                            title: Icon(
                              Icons.camera_alt_outlined,
                              size: 45,
                              color: primaryDark,
                            ),
                            subtitle: Text(
                              'Open Camera',
                              style:
                                  TextStyle(fontSize: 12, color: primaryLight),
                            ),
                          )),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 100,
                      width: 120,
                      child: OutlineButton(
                          borderSide: BorderSide(
                              color: primary.withOpacity(0.8), width: 2.0),
                          onPressed: () {},
                          child: ListTile(
                            title: Image.asset(
                              'assets/icons/farm.png',
                              height: 40,
                              width: 40,
                              color: primaryDark,
                            ),
                            subtitle: Text(
                              'Point to Disease',
                              style:
                                  TextStyle(fontSize: 12, color: primaryLight),
                            ),
                          )),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Container(
                      height: 100,
                      width: 120,
                      child: OutlineButton(
                          borderSide: BorderSide(
                              color: primary.withOpacity(0.8), width: 2.0),
                          onPressed: () {},
                          child: ListTile(
                            title: Icon(
                              Icons.center_focus_strong,
                              size: 45,
                              color: primaryDark,
                            ),
                            subtitle: Text(
                              'Focus and Capture',
                              style:
                                  TextStyle(fontSize: 12, color: primaryLight),
                            ),
                          )),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              alignment: Alignment.center,
              width: size.width * 0.80,
              height: 40,
              margin: EdgeInsets.only(left: 20),
              // ignore: deprecated_member_use
              child: RaisedButton(
                onPressed: onPressed,
                color: primary,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25)),
                child: (isLoading)
                    ? Text('Loading...',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white))
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            child: Icon(
                              Icons.camera_alt,
                              color: Colors.white,
                            ),
                          ),
                          Container(
                              padding: EdgeInsets.only(left: 10),
                              child: Text(
                                'Point and Capture',
                                style: TextStyle(color: Colors.white),
                              )),
                        ],
                      ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class Weather extends StatelessWidget {
  final String location;
  final String temperature;
  final String date;
  final String weatherStatus;
  final Function onWeatherPressed;

  const Weather(
      {Key key,
      this.location,
      this.temperature,
      this.date,
      this.weatherStatus,
      this.onWeatherPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: InkWell(
        onTap: onWeatherPressed,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            temperature,
                            style: TextStyle(
                                fontSize: 25,
                                color: Colors.black54,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            location,
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.black45,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            date,
                            style: TextStyle(
                                fontSize: 14,
                                color: Colors.black38,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    height: 100,
                    width: 120,
                    padding: EdgeInsets.all(15),
                    child: Image.asset(
                      'assets/icons/weather.jpg',
                      fit: BoxFit.fill,
                    ),
                  ),
                )
              ],
            ),
            Divider(
              color: primaryLight,
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.all(10),
              child: Text(
                weatherStatus,
                style: TextStyle(fontSize: 16, color: Colors.black45),
              ),
            )
          ],
        ),
      ),
    );
  }
}
