class Weather {
  String? cityName;
  double? temp;
  double? wind;
  int? humidity;
  double? feel_like;
  int? pressure;

  Weather(
      {this.cityName,
      this.temp,
      this.wind,
      this.humidity,
      this.feel_like,
      this.pressure});

  Weather.fromJson(Map<String, dynamic> json) {
    cityName = json["name"];
    temp = json["main"]["temp"];
    wind = json["wind"]["speed"];
    pressure = json["main"]["pressure"];
    humidity = json["main"]["huminity"];
    feel_like = json["main"]["feel_like"];
  }
}
