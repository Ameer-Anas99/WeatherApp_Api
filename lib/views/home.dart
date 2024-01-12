import 'package:flutter/material.dart';
import 'package:weather_app/model/weather_model.dart';
import 'package:weather_app/services/weather_app_client.dart';
import 'package:weather_app/views/Additional_information.dart';
import 'package:weather_app/views/current_weather.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  WeatherApiClient client = WeatherApiClient();

  Weather? data;

  Future<void> getData() async {
    data = await client.getCurrentWeather("jammu&kashmir");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 242, 240, 240),
        appBar: AppBar(
          backgroundColor: Colors.teal,
          title: const Text(
            "Weather App",
            style: TextStyle(color: Colors.black, fontSize: 25),
          ),
          centerTitle: true,
        ),
        body: FutureBuilder(
          future: getData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    currentWeather(
                        "https://as1.ftcdn.net/v2/jpg/05/40/96/04/1000_F_540960411_hNVtizDHbT4neQe6pya8Vn8XQqvcKrQ3.jpg",
                        "${data!.temp!.toStringAsFixed(1)}\u00B0C",
                        "${data!.cityName}"),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "Additional Information",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    const Divider(),
                    const SizedBox(
                      height: 20,
                    ),
                    additionalInformation("${data!.wind}", "${data!.humidity}",
                        "${data!.pressure}", "${data!.feel_like}")
                  ],
                ),
              );
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }
            return Container();
          },
        ));
  }
}
