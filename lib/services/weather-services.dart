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