import 'dart:convert';
import 'dart:math';

import 'package:http/http.dart' as http;
import 'package:weather_app/constant/api.dart';
import 'package:weather_app/model/weather_model.dart';

class WeatherApiClient {
  Future<Weather?> getCurrentWeather(String? location) async {
    try {
      var endpoint = Uri.parse(
          "https://api.openweathermap.org/data/2.5/weather?q=$location&appid=$apikey&units=metric");
      var response = await http.get(endpoint);
      if (response.statusCode == 200) {
        var body = jsonDecode(response.body);
        return Weather.fromJson(body);
      } else {
        print("Error: ${response.statusCode}");
        return null;
      }
    } catch (e) {
      print("Exception: $e");
      return null;
    }
  }
}
