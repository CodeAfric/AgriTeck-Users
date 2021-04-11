import 'package:agriteck_user/api/api_repository.dart';
import 'package:agriteck_user/pojo-classes/weather-model/current_weather_data.dart';
import 'package:agriteck_user/pojo-classes/weather-model/five_days_data.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import 'package:intl/intl.dart';
class WeatherServices{
  String _apiKey;
 String openWeatherMapURL = "https://api.openweathermap.org/data/2.5/weather";
  String openWeatherForFiveDays = "https://api.openweathermap.org/data/2.5/forecast";

  WeatherServices(this._apiKey);
  /// Fetch current weather based on geographical coordinates.
  /// Result is JSON.
  /// For API documentation, see: https://openweathermap.org/forecast5
  Future<dynamic> getFiveDayForecast() async {
    Position loc = await Geolocator.getCurrentPosition();
    NetworkHelper networkHelper = NetworkHelper(Uri.parse("$openWeatherForFiveDays?"
        "lat=${loc.latitude}&lon=${loc.longitude}"
        "&appid=$_apiKey&units=metric"));
    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  /// Fetch current weather based on geographical coordinates
  /// Result is JSON.
  /// For API documentation, see: https://openweathermap.org/current
  Future<dynamic> getCurrentWeather() async {
    Position loc = await Geolocator.getCurrentPosition();
    NetworkHelper networkHelper = NetworkHelper(Uri.parse("$openWeatherMapURL?"
        "lat=${loc.latitude}&lon=${loc.longitude}"
        "&appid=$_apiKey&units=metric"));
    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  String getDateTime(){
    final DateTime now = DateTime.now();
    final DateFormat formatter = DateFormat('dd MMM, yyyy - hh:mm:a');
    final String formatted = formatter.format(now);
    return formatted;
  }


  void getCurrentWeatherData({
    Function() beforSend,
    Function(CurrentWeatherData currentWeatherData) onSuccess,
    Function(dynamic error) onError,
  }) async{
    Position loc = await Geolocator.getCurrentPosition();
    final url = "$openWeatherMapURL?"
        "lat=${loc.latitude}&lon=${loc.longitude}"
        "&appid=$_apiKey&units=metric";
    //print(url);
    ApiRepository(url: '$url', payload: null).get(
        beforeSend: () => {
          if (beforSend != null)
            {
              beforSend(),
            },
        },
        onSuccess: (data) => {
          onSuccess(CurrentWeatherData.fromJson(data)),
        },
        onError: (error) => {
          if (onError != null)
            {
              print(error),
              onError(error),
            }
        });
  }

  void getFiveDaysThreeHoursForcastData({
    Function() beforSend,
    Function(List<FiveDayData> fiveDayData) onSuccess,
    Function(dynamic error) onError,
  })async {
    Position loc = await Geolocator.getCurrentPosition();
    final url = "$openWeatherMapURL?"
        "lat=${loc.latitude}&lon=${loc.longitude}"
        "&appid=$_apiKey&units=metric";
    print(url);
    ApiRepository(url: '$url', payload: null).get(
        beforeSend: () => {},
        onSuccess: (data) => {
          onSuccess((data['list'] as List)
              ?.map((t) => FiveDayData.fromJson(t))
              ?.toList() ??
              List.empty()),
        },
        onError: (error) => {
          print(error),
          onError(error),
        });
  }

}

class NetworkHelper {
  NetworkHelper(this.url);

  final url;
  Future<dynamic> getData() async {
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      String data = response.body;

      return jsonDecode(data);
    } else {
      print(response.statusCode);
    }
  }


}