import 'package:agriteck_user/common-functions/helper-functions.dart';
import 'package:agriteck_user/commonly-used-widget/detect-disease.dart';
import 'package:agriteck_user/home-page/weather-details.dart';
import 'package:agriteck_user/pojo-classes/tips-data.dart';
import 'package:agriteck_user/services/sharedPrefs.dart';
import 'package:agriteck_user/services/weather-services.dart';
import 'package:agriteck_user/styles/app-colors.dart';
import 'package:agriteck_user/styles/app-styles.dart';
import 'package:async_loader/async_loader.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../constant.dart';

class HomeScreen extends StatefulWidget {
  final Tips tips;
  HomeScreen({this.tips});
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<AsyncLoaderState> _asyncLoaderState =
      new GlobalKey<AsyncLoaderState>();
  Map<String, dynamic> weatherJSON, waetherForFivedays;
  String _currentDate;
  var _userLocation;
  List weatherData;
  getWeatherUpdate() async {
    WeatherServices weather =
        new WeatherServices("9be7d9f30e6275394f7aa27d8093dd5f");
    weatherJSON = await weather.getCurrentWeather();
    waetherForFivedays = await weather.getFiveDayForecast();
    _currentDate = weather.getDateTime();
    _userLocation = await SharedPrefs.getPositionInfo();
    print(
        '++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++');
    weatherData = waetherForFivedays['list'];
    print('$weatherJSON');
    // weatherData.forEach((element) {
    //   print('$element');
    //   print(
    //       '++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++');
    // });
  }

  @override
  void initState() {
    // getWeatherUpdate();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      height: screenHeight,
      width: screenWidth,
      child: CustomScrollView(
        physics: ClampingScrollPhysics(),
        slivers: <Widget>[
          widget.tips != null
              ? _tipOfTheDay(screenHeight, widget.tips)
              : SliverToBoxAdapter(),
          _cureYouPlant(screenHeight, screenWidth),
          _weatherCard(screenHeight),
        ],
      ),
    );
  }

  SliverToBoxAdapter _tipOfTheDay(double screenHeight, Tips tips) {
    return SliverToBoxAdapter(
      child: Container(
        padding: const EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: primary,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(40.0),
            bottomRight: Radius.circular(40.0),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                Icon(
                  FontAwesomeIcons.lightbulb,
                  color: Colors.yellow,
                ),
                Text(
                  'Tip of the Day',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Spacer(),
                Icon(
                  FontAwesomeIcons.calendarDay,
                  size: 20,
                  color: Colors.black45,
                ),
                Text(
                  tips.tipDate,
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: Colors.black45),
                )
              ],
            ),
            SizedBox(height: screenHeight * 0.03),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  tips.tipTitle,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 22.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: screenHeight * 0.01),
                Text(
                  tips.tipDescriptions,
                  maxLines: 3,
                  overflow: TextOverflow.clip,
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 15.0,
                  ),
                ),
                SizedBox(height: screenHeight * 0.03),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    FlatButton.icon(
                      padding: const EdgeInsets.symmetric(
                        vertical: 10.0,
                        horizontal: 20.0,
                      ),
                      onPressed: () {
                        //ToDo here we open tips details dialog
                      },
                      color: primaryDark,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      icon: const Icon(
                        FontAwesomeIcons.readme,
                        color: Colors.white,
                      ),
                      label: Text(
                        'Read More',
                        style: Styles.buttonTextStyle,
                      ),
                      textColor: Colors.white,
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  SliverToBoxAdapter _cureYouPlant(double screenHeight, double screenWidth) {
    return SliverToBoxAdapter(
        child: Container(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Cure Your Plant',
            style: const TextStyle(
              fontSize: 22.0,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: procedure
                .map((e) => Column(
                      children: <Widget>[
                        CircleAvatar(
                          radius: screenWidth * 0.1,
                          backgroundImage: AssetImage(
                            e.keys.first,
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.015),
                        Text(
                          e.values.first,
                          style: const TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w500,
                          ),
                          textAlign: TextAlign.center,
                        )
                      ],
                    ))
                .toList(),
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FlatButton.icon(
                padding: const EdgeInsets.symmetric(
                  vertical: 10.0,
                  horizontal: 60.0,
                ),
                onPressed: () {
                  detectDisease(context);
                },
                color: primaryDark,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                icon: const Icon(
                  Icons.photo_camera,
                  color: Colors.white,
                ),
                label: Text(
                  'Capture Plant',
                  style: Styles.buttonTextStyle,
                ),
                textColor: Colors.white,
              ),
            ],
          )
        ],
      ),
    ));
  }

  SliverToBoxAdapter _weatherCard(double screenHeight) {
    var _asyncLoader = new AsyncLoader(
      key: _asyncLoaderState,
      initState: () async => await getWeatherUpdate(),
      renderLoad: () => Container(
          width: 100,
          height: 100,
          child: Center(child: new CircularProgressIndicator())),
      renderError: ([error]) =>
          new Text('Sorry, there was an error loading Weather'),
      renderSuccess: ({data}) => GestureDetector(
        onTap: () {
          sendToPage(
              context,
              WeatherDetails(
                data: weatherData,
              ));
        },
        child: Card(
          margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          elevation: 5,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0),
                    ),
                  ),
                  width: double.infinity,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        '${weatherJSON['name']} - ${_userLocation['locationName']}',
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.black45,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        _currentDate,
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.black45,
                            fontWeight: FontWeight.w300),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                    ],
                  )),
              Padding(
                padding: const EdgeInsets.only(
                    left: 12.0, right: 12, top: 8, bottom: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '${weatherJSON['weather'][0]['main']} - ${weatherJSON['weather'][0]['description']}',
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.black45,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        RichText(
                          text: TextSpan(children: [
                            TextSpan(
                                text:
                                    '${weatherJSON['main']['temp'].toStringAsFixed(0)}',
                                style: TextStyle(
                                    fontSize: 60,
                                    color: Colors.black45,
                                    fontWeight: FontWeight.bold)),
                            WidgetSpan(
                              child: Transform.translate(
                                offset: const Offset(2, -10),
                                child: Text('°C',
                                    //superscript is usually smaller in size
                                    textScaleFactor: 0.7,
                                    style: TextStyle(
                                        fontSize: 60,
                                        color: Colors.black45,
                                        fontWeight: FontWeight.bold)),
                              ),
                            ),
                            TextSpan(
                                text:
                                    '\nMin:${weatherJSON['main']['temp_min'].toStringAsFixed(0)}°C /Max:${weatherJSON['main']['temp_max'].toStringAsFixed(0)}°C ',
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.black45,
                                    fontWeight: FontWeight.w800)),
                          ]),
                        ),
                      ],
                    )),
                    Container(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/images/weather.png",
                          height: 100,
                          width: 100,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Wind: ${weatherJSON['wind']['speed'].toStringAsFixed(2)}m/s',
                          style: TextStyle(
                              fontSize: 17,
                              color: Colors.black45,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    )),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
    return SliverToBoxAdapter(child: _asyncLoader);
  }
}
