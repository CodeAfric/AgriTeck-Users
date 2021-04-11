import 'package:agriteck_user/commonly-used-widget/custom_app_bar.dart';
import 'package:agriteck_user/pojo-classes/weather-model/current_weather_data.dart';
import 'package:agriteck_user/pojo-classes/weather-model/five_days_data.dart';
import 'package:agriteck_user/services/weather-services.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class WeatherDetails extends StatefulWidget {
  final List data;

  const WeatherDetails({Key key, this.data}) : super(key: key);

  @override
  _WeatherDetailsState createState() => _WeatherDetailsState();
}

class _WeatherDetailsState extends State<WeatherDetails>  with SingleTickerProviderStateMixin  {
  CurrentWeatherData currentWeatherData = CurrentWeatherData();
  List<CurrentWeatherData> dataList = [];
  List<FiveDayData> fiveDaysData = [];
  WeatherServices weather =
  new WeatherServices("9be7d9f30e6275394f7aa27d8093dd5f");


  @override
  void initState() {
    super.initState();
    getCurrentWeatherData();
    getFiveDaysData();
  }

  void getCurrentWeatherData() {
    weather.getCurrentWeatherData(
        onSuccess: (data) {
          currentWeatherData = data;
        },
        onError: (error) => {
          print(error),
        });
  }


  void getFiveDaysData() {
    weather.getFiveDaysThreeHoursForcastData(
        onSuccess: (data) {
          fiveDaysData = data;
        }, onError: (error) {
      print(error);
    });
  }

@override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: CustomAppBar(
        title: 'Weather Details',
        leadingIcon: Icons.arrow_back_outlined,
        onIconPress: (){
          setState(() {
            Navigator.pop(context);
          });
        },
      ),
      body:
       Column(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/cloud-in-blue-sky.jpg'),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25),
                  ),
                ),
                child: Stack(
                  children: <Widget>[

                    Align(
                      alignment: Alignment(0.0, 1.0),
                      child: SizedBox(
                        height: 10,
                        width: 10,
                        child: OverflowBox(
                          minWidth: 0.0,
                          maxWidth: MediaQuery.of(context).size.width,
                          minHeight: 0.0,
                          maxHeight: (MediaQuery.of(context).size.height *.26),
                          child: Stack(
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 15),
                                width: double.infinity,
                                height: double.infinity,
                                child: Card(
                                  color: Colors.white,
                                  elevation: 5,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Container(
                                        padding: EdgeInsets.only(
                                            top: 5, left: 20, right: 20),
                                        child: Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Center(
                                              child: Text(
                                                (currentWeatherData !=
                                                    null)
                                                    ? '${currentWeatherData.name}'
                                                    .toUpperCase()
                                                    : '',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .caption
                                                    .copyWith(
                                                  color: Colors.black45,
                                                  fontSize: 24,
                                                  fontWeight:
                                                  FontWeight.bold,
                                                  fontFamily:
                                                  'flutterfonts',
                                                ),
                                              ),
                                            ),
                                            Center(
                                              child: Text(
                                                DateFormat()
                                                    .add_MMMMEEEEd()
                                                    .format(DateTime.now()),
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .caption
                                                    .copyWith(
                                                  color: Colors.black45,
                                                  fontSize: 16,
                                                  fontFamily:
                                                  'flutterfonts',
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Divider(),
                                      Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Container(
                                            padding: EdgeInsets.only(left: 50),
                                            child: Column(
                                              children: <Widget>[
                                                Text(
                                                  (currentWeatherData
                                                      .weather !=
                                                      null)
                                                      ? '${currentWeatherData.weather[0].description}'
                                                      : '',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .caption
                                                      .copyWith(
                                                    color: Colors.black45,
                                                    fontSize: 22,
                                                    fontFamily:
                                                    'flutterfonts',
                                                  ),
                                                ),
                                                SizedBox(height: 10),
                                                Text(
                                                  (currentWeatherData
                                                      .main !=
                                                      null)
                                                      ? '${(currentWeatherData.main.temp).round().toString()}\u2103'
                                                      : '',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .headline2
                                                      .copyWith(
                                                      color: Colors.black45,
                                                      fontFamily:
                                                      'flutterfonts'),
                                                ),
                                                Text(
                                                  (currentWeatherData
                                                      .main !=
                                                      null)
                                                      ? 'min: ${(currentWeatherData.main.tempMin).round().toString()}\u2103 / max: ${(currentWeatherData.main.tempMax).round().toString()}\u2103'
                                                      : '',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .caption
                                                      .copyWith(
                                                    color: Colors.black45,
                                                    fontSize: 14,
                                                    fontWeight:
                                                    FontWeight.bold,
                                                    fontFamily:
                                                    'flutterfonts',
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            padding: EdgeInsets.only(right: 20),
                                            child: Column(
                                              mainAxisAlignment:
                                              MainAxisAlignment.center,
                                              children: <Widget>[
                                                Container(
                                                  width: 120,
                                                  height: 120,
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                      image: AssetImage(
                                                          'assets/images/icon-01.jpg'),
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  child: Text(
                                                    (currentWeatherData
                                                        .wind !=
                                                        null)
                                                        ? 'wind ${currentWeatherData.wind.speed} m/s'
                                                        : '',
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .caption
                                                        .copyWith(
                                                      color: Colors.black45,
                                                      fontSize: 14,
                                                      fontWeight:
                                                      FontWeight.bold,
                                                      fontFamily:
                                                      'flutterfonts',
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Stack(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Container(

                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              height: 150,
                              child: ListView.separated(
                                physics: BouncingScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                separatorBuilder: (context, index) =>
                                    VerticalDivider(
                                      color: Colors.transparent,
                                      width: 5,
                                    ),
                                itemCount: dataList.length,
                                itemBuilder: (context, index) {
                                  CurrentWeatherData data;
                                  (dataList.length > 0)
                                      ? data = dataList[index]
                                      : data = null;
                                  return Container(
                                    width: 140,
                                    height: 150,
                                    child: Card(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: Container(
                                        child: Column(
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          children: <Widget>[
                                            Text(
                                              (data != null)
                                                  ? '${data.name}'
                                                  : '',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .caption
                                                  .copyWith(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black45,
                                                fontFamily: 'flutterfonts',
                                              ),
                                            ),
                                            Text(
                                              (data != null)
                                                  ? '${(data.main.temp - 273.15).round().toString()}\u2103'
                                                  : '',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .caption
                                                  .copyWith(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black45,
                                                fontFamily: 'flutterfonts',
                                              ),
                                            ),

                                            Text(
                                              (data != null)
                                                  ? '${data.weather[0].description}'
                                                  : '',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .caption
                                                  .copyWith(
                                                color: Colors.black45,
                                                fontFamily: 'flutterfonts',
                                                fontSize: 14,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 10),
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    'forcast next 5 days'.toUpperCase(),
                                    style: Theme.of(context)
                                        .textTheme
                                        .caption
                                        .copyWith(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black45,
                                    ),
                                  ),
                                  Icon(
                                    Icons.next_plan_outlined,
                                    color: Colors.black45,
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: 240,
                              child: Card(
                                elevation: 5,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: SfCartesianChart(
                                  primaryXAxis: CategoryAxis(),
                                  series: <ChartSeries<FiveDayData, String>>[
                                    SplineSeries<FiveDayData, String>(
                                      dataSource: fiveDaysData,
                                      xValueMapper: (FiveDayData f, _) =>
                                      f.dateTime,
                                      yValueMapper: (FiveDayData f, _) =>
                                      f.temp,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
  }
}
