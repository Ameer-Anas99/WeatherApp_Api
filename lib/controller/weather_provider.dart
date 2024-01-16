import 'package:flutter/material.dart';
import 'package:weather_app/model/weather_model.dart';
import 'package:weather_app/services/weather_app_client.dart';

class WeatherProvider extends ChangeNotifier {
  TextEditingController searchController = TextEditingController();
  WeatherProvider() {
    getData("calicut");
  }
  Weather? data;

  Future<Weather?> getData(String location) async {
    data = await WeatherApiClient().getCurrentWeather(location);

    notifyListeners();
    return data;
  }
}
